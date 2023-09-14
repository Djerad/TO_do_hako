import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/core/utils/appassets.dart';
import 'package:todoapp/core/utils/appcolors.dart';
import 'package:todoapp/features/auth/data/model/taskmodel.dart';
import 'package:todoapp/features/auth/presentation/screens/add_task.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key); // Fix the constructor

  @override
  Widget build(BuildContext context) {
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

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: const TextStyle(color: Appcolor.white, fontSize: 25),
              ),
              const Text(
                "Today",
                style: TextStyle(color: Appcolor.white, fontSize: 25),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                height: 100,
                child: DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Colors.purple,
                  selectedTextColor: Colors.white,
                  dayTextStyle: const TextStyle(color: Colors.white),
                  dateTextStyle: const TextStyle(color: Colors.white),
                  monthTextStyle: const TextStyle(color: Colors.white),
                  onDateChange: (date) {
                    // New date selected
                    // You can use this callback to handle date changes if needed.
                  },
                ),
              ),
              const SizedBox(
                height: 21,
              ),
              Taskmodel.tasklist.isEmpty
                  ? No_task()
                  : Expanded(
                      child: ListView.builder(
                        itemCount: Taskmodel.tasklist.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  useSafeArea: true,
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 60,
                                            child: MaterialButton(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              color: Colors.lightBlue,
                                              onPressed: () {},
                                              child: const Text(
                                                  "  Task Completed "),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 60,
                                            child: MaterialButton(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              color: Colors.redAccent,
                                              onPressed: () {},
                                              child:
                                                  const Text("  delete Task "),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 60,
                                            child: MaterialButton(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              color: Colors.lightBlue,
                                              onPressed: () {},
                                              child: const Text(" Cancel "),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                margin: const EdgeInsets.all(8),
                                height: 150,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Getcolor(index)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: taskcomp(
                                    model: Taskmodel.tasklist[index],
                                  ),
                                ),
                              ));
                        },
                      ),
                    ),
            ],
          ),
        ),
        backgroundColor: Appcolor.primary,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Addtesk()),
            );
          },
          child: const Icon(
            Icons.add,
            color: Appcolor.primary,
          ),
        ),
      ),
    );
  }
}

class taskcomp extends StatelessWidget {
  taskcomp({
    super.key,
    required this.model,
  });
  final Taskmodel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.title,
              style: TextStyle(color: Appcolor.white, fontSize: 20),
            ),
            Row(
              children: [
                Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                Text(
                  "  ${model.starttime + "   " + "${model.endtime}  "}",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            Text(
              "${model.note}",
              style: TextStyle(color: Appcolor.white, fontSize: 20),
            ),
          ],
        ),
        const SizedBox(
          width: 50,
        ),
        Container(
          height: 100,
          width: 0.9,
          color: Colors.white,
        ),
        const RotatedBox(
          quarterTurns: 3,
          child: Text(
            " TODO ",
            style: TextStyle(color: Appcolor.white, fontSize: 20),
          ),
        ),
      ],
    );
  }
}

class No_task extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Image.asset(Appassets.onboar2)),
        const Center(
          child: Text(
            " What do you want To do Today",
            style: TextStyle(color: Appcolor.white, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
