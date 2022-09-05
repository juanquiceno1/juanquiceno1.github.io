part of 'information_bloc.dart';

abstract class InformationState extends Equatable {
  const InformationState();

  @override
  List<Object> get props => [];
}

class InformationInitial extends InformationState {}

class InformationInitialState extends InformationState {}

class Loading extends InformationState {}

class LoadingReportState extends InformationState {}

class InformationReport2State extends InformationState {
  final RetiredContractsListModel data;
  const InformationReport2State({required this.data});
}

class InformationReport3State extends InformationState {
  final InformationListModel data;
  const InformationReport3State({required this.data});
}

class InformationReport4State extends InformationState {
  final AbsenteeismListModel data;
  const InformationReport4State({required this.data});
}

class InformationReportErrorState extends InformationState {}

class InformationSuccess extends InformationState {
  final List<InformationModel> information;
  final String totalMen;
  final String totalWomen;
  final List rangeAge;
  final List rangeAgeMen;
  final List rangeAgeWomen;
  final List loads;
  final List loadsMen;
  final List loadsWomen;
  const InformationSuccess({
    required this.information,
    required this.totalMen,
    required this.totalWomen,
    required this.rangeAge,
    required this.rangeAgeMen,
    required this.rangeAgeWomen,
    required this.loads,
    required this.loadsMen,
    required this.loadsWomen,
  });
}

class InformationErrorState extends InformationState {
  final String title;
  final String message;

  const InformationErrorState({
    required this.title,
    required this.message,
  });
}
