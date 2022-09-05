part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardInitialState extends DashboardState {}

class Loading extends DashboardState {}

class DashboardUserSuccess extends DashboardState {
  final UserModel user;
  const DashboardUserSuccess({required this.user});
}

class DashboardErrorState extends DashboardState {
  final String title;
  final String message;

  const DashboardErrorState({
    required this.title,
    required this.message,
  });
}
