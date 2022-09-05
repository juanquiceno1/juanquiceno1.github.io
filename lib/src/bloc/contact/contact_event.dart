part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class ContactInitialEvent extends ContactEvent {}

class ContactGetDataEvent extends ContactEvent {}
