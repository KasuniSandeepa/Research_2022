import 'dart:async';
import 'dart:convert';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:giff_dialog/giff_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:sipfaa_app/models/response.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:audioplayers/audioplayers.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import '../screens/services/notification_service.dart';

class buildChatBar extends StatefulWidget {
  final Function(dynamic message, dynamic check, dynamic volume)
      callbackFunction;
  final Function() endSpeak;

  buildChatBar(
      {Key? key,
      required Function(dynamic message, dynamic check, dynamic volume)
          this.callbackFunction,
      required Function() this.endSpeak})
      : super(key: key);

  @override
  buildChatBarState createState() => buildChatBarState();
}

class buildChatBarState extends State<buildChatBar> {
  final TextEditingController _requestController = TextEditingController();
  FocusNode _focus = FocusNode();
  String getRequest = "";
  String getRes = "";
  String chat_string = "";
  bool check_string = false;
  bool volume = true;
  String time = "";
  String time_param = "";
  bool showSend = false;
  final player = AudioPlayer();

  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  double _confidence = 1.0;

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    _speech = stt.SpeechToText();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    setState(() {
      showSend = true;
    });
    debugPrint("Focus: ${_focus.hasFocus.toString()}");
  }

  void onTapCancel() {
    setState(() {
      showSend = false;
    });
  }

  Future<void> _listen() async {
    widget.endSpeak();
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() async {
            _text = val.recognizedWords;
            _requestController.text = _text;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
              await widget.callbackFunction(_text, true, volume);
              await getResponse(_text);
              setState(() async {
                await Future.delayed(Duration(seconds: 1));
                _requestController.clear();
              });
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  displaySnackBar(time, time_param, message) async {
    var snackBar = SnackBar(
      content: Text('Reminding $message', style: TextStyle(fontSize: 15)),
      backgroundColor: Colors.green[200],
    );
    time = int.parse(time);
    await player.setSource(AssetSource('bell.wav'));
    await player.setVolume(0.5);
    if (time_param == "seconds") {
      NotificationService().showNotification(1,'SIPFAA Reminder' , 'Reminding $message', time);
      TimerStream([time, time_param], Duration(seconds: time))
          .listen((i) async => {
                showDialog(
                  context: context,
                  builder: (_) => AssetGiffDialog(
                    onlyOkButton: true,
                    buttonOkColor: const Color(0xff809b7b),
                    image: Image.asset(
                      "assets/reminder.gif",
                      fit: BoxFit.fill,
                    ),
                    title: const Text(
                      "Reminder...",
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.w600),
                    ),
                    description: Text(
                      'Reminding $message',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 19.0),
                    ),
                    entryAnimation: EntryAnimation.top,
                    onOkButtonPressed: () {
                      setState(() {});
                      Navigator.pop(context);
                    },
                  ),
                ),
                await player.resume()
              });
    } else {
      NotificationService().showNotification(1,'SIPFAA Reminder' , 'Reminding $message', time);
      await TimerStream([time, time_param], Duration(minutes: time))
          .listen((i) async => {
                showDialog(
                  context: context,
                  builder: (_) => AssetGiffDialog(
                    onlyOkButton: true,
                    buttonOkColor: const Color(0xff809b7b),
                    image: Image.asset(
                      "assets/reminder.gif",
                      fit: BoxFit.fill,
                    ),
                    title: const Text(
                      "Reminder...",
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.w600),
                    ),
                    description: Text(
                      'Reminding $message',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 19.0),
                    ),
                    entryAnimation: EntryAnimation.top,
                    onOkButtonPressed: () {
                      setState(() {});
                      Navigator.pop(context);
                    },
                  ),
                ),
                await player.resume()
              });
      // TimerStream([time, time_param], Duration(minutes: time))
      //     .listen((i) => ScaffoldMessenger.of(context).showSnackBar(snackBar));
      await player.setSource(AssetSource('assets/bell.wav'));
    }
  }

  Future getResponse(String message) async {
    var res = <Response>[];
    var url = Uri.parse('http://192.168.1.4/webhooks/rest/webhook');
    var response = await http.post(url, body: jsonEncode(<String, String>{'sender': '' , 'message': message}));
    Iterable list = json.decode(response.body);
    res = list.map((model) => Response.fromJson(model)).toList();
    for (var i = 0; i < res.length; i++) {
      chat_string = res[i].text;
      check_string = chat_string.contains(RegExp('&'), 0);
      if(check_string){
        chat_string = res[i].text.split('&')[1];
        var message = res[i].text.split('remind')[1];
        time = res[i].text.split(' ')[10];
        time_param = res[i].text.split(' ')[11];
        displaySnackBar(time, time_param, message);
      }
      widget.callbackFunction(chat_string, false, volume);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
      height: 100,
      child: Row(
        children: [
          AvatarGlow(
            animate: _isListening,
            glowColor: Color(0xff2aa10d),
            endRadius: 25.0,
            duration: const Duration(milliseconds: 3000),
            repeatPauseDuration: const Duration(milliseconds: 100),
            repeat: false,
            child: FloatingActionButton(
              elevation: 0.0,
              backgroundColor: Colors.white,
              foregroundColor: Color(0xff809b7b),
              onPressed:  _listen,
              child: Icon(_isListening ? Icons.mic : Icons.mic_none,size: 28),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        (volume) ? volume = false : volume = true;
                        widget.endSpeak();
                      });
                    },
                    child: Icon(
                      (volume) ? Icons.volume_up : Icons.volume_off,
                      color: Colors.grey[500],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type your message ...',
                        hintStyle: TextStyle(color: Colors.grey[500]),
                      ),
                      controller: _requestController,
                      focusNode: _focus,
                      onSubmitted: (val) async {
                        await widget.callbackFunction(val, true, volume);
                        await getResponse(val);
                        setState(() {
                          _requestController.clear();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary:  Color(0xff809b7b),
              shape: CircleBorder(),
              padding: EdgeInsets.all(15),
            ),
            onPressed:  () async {
              await widget.callbackFunction(_requestController.text,true,volume);
              await getResponse(_requestController.text);
              setState(() {
                _requestController.clear();
              });
            },
            child: Icon( Icons.send),
          ),

        ],
      ),
    );
  }
}
