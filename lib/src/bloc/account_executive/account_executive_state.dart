part of 'account_executive_bloc.dart';

abstract class AccountExecutiveState extends Equatable {
  const AccountExecutiveState();

  @override
  List<Object> get props => [];
}

class AccountExecutiveInitial extends AccountExecutiveState {}

class AccountExecutiveInitialState extends AccountExecutiveState {}

class AccountExecutiveDataState extends AccountExecutiveState {
  final AccountExcecutiveModel account;
  const AccountExecutiveDataState(this.account);
}

class AccountExecutiveLoadingState extends AccountExecutiveState {}

class AccountExecutiveErrorState extends AccountExecutiveState {
  final String title;
  final String message;

  const AccountExecutiveErrorState({
    required this.title,
    required this.message,
  });
}
