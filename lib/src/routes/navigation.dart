import 'package:client/src/bloc/account_executive/account_executive_bloc.dart';
import 'package:client/src/bloc/contact/contact_bloc.dart';
import 'package:client/src/bloc/information/information_bloc.dart';
import 'package:client/src/pages/contact/contact_screen.dart';
import 'package:client/src/pages/dashboard/account_executive/account_executive.dart';
import 'package:client/src/pages/selection/manage_process/candidates_preselected/candidates_preselected_screen.dart';
import 'package:client/src/pages/selection/manage_process/hired/hired_screen.dart';
import 'package:client/src/pages/selection/manage_process/schedule_appointment/schedule_appointment_customer_screen.dart';
import 'package:client/src/pages/selection/personal_request/personal_request_screen.dart';
import 'package:flutter/material.dart';

import '../pages/dashboard/collaborator/collaborator_screen.dart';
import '../pages/error/error_load_screen.dart';
import '../pages/login/login_resetore_password.dart';
import '../pages/login/login_screen.dart';
import '../pages/login/recover_password.dart';
import '../pages/login/restore_password.dart';
import '../pages/reports/management/detail_other_report.dart';
import '../pages/request_report/request_report_screen.dart';
import '../pages/selection/manage_process/hired/candidate_process_detail/candidate_process_detail_screen.dart';
import '../pages/selection/manage_process/hired/process_detail/employees_detail_customer_screen.dart';
import '../pages/selection/manage_process/manage_process_screen.dart';
import '../pages/selection/state_process/process_detail/process_detail_screen.dart';
import '../pages/selection/state_process/state_process_screen.dart';
import '../pages/splash/splash_screen.dart';
import '../pages/view_page/view_pager.dart';

navigateToSplash(BuildContext context) =>
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (BuildContext context) => SplashScreen(),
          settings: RouteSettings(
            name: SplashScreen.routeName,
          ),
        ),
        (Route route) => false);

navigateToErrorLoad(BuildContext context) =>
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (BuildContext context) => ErrorLoadScreen(),
          settings: RouteSettings(
            name: ErrorLoadScreen.routeName,
          ),
        ),
        (Route route) => false);

navigateCanPop(BuildContext context) => Navigator.canPop(context);

navigatePop(BuildContext context, bool pop) => Navigator.of(context).pop(pop);

navigateToLogin(BuildContext context) =>
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen(),
          settings: RouteSettings(name: LoginScreen.routeName),
        ),
        (Route route) => false);

navigateToLoginUntil(BuildContext context) =>
    Navigator.of(context).popUntil(ModalRoute.withName(LoginScreen.routeName));

navigateToRecoverPassword(BuildContext context) => Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => RecoverPasswordScreen(),
        settings: RouteSettings(
          name: RecoverPasswordScreen.routeName,
        ),
      ),
    );

navigateToRestorePassword(BuildContext context) => Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => RestorePasswordScreen(),
        settings: RouteSettings(
          name: RestorePasswordScreen.routeName,
        ),
      ),
    );

navigateToLoginRestorePassword(BuildContext context) =>
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => LoginRestorePasswordScreen(),
        settings: RouteSettings(
          name: LoginRestorePasswordScreen.routeName,
        ),
      ),
    );

navigateToContact(BuildContext context, ContactBloc bloc) =>
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => ContactScreen(
          contactBloc: bloc,
        ),
        settings: RouteSettings(
          name: ContactScreen.routeName,
        ),
      ),
    );

navigateToViewPage(BuildContext context) =>
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (BuildContext context) => ViewPagerScreen(),
          settings: RouteSettings(name: ViewPagerScreen.routeName),
        ),
        (Route route) => false);

navigateToCollaborator(BuildContext context) => Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => CollaboratorScreen(),
        settings: RouteSettings(
          name: CollaboratorScreen.routeName,
        ),
      ),
    );

navigateToAccountExecutive(BuildContext context, AccountExecutiveBloc bloc) =>
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => AccountExecutiveScreen(
          accountExecutiveBloc: bloc,
        ),
        settings: RouteSettings(
          name: AccountExecutiveScreen.routeName,
        ),
      ),
    );

navigateToRequestReport(BuildContext context) => Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RequestReportScreen(),
        settings: RouteSettings(
          name: RequestReportScreen.routeName,
        ),
      ),
    );

navigateToPersonalRequest(BuildContext context) => Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PersonalRequestScreen(),
        settings: RouteSettings(
          name: PersonalRequestScreen.routeName,
        ),
      ),
    );

navigateToStateProcess(BuildContext context) => Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => StateProcessScreen(),
        settings: RouteSettings(name: StateProcessScreen.routeName),
      ),
    );

navigateToProcessDetail(BuildContext context) => Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProcessDetailScreen(),
        settings: RouteSettings(
          name: ProcessDetailScreen.routeName,
        ),
      ),
    );

navigateToManageProcess(BuildContext context) => Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ManageProcessScreen(),
        settings: RouteSettings(
          name: ManageProcessScreen.routeName,
        ),
      ),
    );

navigateToEmployeesDetail(BuildContext context) => Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EmployeesDetailScreen(),
        settings: RouteSettings(
          name: EmployeesDetailScreen.routeName,
        ),
      ),
    );

navigateToCandidatesPreSelected(BuildContext context) =>
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CandidatesPreSelectedScreen(),
        settings: RouteSettings(
          name: CandidatesPreSelectedScreen.routeName,
        ),
      ),
    );
navigateToScheduleAppointment(BuildContext context) =>
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ScheduleAppointmentScreen(),
        settings: RouteSettings(
          name: ScheduleAppointmentScreen.routeName,
        ),
      ),
    );
navigateToHired(BuildContext context) => Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HiredScreen(),
        settings: RouteSettings(
          name: HiredScreen.routeName,
        ),
      ),
    );

navigateToCandidateProcessDetail(BuildContext context) =>
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CandidateProcessDetailScreen(),
        settings: RouteSettings(
          name: CandidateProcessDetailScreen.routeName,
        ),
      ),
    );

navigateToDetailOtherReport(
  BuildContext context,
  InformationBloc informationBloc,
  String title,
  int report,
) =>
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailOtherReportScreen(
          title: title,
          informationBloc: informationBloc,
          report: report,
        ),
        settings: RouteSettings(
          name: DetailOtherReportScreen.routeName,
        ),
      ),
    );
