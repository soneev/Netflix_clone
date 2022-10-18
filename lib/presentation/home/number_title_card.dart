import 'package:flutter/material.dart';
import 'package:netflix/presentation/home/number_card.dart';

import '../../core/colors/constants.dart';
import '../../widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({Key? key, required this.posterList}) : super(key: key);
  final List<String> posterList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: "Top 10 TV Shows in India Today"),
        khight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => NumberCard(
                index: index,
                imageUrl: posterList[index],
              ),
            ),
          ),
        )
      ],
    );
  }
}
