import 'package:crud_operations/core/theme/text.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBarMessage(
    context, String content,
    {Color? color}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color ?? Colors.red,
      content: Text(content),
      dismissDirection: DismissDirection.horizontal,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        textColor: Colors.white,
        label: AppText.snackBarClose,
        onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
      ),
    ),
  );
}

// Parolalar Eşleşmiyor  