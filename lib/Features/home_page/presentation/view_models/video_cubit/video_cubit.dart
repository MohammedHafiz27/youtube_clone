import 'package:bloc/bloc.dart';
import 'package:youtube_clone/Features/home_page/data/models/search/search.dart';
import 'package:youtube_clone/Features/home_page/data/repos/home_repo.dart';
part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit(this.homeRepo) : super(VideoInitial());
  final HomeRepo homeRepo;
  SearchModel? searchModel;
  Future<void> getSearchData(String searchQuery) async {
    emit(VideoLoading());
    var resultEither = await homeRepo.getSearchData(searchQuery);
    resultEither.fold((failure) => emit(VideoFailure(errorMessage: failure.errorMessage)), (data) {
      searchModel = data;
      emit(VideoSuccess());
    });
  }
}
