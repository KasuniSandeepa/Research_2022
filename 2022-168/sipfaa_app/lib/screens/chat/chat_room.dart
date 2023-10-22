import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:sipfaa_app/models/message_model.dart';
import 'package:sipfaa_app/widget/conversation.dart';
import '../../widget/chat_bar.dart';

final _buildChatBar = GlobalKey<buildChatBarState>();

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  List<Message> messageList = [];
  String getRequest = "";
  final FlutterTts flutterTts = FlutterTts();


  speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.setSpeechRate(0.4);
    await flutterTts.speak(text);
  }

  stopSpeak() async {
    await flutterTts.speak('');
  }

  callback(message,check,volume){
    setState(() {
      getRequest = message;
      messageList.add(Message(text: message, check: check));
      if(!check && volume){
        speak(message);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapCancel:  () => {
          print("xxxxxx"),
        _buildChatBar.currentState?.onTapCancel(),
      },
      child: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          return stopSpeak();
        },
        child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            toolbarHeight: 130,
            backgroundColor: Color(0xff809b7b),
            title: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color(0xff809b7b),
                  radius: 30,
                  backgroundImage: AssetImage("assets/robot.png"),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('SIPFAA Assistant'),
                    Text(
                      'Chat With SIPFAA',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            elevation: 0,
          ),
          backgroundColor: const Color(0xff809b7b),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 100,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    child: Conversation(getMessageList: messageList),
                  ),
                ),
              ),
              buildChatBar(callbackFunction:callback, endSpeak:stopSpeak, key: _buildChatBar,)
            ],
          ),
        ),
      ),
    );
  }
}
