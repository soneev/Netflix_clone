import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class VideoWidgets extends StatelessWidget {
  final String url;
  const VideoWidgets({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 250,
          width: double.infinity,
          child: Image.network(
            url,

            //"https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/7ABsaBkO1jA2psC8Hy4IDhkID4h.jpg",
            fit: BoxFit.fill,
            loadingBuilder:
                (BuildContext, Widget child, ImageChunkEvent? progress) {
              if (progress == null) {
                return child;
              } else {
                return const Center(
                    child: CircularProgressIndicator(
                  strokeWidth: 2,
                ));
              }
            },
            errorBuilder: (BuildContext _, Object a, StackTrace? trace) {
              return const Center(
                  child: Icon(
                Icons.wifi,
                color: Colors.white,
              ));
            },
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.black.withOpacity(0.5),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_up,
                color: kWhitecolor,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
