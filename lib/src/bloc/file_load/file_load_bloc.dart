import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

part 'file_load_event.dart';
part 'file_load_state.dart';

class FileLoadBloc extends Bloc<FileLoadEvent, FileLoadState> {
  PlatformFile file = PlatformFile(name: '', size: 0);
  FileLoadBloc() : super(FileLoadInitial()) {
    on<FileLoadEvent>((event, emit) {});
    on<FileLoadInitialEvent>((event, emit) => emit(FileLoadInitialState()));
    on<FileLoadAddEvent>(_addFile);
  }

  void _addFile(FileLoadAddEvent event, Emitter<FileLoadState> emit) async {
    try {
      file = event.file;
      emit(FileLoadSuccessState());
    } catch (e) {
      file = PlatformFile(name: '', size: 0);
      emit(FileLoadInitialState());
    }
  }
}
