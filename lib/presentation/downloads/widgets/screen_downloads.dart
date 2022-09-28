import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);

  final _widgetList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              titile: 'Downloads',
            )),
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (ctx, index) => _widgetList[index],
            separatorBuilder: (ctx, index) => const SizedBox(
                  height: 25,
                ),
            itemCount: _widgetList.length));
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.settings,
          color: kWhitecolor,
        ),
        width,
        Text('Smart Downloads')
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({Key? key}) : super(key: key);
  final List imageList = [
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/z2yahl2uefxDCl0nogcRBstwruJ.jpg",
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/jRXYjXNq0Cs2TcJjLkki24MLp7u.jpg",
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/3qO7wycn6o0lUJf15dupMFbEBTY.jpg"

    // "https://www.themoviedb.org/t/p/original/2C9vyK6leWDb2ds65R7uIwSmh8V.jpg",
    // "https://www.themoviedb.org/t/p/original/2TMCurQcQjYOPAnnbnd550cRfMH.jpg",
    // "https://www.themoviedb.org/t/p/original/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Introducing Downloads For You',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kWhitecolor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        khight,
        const Text(
          'Netflix is a streaming service that offers a wide variety of award-winning TV shows, movies, anime, documentaries and more – on thousands of internet-connected devices.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        khight,
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(alignment: Alignment.center, children: [
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.5),
                radius: size.width * 0.4,
              ),
            ),
            DownloadsImageWidget(
              imageList: imageList[2],
              margin: const EdgeInsets.only(left: 170, top: 50),
              angle: 25,
              size: Size(size.width * .35, size.width * .55),
            ),
            DownloadsImageWidget(
              imageList: imageList[1],
              margin: const EdgeInsets.only(right: 170, top: 50),
              angle: -25,
              size: Size(size.width * .35, size.width * .55),
            ),
            DownloadsImageWidget(
              imageList: imageList[0],
              margin: const EdgeInsets.only(bottom: 35, top: 50),
              size: Size(size.width * .4, size.width * .6),
              radius: 10,
            )
          ]),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: kbuttoncolorblue,
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Set up',
                style: TextStyle(
                  color: kWhitecolor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        khight,
        MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: kWhitecolor,
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can download ?',
              style: TextStyle(
                color: Kblackcolor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.radius = 10,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageList)),
              borderRadius: BorderRadius.circular(radius)),
        ),
      ),
    );
  }
}























// class ScreenDownloads extends StatelessWidget {
//   ScreenDownloads({Key? key}) : super(key: key);
//   final _widgetList = [
//     const _SmartDownloadWidget(),
//     Section2(),
//     const Section3(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: const PreferredSize(
//             preferredSize: Size.fromHeight(50),
//             child: AppBarWidget(
//               titile: "Downloads",
//             )),
//         body: ListView.separated(
//             padding: EdgeInsets.all(10),
//             itemBuilder: (context, index) => _widgetList[index],
//             separatorBuilder: (context, index) => SizedBox(
//                   height: 25,
//                 ),
//             itemCount: _widgetList.length));
//   }
// }

// class Section3 extends StatelessWidget {
//   const Section3({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           width: double.infinity,
//           child: MaterialButton(
//             onPressed: () {},
//             color: kbuttoncolorblue,
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//             child: const Padding(
//               padding: EdgeInsets.symmetric(vertical: 10),
//               child: Text("Setup",
//                   style: TextStyle(
//                     color: kWhitecolor,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   )),
//             ),
//           ),
//         ),
//         khight,
//         MaterialButton(
//           onPressed: () {},
//           color: kWhitecolor,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//           child: const Padding(
//             padding: EdgeInsets.symmetric(vertical: 10),
//             child: Text("See what you can Download",
//                 style: TextStyle(
//                   color: Kblackcolor,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 )),
//           ),
//         )
//       ],
//     );
//   }
// }

// class Section2 extends StatelessWidget {
//   Section2({Key? key}) : super(key: key);
//   final List imageList = [
//     "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/z2yahl2uefxDCl0nogcRBstwruJ.jpg",
//     "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/jRXYjXNq0Cs2TcJjLkki24MLp7u.jpg",
//     "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/3qO7wycn6o0lUJf15dupMFbEBTY.jpg"
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     return Column(
//       children: [
//         const Text(
//           "Introducing Downloads for you",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//               color: kWhitecolor, fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         khight,
//         const Text(
//             "We will Download a personalised selection of \movies and shows for you, so there is \always something to watch on your \device ",
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 16, color: Colors.grey)),
//         khight,
//         SizedBox(
//           width: size.width,
//           height: size.width,
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               Center(
//                 child: CircleAvatar(
//                   radius: size.width * 0.4,
//                   backgroundColor: Colors.grey.withOpacity(0.5),
//                 ),
//               ),
//               DownloadsImageWidget(
//                 imageList: imageList[2],
//                 margin: const EdgeInsets.only(left: 170, top: 50),
//                 angle: 25,
//                 size: Size(size.width * .35, size.width * .55),
//               ),
//               DownloadsImageWidget(
//                 imageList: imageList[0],
//                 margin: const EdgeInsets.only(right: 170, top: 50),
//                 angle: -25,
//                 size: Size(size.width * 0.35, size.width * 0.55),
//               ),
//               DownloadsImageWidget(
//                 imageList: imageList[1],
//                 radius: 10,
//                 margin: const EdgeInsets.only(bottom: 35, top: 50),
//                 size: Size(size.width * .4, size.width * .6),
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _SmartDownloadWidget extends StatelessWidget {
//   const _SmartDownloadWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: const [
//         width,
//         Icon(
//           Icons.settings,
//           color: kWhitecolor,
//         ),
//         width,
//         Text("Smart Downloads"),
//       ],
//     );
//   }
// }

// class DownloadsImageWidget extends StatelessWidget {
//   const DownloadsImageWidget(
//       {Key? key,
//       required this.imageList,
//       this.angle = 0,
//       required this.margin,
//       required this.size,
//       this.radius = 10})
//       : super(key: key);

//   final String imageList;
//   final double angle;
//   final EdgeInsets margin;
//   final Size size;
//   final double radius;

//   @override
//   Widget build(BuildContext context) {
//     // final Size size = MediaQuery.of(context).size;
//     return Padding(
//       padding: margin,
//       child: Transform.rotate(
//         angle: angle * pi / 180,
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(radius),
//           child: Container(
//               margin: margin,
//               width: size.width,
//               height: size.height,
//               decoration: BoxDecoration(
//                   // color: Colors.amber,
//                   // borderRadius: BorderRadius.circular(radius),
//                   image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: NetworkImage(imageList),
//               ))),
//         ),
//       ),
//     );
//   }
// }
