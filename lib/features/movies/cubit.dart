import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_dio/core/logic/dio_helper.dart';

part 'states.dart';
part 'model.dart';

class MoviesCubit extends Cubit<MoviesStates>{
  MoviesCubit():super(MoviesStates());

  List<MovieModel> _list=[];
  bool isFromLoading=true;
  bool isFromPagination=false;
  int currentPage=1;

  Future<void> getMoviesData() async {
    if(isFromLoading){
      isFromLoading=false;
      isFromPagination=true;
      emit(MoviesLoadingState());
    }else if(isFromPagination){
      emit(MoviesPaginationState(msg: "Loading more data ..."));
    }

    final response =await DioHelper.get("discover/movie",data: {
      "api_key":"57e0a42fc4766f9d273c03090ff54a67",
      "page":currentPage
    });

    if(response.isSucess){
      final model=MoviesData.fromJson(response.data);

      //if(model.totalPages >= currentPage){
      if(5 > currentPage){
        _list.addAll(model.movies);
        currentPage ++;
        emit(MoviesSuccessState(dataList: _list));
      }else{
        emit(MoviesPaginationFinishedState(msg: "There is no more data"));
      }
    }else{
      print("Error:- ${response.msg}");
      emit(MoviesFailedState(msg: response.msg));
    }

  }

}