part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginInitialEvent extends LoginEvent {}

class LoginClientEvent extends LoginEvent {
  final AuthModel model;
  const LoginClientEvent(this.model);
}

class LoginRecoverEvent extends LoginEvent {
  final String document;
  const LoginRecoverEvent({required this.document});
}

class LoginUserEvent extends LoginEvent {
  final BuildContext context;
  const LoginUserEvent({required this.context});
}
