import 'package:flutter/material.dart';

void showLoading(BuildContext context, String message,
    {bool isCancleable = true}) {
  showDialog(
      barrierDismissible: isCancleable,
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  width: 5,
                ),
                Text(message),
              ],
            ),
          ],
        );
      });
}

void hideLoading(BuildContext context) {
  Navigator.pop(context);
}

void showMsg(BuildContext context, String message, String actionName,
    VoidCallback callbackActionName,
    {bool iscancelAble = true}) {
  showDialog(
      barrierDismissible: iscancelAble,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(onPressed: callbackActionName, child: Text(actionName)),
          ],
        );
      });
}
