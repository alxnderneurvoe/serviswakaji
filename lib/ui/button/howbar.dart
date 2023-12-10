// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:app_servis/model/note.dart';
import 'package:app_servis/navigasi/nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

class AboutUsWeb extends StatelessWidget {
  AboutUsWeb({super.key});
  final Uri _url = Uri.parse('https://alxnderneurvoe.carrd.co/');

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
        onPressed: _launchUrl,
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.language,
          size: 28,
          color: darkbrown,
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}

class ChatAdmin extends StatelessWidget {
  const ChatAdmin({super.key});

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
          CupertinoIcons.bubble_left,
          size: 28,
          color: darkbrown,
        ),
      ),
    );
  }
}
