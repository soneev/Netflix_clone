import 'package:dartz/dartz.dart';

import 'package:netflix/domain/downloads/models/downloads.dart';

import '../core/failures/main_failure.dart';

abstract class IDownloadsRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages();
}
