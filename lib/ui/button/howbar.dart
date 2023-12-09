import 'package:app_servis/model/note.dart';
import 'package:app_servis/navigasi/nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HowToBookButton extends StatelessWidget {
  const HowToBookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.0),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: FloatingActionButton(
        onPressed: () {
          navigateToHowToBook(context);
        },
        backgroundColor: Colors.white,
        child: const Icon(
          CupertinoIcons.question_circle,
          size: 28,
          color: darkbrown,
        ),
      ),
    );
  }
}
