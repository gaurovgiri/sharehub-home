import 'package:flutter/material.dart';
import 'package:sharehub_home/resources/app_theme.dart';

class FloatingNav extends StatelessWidget implements PreferredSizeWidget {
  const FloatingNav({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Card(
          color: theme.cardColor,
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16))),
          margin: EdgeInsets.only(top: 0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
              border: Border(
                left: BorderSide(color: AppTheme.borderColor, width: 0.5),
                right: BorderSide(color: AppTheme.borderColor, width: 0.5),
                bottom: BorderSide(color: AppTheme.borderColor, width: 0.5),
              ),
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.article_outlined),
                  tooltip: 'Articles',
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  tooltip: 'Search',
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_outlined),
                  tooltip: 'Notifications',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}
