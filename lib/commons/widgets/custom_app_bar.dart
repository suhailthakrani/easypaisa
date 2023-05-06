import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      flexibleSpace: Container(
        height: 150,
        padding: EdgeInsets.only(left: 4),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF00A651),
              Color(0xFF008447),
            ],
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'easy',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'paisa',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
      leading: Container(
        margin: const EdgeInsets.only(left: 8, top: 8, bottom: 8, right: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(
            'https://media.licdn.com/dms/image/C5603AQGvsNAtmfjNuw/profile-displayphoto-shrink_800_800/0/1588472394505?e=2147483647&v=beta&t=n-pgBP7C6VvtejV9iaQ2HEZQqnxwr6VWvHKjRreS_s0',
          ),
        ),
      ),
      actions: [
        Wrap(
          children: [
            IconButton(
              icon: const Icon(Icons.search),
              color: Colors.white,
              onPressed: () {
                // Implement search functionality
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications_outlined),
              color: Colors.white,
              onPressed: () {
                // Implement notification functionality
              },
            ),
          ],
        ),
      ],
    );
  }
}
