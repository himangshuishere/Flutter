import 'package:flutter/material.dart';
import 'package:netflix_clone/assets.dart';
import 'package:netflix_clone/widgets/widgets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, this.scrollOffset = 0.0}) : super(key: key);

  final double scrollOffset;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
        color: Colors.black
            .withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
        child: Responsive(
          mobile: _CustomAppBarMobile(),
          desktop: _CustomAppBarDesktop(),
        ));
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  const _CustomAppBarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                _AppBarButton(title: "My List", on_tap: () => print("My List")),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  const _CustomAppBarDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo1),
          const SizedBox(width: 12.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(title: "Home", on_tap: () => print("Home")),
                _AppBarButton(
                    title: "TV Shows", on_tap: () => print("TV Shows")),
                _AppBarButton(title: "Movies", on_tap: () => print("Movies")),
                _AppBarButton(title: "Latest", on_tap: () => print("Latest")),
                _AppBarButton(title: "My List", on_tap: () => print("My List")),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.search_rounded),
                  iconSize: 28.0,
                  onPressed: () => print('Search'),
                  color: Colors.white,
                ),
                _AppBarButton(title: "KIDS", on_tap: () => print("KIDS")),
                _AppBarButton(title: "DVD", on_tap: () => print("DVD")),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.card_giftcard),
                  iconSize: 28.0,
                  onPressed: () => print('GiftCard'),
                  color: Colors.white,
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.notifications),
                  iconSize: 28.0,
                  onPressed: () => print('Notifications'),
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
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
