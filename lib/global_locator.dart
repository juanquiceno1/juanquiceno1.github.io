import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import 'src/repository/account_executive/account_executive_repository.dart';
import 'src/repository/auth/login_repository.dart';
import 'src/repository/auth/recover/recover_repository.dart';
import 'src/repository/contact/contact_repository.dart';
import 'src/repository/dashboard/dashboard_user_repository.dart';
import 'src/repository/information/information_repository.dart';
import 'src/repository/network/api_repository.dart';

late GetIt global;

void setUpGlobalLocator() {
  global = GetIt.I;
  global.registerLazySingleton(() => Logger());
  global.registerLazySingleton<APIRepository>(() => DefaultAPIRepository());
  global.registerLazySingleton<LoginRepository>(() => LoginDefault());
  global.registerLazySingleton<RecoverRepository>(() => RecoverDefault());
  global.registerLazySingleton<DashboardRepository>(() => DashboardDefault());
  global
      .registerLazySingleton<InformationRepository>(() => InformationDefault());
  global.registerLazySingleton<AccountExecutiveRepository>(
      () => AccountExecutiveDefault());
  global.registerLazySingleton<ContactRepository>(() => ContactDefault());
}
