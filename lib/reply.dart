import 'package:flutter/material.dart';

class Reply extends StatelessWidget {

  final String text;
  final void Function() onSelection;

  Reply(this.text, this.onSelection);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onSelection,
        child: Text(text),
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
          onPrimary: Colors.white,
        ),
      ),
    );
  }
}