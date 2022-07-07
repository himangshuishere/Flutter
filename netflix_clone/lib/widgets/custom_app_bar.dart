import 'package:flutter/material.dart';
import 'package:netflix_clone/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, this.scrollOffset = 0.0}) : super(key: key);

  final double scrollOffset;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      color:
          Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: SafeArea(
        child: Row(
          children: [
            Image.asset(Assets.netflixLogo0),
            const SizedBox(width: 12.0),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _AppBarButton(
                      title: "TV Shows", on_tap: () => print("TV Shows")),
                  _AppBarButton(title: "Movies", on_tap: () => print("Movies")),
                  _AppBarButton(
                      title: "My List", on_tap: () => print("My List")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  const _AppBarButton({
    Key? key,
    required this.title,
    required this.on_tap,
  }) : super(key: key);

  final String title;
  final VoidCallback on_tap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: on_tap,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
