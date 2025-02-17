import 'package:assignmenttrackerapp/common/constants/global_scaffold_key.dart';
import 'package:flutter/material.dart';

void showErrorMessage(String message) {
  scaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ),
  );
}

void showSuccessMessage(String message) {
  scaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
    ),
  );
}
