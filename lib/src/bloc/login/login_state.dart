part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginInitialState extends LoginState {}

class LoginSuccesState extends LoginState {}

class Loading extends LoginState {}

class LoginRecoverSuccessState extends LoginState {}

class LoginErrorState extends LoginState {
  final String title;
  final String message;

  const LoginErrorState({
    required this.title,
    required this.message,
  });
}

class FinishWithError extends LoginState {
  final String error;

  const FinishWithError({required this.error});

  @override
  String toString() => '$runtimeType { error }';
}
