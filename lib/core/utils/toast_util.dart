import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:roqqu/resources/colors.dart';

extension ToastUtil on BuildContext {
  void showErrorMessage({String? message}) {
    showSimpleNotification(
      Text(message ?? 'An error occurred'),
      background: AppColors.sell,
    );
  }

  void showSuccessMessage({String? message}) {
    showSimpleNotification(
      Text(message ?? 'Success'),
      background: AppColors.primaryColor,
    );
  }

  void showUnavailableMessage() {
    showSimpleNotification(
      Text('Feature not available at the moment, please try again later'),
      background: AppColors.sell,
    );
  }
}
