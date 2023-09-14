import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/features/auth/presentation/cubit/task_state.dart';

class Taskcubit extends Cubit<Taskstate> {
  DateTime currentDate = DateTime.now();
  int currentindex = 0;
  DateTime start = DateTime(2023);
  String starttime = DateFormat('hh:mm a').format(DateTime.now());
  String endtime =
      DateFormat('hh:mm a').format(DateTime.now().add(Duration(minutes: 40)));

  Taskcubit() : super(taskstateinit());
  void getdata(context) async {
    emit(Getdateloadingstate());

    DateTime? picheddate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2025));
    if (picheddate != null) {
      currentDate = picheddate;
      emit(Getdatesuccessstate());
    } else {
      print("eroor");
      emit(Getdateerrrorstate());
    }
  }

  void getdata2(context) async {
    emit(Getstartdateloadingstate());
    TimeOfDay? pichedtme = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );
    if (pichedtme != null) {
      starttime = pichedtme.format(context);
      emit(Getstartsuccessstate());
    } else {}
  }

  void getdata3(context) async {
    emit(Getenddateloadingstate());
    TimeOfDay? pichedendme = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );
    if (pichedendme != null) {
      endtime = pichedendme.format(context);
      emit(Getenddatesuccesstate());
    } else {}
  }

  Color Getcolor(index) {
    return switch (index) {
      0 => Colors.amber,
      1 => Colors.redAccent,
      2 => Colors.cyan,
      3 => Colors.orange,
      4 => Colors.teal,
      5 => Colors.grey,
      _ => Colors.black
    };
  }

  void getdata4(index) {
    currentindex = index;
    emit(changeindex());
  }
}
