// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:app_servis/model/note.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void showDeleteConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Delete Account Confirmation"),
        content: const Text("Are you sure you want to delete your account?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Cancel",
              style: TextStyle(
                color: darkbrown,
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              await deleteAccount(context);
            },
            child: const Text(
              "Delete",
              style: TextStyle(
                color: darkbrown,
              ),
            ),
          ),
        ],
      );
    },
  );
}

Future<void> deleteAccount(BuildContext context) async {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    try {
      await user.delete();
      print('Account deleted successfully.');

      Navigator.pushReplacementNamed(context, '/');
    } catch (e) {
      print('Error deleting account: $e');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error deleting account: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
