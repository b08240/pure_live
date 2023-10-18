
import 'package:get/get.dart';
import 'package:pure_live/common/index.dart';
import 'package:pure_live/modules/live_play/widgets/video_player/video_controller.dart';
import 'package:pure_live/modules/live_play/widgets/video_player/video_controller_panel.dart';
import 'package:media_kit_video/media_kit_video.dart' as media_kit_video;

class VideoPlayer extends StatefulWidget {
  final VideoController controller;
  const VideoPlayer({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Widget _buildVideoFrame() {
    return Obx(() => media_kit_video.Video(
          key: widget.controller.key,
          controller: widget.controller.mediaPlayerController,
          fit: widget.controller.videoFit.value,
          controls: (state) => _buildVideoPanel(state),
        ));
  }

  Widget _buildVideoPanel(media_kit_video.VideoState state) {
    return VideoControllerPanel(
      controller: widget.controller,
    );
  }

  Widget _buildPlayer() {
    return Stack(
      children: [_buildVideoFrame()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildPlayer();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
