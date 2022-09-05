part of 'account_executive_bloc.dart';

abstract class AccountExecutiveEvent extends Equatable {
  const AccountExecutiveEvent();

  @override
  List<Object> get props => [];
}

class AccountExecutiveInitialEvent extends AccountExecutiveEvent {}

class AccountExecutiveGetDataEvent extends AccountExecutiveEvent {}
