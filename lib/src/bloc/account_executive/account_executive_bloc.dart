import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../global_locator.dart';
import '../../models/account_executive/account_execute_model.dart';
import '../../repository/account_executive/account_executive_repository.dart';

part 'account_executive_event.dart';
part 'account_executive_state.dart';

class AccountExecutiveBloc
    extends Bloc<AccountExecutiveEvent, AccountExecutiveState> {
  AccountExecutiveBloc() : super(AccountExecutiveInitial()) {
    on<AccountExecutiveInitialEvent>(
        (event, emit) => emit(AccountExecutiveInitialState()));

    on<AccountExecutiveGetDataEvent>(_informationGetDataState);
  }

  void _informationGetDataState(AccountExecutiveGetDataEvent event,
      Emitter<AccountExecutiveState> emit) async {
    try {
      final api = global<AccountExecutiveRepository>();
      emit(AccountExecutiveLoadingState());
      Map<String, dynamic> resultApi = await api.data();
      if (resultApi['statusCode'] == 200 || resultApi['statusCode'] == 201) {
        emit(
          AccountExecutiveDataState(
            AccountExcecutiveModel.fromJson(
              resultApi,
            ),
          ),
        );
      } else {
        emit(AccountExecutiveErrorState(title: '', message: ''));
      }
    } catch (e) {
      emit(AccountExecutiveErrorState(title: '', message: ''));
    }
  }
}
