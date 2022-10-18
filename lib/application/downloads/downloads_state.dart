part of 'downloads_bloc.dart';

@freezed
class DownloadsState with _$DownloadsState {
  //------------------------------
  const factory DownloadsState({
    required bool isloading,
    required List<Downloads> downloads,
    required Option<Either<MainFailure, List<Downloads>>>
        downloadsFailureOrSuccessOption,
  }) = _DownloadsState;
//--------------------------------------------

//------------------------
  factory DownloadsState.inital() {
    return DownloadsState(
      isloading: false,
      downloadsFailureOrSuccessOption: none(),
      downloads: [],
    );
  }

//----------------------------------

}
