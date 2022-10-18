import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/search/search_response/search_resp.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix/domain/search/search_response/search_service.dart';

import '../../domain/core/api_end_points.dart';

@LazySingleton(as: SearchService)
class SearchImpl implements SearchService {
  @override
  Future<Either<MainFailure, SearchResp>> searchMovies(
      {required String movieQuery}) async {
    try {
      final response = await Dio(BaseOptions()).get(
        ApiEndPoints.search,
        queryParameters: {
          'query': movieQuery,
        },
      );
      // debugPrint(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        // to change dynamic data to download list
        final result = SearchResp.fromJson(response.data);

        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioError catch (e) {
      debugPrint(e.toString());
      return const Left(
        MainFailure.clientFailure(),
      );
    } catch (e) {
      debugPrint(e.toString());
      return const Left(
        MainFailure.clientFailure(),
      );
    }
  }
}
