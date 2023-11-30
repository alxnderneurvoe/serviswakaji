// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void showDeleteConfirmationDialog(
    BuildContext context, DocumentSnapshot vehicle) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Delete Confirmation"),
        content: const Text("Are you sure you want to delete this item?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              deleteVehicle(vehicle);
              Navigator.pop(context);
            },
            child: const Text("Delete"),
          ),
        ],
      );
    },
  );
}

void deleteVehicle(DocumentSnapshot vehicle) async {
  try {
    await vehicle.reference.delete();

    print("Vehicle deleted successfully");
  } catch (e) {
    print("Error deleting vehicle: $e");
  }
}
