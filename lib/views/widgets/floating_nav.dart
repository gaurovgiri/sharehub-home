import 'package:flutter/material.dart';

class FloatingNav extends StatelessWidget {
  const FloatingNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Card(
          color: Colors.white,
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
              side: BorderSide(color: Colors.grey, width: 0.5)),
          margin: EdgeInsets.only(top: 0),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.zero),
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
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
}
