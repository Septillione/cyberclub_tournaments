import 'package:cyberclub_tournaments/core/error/app_exception.dart';
import 'package:cyberclub_tournaments/domain/usecases/auth/login_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc({required LoginUseCase loginUseCase})
    : _loginUseCase = loginUseCase,
      super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      await _loginUseCase(event.email, event.password);
      emit(LoginSuccess());
    } on AppException catch (e) {
      emit(LoginFailure(errorMessage: e.message));
    } catch (e) {
      emit(LoginFailure(errorMessage: 'Что-то пошло не так'));
    }
  }
}
