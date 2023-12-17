// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import '../../model/note.dart';
import '../../navigasi/nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HowToBookButton extends StatelessWidget {
  const HowToBookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'How To Book',
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: IconButton(
          onPressed: () {
            navigateToHowToBook(context);
          },
          icon: Icon(
            CupertinoIcons.question_circle,
            size: 35,
            color: darkbrown,
          ),
        ),
      ),
    );
  }
}

class ChatAdmin extends StatelessWidget {
  ChatAdmin({super.key});

  final Uri _url = Uri.parse('https://wa.me/6281370612244');

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Chat Admin',
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: IconButton(
          onPressed: _launchUrl,
          icon: Icon(
            CupertinoIcons.bubble_left,
            size: 35,
            color: darkbrown,
          ),
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

class AboutUsWeb extends StatelessWidget {
  AboutUsWeb({super.key});
  final Uri _url = Uri.parse('https://alxnderneurvoe.carrd.co/');

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Open Website', // Add your hint text here
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: IconButton(
          onPressed: _launchUrl,
          icon: Icon(
            Icons.language,
            size: 35,
            color: darkbrown,
          ),
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
