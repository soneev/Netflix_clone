import 'package:flutter/material.dart';
import 'package:netflix/presentation/search/widgets/search_result.dart';

class SearchIdel extends StatelessWidget {
  const SearchIdel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SearchResultWidget());
  }
}


        // SafeArea(
        //     child: Padding(
        //   padding: const EdgeInsets.all(10.0),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       CupertinoSearchTextField(
        //         backgroundColor: Colors.grey.withOpacity(0.3),
        //         prefixIcon: const Icon(
        //           CupertinoIcons.search,
        //           color: Colors.grey,
        //         ),
        //         suffixIcon: const Icon(
        //           CupertinoIcons.xmark_circle_fill,
        //           color: Colors.grey,
        //         ),
        //         style: const TextStyle(color: Colors.white),
        //       ),
        //       khight,
        //       // Expanded(child: const SearchIdelWidget())
        //       Expanded(child: const SearchResultWidget())
        //     ],
        //   ),
        // )),
