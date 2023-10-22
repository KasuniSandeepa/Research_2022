import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final List<Widget> horizontalList;
  final String title;

  Section({required this.title, required this.horizontalList});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 45.0),
      child: Column(
        children: <Widget>[
          SectionTitle((title != null) ? title : ''),
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            scrollDirection: Axis.horizontal,
            child:
                Row(children: (horizontalList != null) ? horizontalList : []),
          )
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String _text;

  const SectionTitle(this._text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          _text,
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
