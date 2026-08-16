import 'package:flutter/material.dart';

class FriendRequestWidget extends StatelessWidget {
  final String imageUrl;
  final String username;
  final String highlight;

  final VoidCallback? onAccept;
  final VoidCallback? onReject;

  const FriendRequestWidget({
    super.key,
    required this.imageUrl,
    required this.username,
    required this.highlight,
    this.onAccept,
    this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:12,vertical:5),
      child: Container(
        height: 80,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(42),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // Profile image
            ClipOval(
              child: Image.network(
                imageUrl,
                height: 58,
                width: 58,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 58,
                    width: 58,
                    color: Colors.grey.shade300,
                    child: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
      
            const SizedBox(width: 12),
      
            // Username + highlight
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
      
                  const SizedBox(height: 4),
      
                  Text(
                    highlight,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
      
            const SizedBox(width: 8),
      
            // Reject
            _ActionButton(
              icon: Icons.close_rounded,
              backgroundColor: Colors.grey.shade200,
              iconColor: Colors.black87,
              onTap: onReject,
            ),
      
            const SizedBox(width: 8),
      
            // Accept
            _ActionButton(
              icon: Icons.check_rounded,
              backgroundColor: const Color(0xFFB5FF4A),
              iconColor: Colors.black,
              onTap: onAccept,
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback? onTap;

  const _ActionButton({
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          height: 48,
          width: 48,
          child: Icon(
            icon,
            color: iconColor,
            size: 25,
          ),
        ),
      ),
    );
  }
}