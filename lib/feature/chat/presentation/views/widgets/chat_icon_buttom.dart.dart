import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class ChatIconButton extends StatelessWidget {
  const ChatIconButton({super.key, this.onPressed, this.unreadCount = 0});

  final VoidCallback? onPressed;
  final int unreadCount;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onPressed,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // 🔵 icon container
            Container(
              height: 38,
              width: 38,
              decoration: BoxDecoration(
                color: AppColor.kPrimaryColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.chat_bubble_outline,
                  color: AppColor.kPrimaryColor,
                  size: 20,
                ),
              ),
            ),

            // unread badge
            if (unreadCount > 0)
              Positioned(
                top: -2,
                right: -2,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    unreadCount > 99 ? "99+" : "$unreadCount",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
