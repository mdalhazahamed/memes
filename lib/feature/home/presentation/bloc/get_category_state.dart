part of 'get_category_bloc.dart';

@immutable
abstract class GetMemesState {}

class AuthInitial extends GetMemesState {}

class GetMemesErrorState extends GetMemesState {
  final String errorMsg;
  GetMemesErrorState(this.errorMsg);
}

class GetMemesLoadingState extends GetMemesState {
  GetMemesLoadingState();
}

class GetMemesSuccessState extends GetMemesState {
  final GetMemesResponseEntity getMemesResponseEntity;
  GetMemesSuccessState(this.getMemesResponseEntity);
}
