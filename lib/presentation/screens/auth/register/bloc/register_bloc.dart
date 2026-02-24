import 'package:cyberclub_tournaments/core/error/app_exception.dart';
import 'package:cyberclub_tournaments/domain/usecases/auth/register_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterBloc({required RegisterUseCase registerUseCase})
    : _registerUseCase = registerUseCase,
      super(RegisterInitial()) {
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  Future<void> _onRegisterSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    emit(RegisterLoading());
    try {
      await _registerUseCase(
        email: event.email,
        password: event.password,
        nickname: event.nickname,
      );
      emit(RegisterSuccess());
    } on AppException catch (e) {
      emit(RegisterFailure(errorMessage: e.message));
    } catch (e) {
      emit(RegisterFailure(errorMessage: 'Что-то пошло не так'));
    }
  }
}
