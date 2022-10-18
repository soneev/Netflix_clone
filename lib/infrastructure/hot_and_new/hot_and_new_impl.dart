import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/api_end_points.dart';
import 'package:netflix/domain/hot_and_new/model/hot_and_new_resp.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix/domain/hot_and_new/model/hot_and_new_service.dart';

@LazySingleton(as: HotAndNewService)
class HotAndNewImplementation implements HotAndNewService {
  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewMovieData() async {
    try {
      final response = await Dio(BaseOptions()).get(
        ApiEndPoints.HotAndNewMovie,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // to change dynamic data to download list
        final result = HotAndNewResp.fromJson(response.data);

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

  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewTvData() async {
    try {
      final response = await Dio(BaseOptions()).get(
        ApiEndPoints.HotAndNewTv,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // to change dynamic data to download list
        final result = HotAndNewResp.fromJson(response.data);

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
