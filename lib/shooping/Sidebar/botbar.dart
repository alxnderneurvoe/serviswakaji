// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonBottomBar extends StatefulWidget {
  const ButtonBottomBar({super.key});

  @override
  _ButtonBottomBarState createState() => _ButtonBottomBarState();
}

class _ButtonBottomBarState extends State<ButtonBottomBar> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (!isExpanded)
          FloatingActionButton(
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            backgroundColor: Colors.white,
            child: const Icon(
              Icons.menu,
              size: 35,
              color: Colors.amberAccent,
            ),
          ),
        if (isExpanded)
          Positioned(
            bottom: 80,
            right: 1,
            child: HowToBookButton(),
          ),
        if (isExpanded)
          Positioned(
            bottom: 150,
            right: 1,
            child: ChatAdmin(),
          ),
      ],
    );
  }
}

class HowToBookButton extends StatelessWidget {
  const HowToBookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: FloatingActionButton(
        onPressed: () {
          // navigateToHowToBook(context);
        },
        backgroundColor: Colors.white,
        child: const Icon(
          CupertinoIcons.question_circle,
          size: 28,
          color: Colors.amberAccent,
        ),
      ),
    );
  }
}

class ChatAdmin extends StatelessWidget {
  const ChatAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(400),
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
          // navigateToHowToBook(context);
        },
        backgroundColor: Colors.white,
        child: const Icon(
          CupertinoIcons.bubble_left,
          size: 28,
          color: Colors.amberAccent,
        ),
      ),
    );
  }
}
