part of 'file_load_bloc.dart';

abstract class FileLoadEvent extends Equatable {
  const FileLoadEvent();

  @override
  List<Object> get props => [];
}

class FileLoadInitialEvent extends FileLoadEvent {}

class FileLoadAddEvent extends FileLoadEvent {
  final PlatformFile file;
  const FileLoadAddEvent({required this.file});
}
