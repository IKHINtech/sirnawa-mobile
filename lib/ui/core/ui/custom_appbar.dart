import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onLeadingTap;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onLeadingTap,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: GestureDetector(
        onTap: onLeadingTap ?? () => context.pop(),
        child: Container(
          margin: EdgeInsets.only(left: 6, bottom: 6),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      title: Text(title),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
