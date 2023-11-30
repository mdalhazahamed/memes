part of 'get_category_bloc.dart';

@immutable
abstract class GetMemesEvent {}

class LoadingGetMemesEvent extends GetMemesEvent {}

class ErrorGetMemesEvent extends GetMemesEvent {
  final String errorMsg;
  ErrorGetMemesEvent(this.errorMsg);
}

class RequestGetMemesEvent extends GetMemesEvent {
  RequestGetMemesEvent();
}
