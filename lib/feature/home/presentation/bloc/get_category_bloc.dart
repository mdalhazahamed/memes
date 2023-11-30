import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../api_gatway/repositories/home_repository/home_repostitory.dart';
import '../../domain/entities/response_get_memes_entity.dart';

part 'get_category_event.dart';

part 'get_category_state.dart';

class GetMemesBloc extends Bloc<GetMemesEvent, GetMemesState> {
  GetMemesBloc() : super(AuthInitial()) {
    on<LoadingGetMemesEvent>((event, emit) => emit(GetMemesLoadingState()));
    on<ErrorGetMemesEvent>(_onErrorAuth);
    on<RequestGetMemesEvent>(_onRequestAuth);
  }

  get path => null;

  Future<void> _onRequestAuth(final RequestGetMemesEvent event, final Emitter<GetMemesState> emit) async {
    emit(GetMemesLoadingState());
    final GetMemesRepository _repository = GetMemesRepositoryImpl();
    // final ServiceCategoryUseCase _useCase = ServiceCategoryUseCase(authRepository: _repository);
    final GetMemesResponseEntity? _entity = await _repository.getMemes();
    if (_entity != null) {
      emit(GetMemesSuccessState(_entity));
    } else {
      emit(GetMemesErrorState("Unable to get service memes"));
    }
  }

  Future<void> _onErrorAuth(final ErrorGetMemesEvent event, final Emitter<GetMemesState> emit) async {
    emit(GetMemesErrorState(event.errorMsg));
  }
}
