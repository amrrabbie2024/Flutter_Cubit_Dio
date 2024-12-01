part of 'cubit.dart';

class MoviesStates{}

class MoviesLoadingState extends MoviesStates{}

class MoviesFailedState extends MoviesStates{
  final String msg;

  MoviesFailedState({required this.msg});
}

class MoviesSuccessState extends MoviesStates{
  final List<MovieModel> dataList;

  MoviesSuccessState({required this.dataList});
}

class MoviesPaginationState extends MoviesStates{
  final String? msg;

  MoviesPaginationState({ this.msg});
}

class MoviesPaginationFinishedState extends MoviesStates{
  final String? msg;

  MoviesPaginationFinishedState({this.msg});
}

