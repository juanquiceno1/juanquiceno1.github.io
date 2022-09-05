part of 'file_load_bloc.dart';

abstract class FileLoadState extends Equatable {
  const FileLoadState();

  @override
  List<Object> get props => [];
}

class FileLoadInitial extends FileLoadState {}

class FileLoadInitialState extends FileLoadState {}

class FileLoadSuccessState extends FileLoadState {}
