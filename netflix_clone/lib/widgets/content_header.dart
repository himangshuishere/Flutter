import 'package:flutter/material.dart';
import 'package:netflix_clone/models/content_model.dart';
import 'package:netflix_clone/widgets/widgets.dart';
import 'package:video_player/video_player.dart';

class ContentHeader extends StatelessWidget {
  const ContentHeader({Key? key, required this.featuredContent})
      : super(key: key);

  final Content featuredContent;

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _ContentHeaderMobile(featuredContent: featuredContent),
      desktop: _ContentHeaderDesktop(
        featuredContent: featuredContent,
      ),
    );
  }
}

class _ContentHeaderMobile extends StatelessWidget {
  const _ContentHeaderMobile({
    Key? key,
    required this.featuredContent,
  }) : super(key: key);

  final Content featuredContent;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(featuredContent.imageUrl),
                  fit: BoxFit.cover)),
        ),
        Container(
          height: 500.0,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 110.0,
          child: SizedBox(
            width: 250.0,
            child: Image.asset(featuredContent.titleImageUrl as String),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                onPressed: () => print('My List'),
                title: 'List',
                icon: Icons.add,
              ),
              _PlayButton(),
              VerticalIconButton(
                onPressed: () => print('Info'),
                title: 'Info',
                icon: Icons.info_outline,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ContentHeaderDesktop extends StatefulWidget {
  const _ContentHeaderDesktop({
    Key? key,
    required this.featuredContent,
  }) : super(key: key);

  final Content featuredContent;

  @override
  State<_ContentHeaderDesktop> createState() => _ContentHeaderDesktopState();
}

class _ContentHeaderDesktopState extends State<_ContentHeaderDesktop> {
  late VideoPlayerController _videoController;
  bool isMuted = true;

  @override
  void initState() {
    _videoController =
        VideoPlayerController.network(widget.featuredContent.videoUrl!)
          ..initialize().then((value) => setState(() {}))
          ..setVolume(0.0)
          ..play();
    super.initState();
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _videoController.value.isPlaying
          ? _videoController.pause()
          : _videoController.play(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
            aspectRatio: _videoController.value.isInitialized
                ? _videoController.value.aspectRatio
                : 2.344,
            child: _videoController.value.isInitialized
                ? VideoPlayer(_videoController)
                : Image.asset(
                    widget.featuredContent.imageUrl,
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned(
            bottom: -1.0,
            left: 0,
            right: 0,
            child: AspectRatio(
              aspectRatio: _videoController.value.isInitialized
                  ? _videoController.value.aspectRatio
                  : 2.344,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 60.0,
            right: 60.0,
            bottom: 50.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250.0,
                  child: Image.asset(widget.featuredContent.titleImageUrl!),
                ),
                const SizedBox(width: 15.0),
                Text(
                  widget.featuredContent.description!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                          color: Colors.black,
                          offset: Offset(2.0, 4.0),
                          blurRadius: 6.0)
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    _PlayButton(),
                    const SizedBox(width: 16),
                    FlatButton.icon(
                      padding:
                          const EdgeInsets.fromLTRB(25.0, 10.0, 30.0, 10.0),
                      onPressed: () => print('More Info'),
                      icon: const Icon(
                        Icons.info_outline,
                        size: 30.0,
                      ),
                      label: const Text('More Info',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600)),
                      color: Colors.white,
                    ),
                    const SizedBox(width: 16),
                    if (_videoController.value.isInitialized)
                      IconButton(
                        icon:
                            Icon(isMuted ? Icons.volume_off : Icons.volume_up),
                        onPressed: () => setState(() {
                          isMuted
                              ? _videoController.setVolume(1.0)
                              : _videoController.setVolume(0.0);
                          isMuted = _videoController.value.volume == 0;
                        }),
                        color: Colors.white,
                        iconSize: 30.0,
                      )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      padding: !Responsive.isDesktop(context)
          ? const EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0)
          : const EdgeInsets.fromLTRB(25.0, 10.0, 30.0, 10.0),
      onPressed: () => print('Play'),
      color: Colors.white,
      icon: const Icon(
        Icons.play_arrow,
        size: 30.0,
      ),
      label: const Text(
        'Play',
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
      ),
    );
  }
}
