import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../global_locator.dart';
import '../../models/user/user_model.dart';
import '../../repository/dashboard/dashboard_user_repository.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  UserModel user = UserModel.fromJson({});
  DashboardBloc() : super(DashboardInitial()) {
    on<DashboardInitialEvent>((event, emit) => emit(DashboardInitialState()));

    // Eventos Colaborador
    on<DashboardUserEvent>(_loginColaboratorState);
  }

  void _loginColaboratorState(
      DashboardUserEvent event, Emitter<DashboardState> emit) async {
    final api = global<DashboardRepository>();
    try {
      emit(Loading());
      Map<String, dynamic> resultApi = await api.user();
      if (resultApi['statusCode'] == 200 || resultApi['statusCode'] == 201) {
        print(resultApi);
        user = UserModel.fromJson(resultApi);
        emit(DashboardUserSuccess(user: user));
      } else {
        emit(DashboardErrorState(
          title: 'Upsss',
          message:
              'Tenemos problemas para cargar los datos, intenta nuevamente',
        ));
      }
    } catch (e) {
      emit(DashboardErrorState(
        title: 'Upsss',
        message: 'Tenemos problemas para cargar los datos, intenta nuevamente',
      ));
    }
  }
}
