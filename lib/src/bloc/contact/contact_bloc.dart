import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../global_locator.dart';
import '../../models/contact/contact_model.dart';
import '../../repository/contact/contact_repository.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial()) {
    on<ContactInitialEvent>((event, emit) => emit(ContactInitialState()));

    on<ContactGetDataEvent>(_contactGetDataState);
  }

  void _contactGetDataState(
      ContactGetDataEvent event, Emitter<ContactState> emit) async {
    try {
      final api = global<ContactRepository>();
      emit(ContactLoadingState());
      Map<String, dynamic> resultApi = await api.data();
      if (resultApi['statusCode'] == 200 || resultApi['statusCode'] == 201) {
        emit(ContactDataState(data: ContactListModel.fromJson(resultApi).data));
      } else {
        emit(ContactErrorState(title: '', message: ''));
      }
    } catch (e) {
      emit(ContactErrorState(title: '', message: ''));
    }
  }
}
