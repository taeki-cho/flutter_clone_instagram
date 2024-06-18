import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagePopup extends StatelessWidget {
  final String? title;
  final String? message;
  final Function()? okCallback;
  final Function()? cancelCallback;

  const MessagePopup(
      {required this.title,
      required this.message,
      required this.okCallback,
      this.cancelCallback,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 10,
            ),
            width: Get.width * 0.7,
            child: Column(
              children: [
                Text(
                  title!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  message!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: okCallback,
                  child: const Text('확인'),
                ),
                ElevatedButton(
                  onPressed: cancelCallback,
                  child: const Text('취소'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
