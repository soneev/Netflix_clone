import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/new_and_hot/widget/video_widgets.dart';
import 'package:netflix/widgets/custom_button.dart';

class EveryonesWatching extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;

  const EveryonesWatching(
      {super.key,
      required this.posterPath,
      required this.movieName,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        khight,
        Text(
          movieName,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        khight,
        Text(
          description,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(
          height: 50,
        ),
        VideoWidgets(
          url: posterPath,
        ),
        khight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButtonwidget(
              icon: Icons.share,
              iconsize: 25,
              titile: "share",
              textsize: 14,
            ),
            width,
            CustomButtonwidget(
              icon: Icons.add,
              iconsize: 25,
              titile: "My List",
              textsize: 14,
            ),
            width,
            CustomButtonwidget(
              icon: Icons.play_arrow,
              iconsize: 25,
              titile: "Play",
              textsize: 14,
            ),
            width
          ],
        )
      ],
    );
  }
}
