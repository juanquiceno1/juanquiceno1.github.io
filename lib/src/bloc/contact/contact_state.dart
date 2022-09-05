part of 'contact_bloc.dart';

abstract class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object> get props => [];
}

class ContactInitial extends ContactState {}

class ContactInitialState extends ContactState {}

class ContactLoadingState extends ContactState {}

class ContactDataState extends ContactState {
  final List<ContactDescriptionModel> data;
  const ContactDataState({required this.data});
}

class ContactErrorState extends ContactState {
  final String title;
  final String message;

  const ContactErrorState({
    required this.title,
    required this.message,
  });
}
