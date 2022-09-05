import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../utils/theme/colors.dart';
import '../../../../widget/appbar/app_bar_back.dart';
import '../../../../widget/buttons/secondary_button.dart';
import '../../../../widget/calendar/calendar_header.dart';
import '../../../../widget/calendar/event_calendar.dart';
import '../../../../widget/text_field/style3/text_field_text3.dart';

class ScheduleAppointmentScreen extends StatefulWidget {
  static const String routeName = 'schedule_appointment';
  const ScheduleAppointmentScreen({Key? key}) : super(key: key);
  @override
  State<ScheduleAppointmentScreen> createState() =>
      _ScheduleAppointmentScreenState();
}

class _ScheduleAppointmentScreenState extends State<ScheduleAppointmentScreen> {
  final ThemeData theme = ThemeData();
  DateTime date = DateTime.now();
  PageController _pageController = PageController();
  late final ValueNotifier<List<EventCalendar>> _selectedEvents;
  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());
  final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  String selectChild = '';

  FocusNode focusTitle = FocusNode();
  FocusNode focusGuests = FocusNode();
  FocusNode focusVideoCall = FocusNode();
  FocusNode focusLocation = FocusNode();
  FocusNode focusDescription = FocusNode();

  @override
  void initState() {
    super.initState();

    _selectedDays.add(_focusedDay.value);
    _selectedEvents = ValueNotifier(_getEventsForDay(_focusedDay.value));
  }

  @override
  void dispose() {
    _focusedDay.dispose();
    _selectedEvents.dispose();
    _pageController.dispose();
    focusTitle.dispose();
    focusGuests.dispose();
    focusVideoCall.dispose();
    focusLocation.dispose();
    focusDescription.dispose();
    super.dispose();
  }

  bool get canClearSelection =>
      _selectedDays.isNotEmpty || _rangeStart != null || _rangeEnd != null;

  List<EventCalendar> _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  List<EventCalendar> _getEventsForDays(Iterable<DateTime> days) {
    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  List<EventCalendar> _getEventsForRange(DateTime start, DateTime end) {
    final days = daysInRange(start, end);
    return _getEventsForDays(days);
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      if (_selectedDays.contains(selectedDay)) {
        _selectedDays.remove(selectedDay);
      } else {
        _selectedDays.add(selectedDay);
      }

      _focusedDay.value = focusedDay;
      _rangeStart = null;
      _rangeEnd = null;
      _rangeSelectionMode = RangeSelectionMode.toggledOff;
    });

    _selectedEvents.value = _getEventsForDays(_selectedDays);
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _focusedDay.value = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _selectedDays.clear();
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _content(context),
    );
  }

  Widget _content(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            AppBarBack(
              title: 'Agendar Cita',
            ),
            _calendar(context),
            _addAppointment(context)
          ],
        ),
      );

  Widget _addAppointment(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'ESCOJE LA HORA',
                style: Theme.of(context).primaryTextTheme.subtitle1,
              ),
            ),
            SizedBox(height: 10),
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 4,
              runSpacing: 2,
              children: <Widget>[
                _chilp(context, '9:00 AM'),
                _chilp(context, '10:00 AM'),
                _chilp(context, '11:00 AM'),
                _chilp(context, '12:00 PM'),
                _chilp(context, '2:00 PM'),
                _chilp(context, '3:00 PM'),
                _chilp(context, '4:00 PM'),
              ],
            ),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Detalles Evento',
                style: Theme.of(context).primaryTextTheme.subtitle1,
              ),
            ),
            SizedBox(height: 10),
            TextFieldText3(
              description: 'Añade Titulo',
              focusNode: focusTitle,
              focusNext: focusGuests,
              inputAction: TextInputAction.next,
            ),
            SizedBox(height: 10),
            TextFieldText3(
              description: 'Añade Invitados',
              focusNode: focusGuests,
              focusNext: focusVideoCall,
              inputAction: TextInputAction.next,
            ),
            SizedBox(height: 10),
            TextFieldText3(
              description: 'Añade Videollamada',
              focusNode: focusVideoCall,
              focusNext: focusLocation,
              inputAction: TextInputAction.next,
            ),
            SizedBox(height: 10),
            TextFieldText3(
              description: 'Añade Ubicacion',
              focusNode: focusLocation,
              focusNext: focusDescription,
              inputAction: TextInputAction.next,
            ),
            SizedBox(height: 10),
            TextFieldText3(
              description: 'Añade Descripcion',
              focusNode: focusDescription,
              inputAction: TextInputAction.done,
            ),
            SizedBox(height: 30),
            SecondaryButton(
                labelText: 'AGENDAR',
                isEnabled: true,
                size: 80,
                onPressed: () {}),
            SizedBox(height: 50)
          ],
        ),
      );

  Widget _chilp(BuildContext context, String item) => ChoiceChip(
        // ActionChip(
        onSelected: (isSelected) => setState(() {
          selectChild = item;
        }),
        label: Text(
          item.toString(),
          style: TextStyle(fontSize: 13.sp),
        ),
        padding: EdgeInsets.all(8),
        labelStyle: TextStyle(
            fontSize: 13.sp,
            color:
                selectChild == item ? AppColors.white : AppColors.primaryColor),
        selected: true,
        selectedColor:
            selectChild == item ? AppColors.primaryColor : AppColors.white,
        side: BorderSide(color: AppColors.primaryColor),
        backgroundColor: AppColors.white,
      );

  Widget _calendar(BuildContext context) => Column(
        children: [
          SizedBox(
            height: 10,
          ),
          ValueListenableBuilder<DateTime>(
            valueListenable: _focusedDay,
            builder: (context, value, _) {
              return CalendarHeader(
                focusedDay: value,
                clearButtonVisible: canClearSelection,
                onTodayButtonTap: () {
                  setState(() => _focusedDay.value = DateTime.now());
                },
                onClearButtonTap: () {
                  setState(() {
                    _rangeStart = null;
                    _rangeEnd = null;
                    _selectedDays.clear();
                    _selectedEvents.value = [];
                  });
                },
                onLeftArrowTap: () {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
                onRightArrowTap: () {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
              );
            },
          ),
          TableCalendar<EventCalendar>(
            locale: 'es_ES',
            firstDay: date,
            lastDay: DateTime(date.year + 10),
            focusedDay: _focusedDay.value,
            headerVisible: false,
            selectedDayPredicate: (day) => _selectedDays.contains(day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getEventsForDay,
            holidayPredicate: (day) {
              // Every 20th day of the month will be treated as a holiday
              return day.day == 20;
            },
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            onCalendarCreated: (controller) => _pageController = controller,
            onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() => _calendarFormat = format);
              }
            },
          ),
          SizedBox(height: 8.0),
          if (_selectedEvents.value.isNotEmpty)
            for (EventCalendar item in _selectedEvents.value)
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ListTile(
                  onTap: () => print('$item'),
                  title: Text('$item'),
                ),
              )
        ],
      );
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<EventCalendar>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = {
  for (var item in List.generate(50, (index) => index))
    DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5): List.generate(
      item % 4 + 1,
      (index) => EventCalendar('Event $item | ${index + 1}'),
    )
}..addAll({
    kToday: [
      EventCalendar('Today\'s Event 1'),
      EventCalendar('Today\'s Event 2'),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
