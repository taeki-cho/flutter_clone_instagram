import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clone_instagram/src/components/%08avatar_widget.dart';

class UserCard extends StatelessWidget {
  final String userId, description;
  const UserCard({required this.userId, required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 3,
      ),
      width: 150,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black12),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 15,
            bottom: 0,
            left: 15,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                AvatarWidget(
                  thumbPath:
                      'https://image.utoimage.com/preview/cp872722/2022/12/202212008462_500.jpg',
                  type: AvatarType.TYPE2,
                  size: 80,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  userId,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Follow'),
                ),
              ],
            ),
          ),
          Positioned(
            right: 5,
            top: 5,
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.close,
                size: 14,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
