import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:webkit/controller/my_controller.dart';

class CalenderController extends MyController {
  late DataSource events;

  @override
  void onInit() {
    super.onInit();
    events = addAppointments();
  }

  void dragEnd(AppointmentDragEndDetails appointmentDragEndDetails) {
    Appointment detail = appointmentDragEndDetails.appointment as Appointment;
    Duration duration = detail.endTime.difference(detail.startTime);

    DateTime start = DateTime(
        appointmentDragEndDetails.droppingTime!.year,
        appointmentDragEndDetails.droppingTime!.month,
        appointmentDragEndDetails.droppingTime!.day,
        appointmentDragEndDetails.droppingTime!.hour,
        0,
        0);

    final List<Appointment> appointment = <Appointment>[];
    events.appointments!.remove(appointmentDragEndDetails.appointment);

    events.notifyListeners(CalendarDataSourceAction.remove,
        <dynamic>[appointmentDragEndDetails.appointment]);

    Appointment app = Appointment(
      subject: detail.subject,
      color: detail.color,
      startTime: start,
      endTime: start.add(duration),
    );

    appointment.add(app);

    events.appointments!.add(appointment[0]);

    events.notifyListeners(CalendarDataSourceAction.add, appointment);
  }

  DataSource addAppointments() {
    List<Appointment> appointmentCollection = <Appointment>[];

    final DateTime today = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, DateTime.now().hour);
    appointmentCollection.add(Appointment(
        startTime: today,
        endTime: today.add(const Duration(hours: 1)),
        subject: 'Planning',
        color: Colors.green));
    appointmentCollection.add(Appointment(
        startTime: today.add(const Duration(days: 1, hours: 2)),
        endTime: today.add(const Duration(days: 1, hours: 3)),
        subject: 'Meeting',
        color: Colors.red));
    appointmentCollection.add(Appointment(
        startTime: today.add(const Duration(days: 1, hours: 1)),
        endTime: today.add(const Duration(days: 1, hours: 2)),
        subject: 'Retrospective',
        color: Colors.pink));
    appointmentCollection.add(Appointment(
        startTime: today.add(const Duration(days: 2, hours: 5)),
        endTime: today.add(const Duration(days: 2, hours: 6)),
        subject: 'Birthday',
        color: Colors.pink));
    appointmentCollection.add(Appointment(
        startTime: today.add(const Duration(days: 3, hours: 3)),
        endTime: today.add(const Duration(days: 3, hours: 4)),
        subject: 'Consulting',
        color: Colors.deepPurple));
    return DataSource(appointmentCollection);
  }
}

class DataSource extends CalendarDataSource {
  DataSource(List<Appointment> source) {
    appointments = source;
  }
}
