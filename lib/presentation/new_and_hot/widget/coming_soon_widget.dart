import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/new_and_hot/widget/video_widgets.dart';
import 'package:netflix/widgets/custom_button.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonWidget(
      {super.key,
      required this.id,
      required this.month,
      required this.day,
      required this.posterPath,
      required this.movieName,
      required this.description});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                month,
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),
              Text(
                day,
                style: const TextStyle(
                  fontSize: 30,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidgets(
                url: posterPath,
              ),
              width,
              khight,
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          letterSpacing: -1,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: const [
                      CustomButtonwidget(
                        icon: Icons.notifications,
                        iconsize: 20,
                        titile: "Remind me",
                        textsize: 14,
                      ),
                      width,
                      CustomButtonwidget(
                        icon: Icons.info,
                        iconsize: 20,
                        titile: "Info",
                        textsize: 14,
                      ),
                      width
                    ],
                  )
                ],
              ),
              width,
              Text("Coming on $day $month"),
              khight,
              Text(
                movieName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              khight,
              Text(
                description,
                maxLines: 4,
                style: const TextStyle(color: Colors.grey),
              )
            ],
          ),
        )
      ],
    );
  }
}
