part of 'information_bloc.dart';

abstract class InformationEvent extends Equatable {
  const InformationEvent();

  @override
  List<Object> get props => [];
}

class InformationInitialEvent extends InformationEvent {}

class InformationDataEvent extends InformationEvent {}

class InformationOtherReportEvent extends InformationEvent {
  final int typeInform;
  const InformationOtherReportEvent({required this.typeInform});
}

class InformationResetDateEvent extends InformationEvent {}
