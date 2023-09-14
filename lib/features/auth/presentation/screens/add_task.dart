import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/core/utils/appcolors.dart';
import 'package:todoapp/features/auth/presentation/cubit/task_state.dart';
import 'package:todoapp/features/auth/presentation/cubit/taskcuit.dart';

class Addtesk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Appcolor.primary,
        appBar: AppBar(
          backgroundColor: Appcolor.primary,
          automaticallyImplyLeading: false,
          elevation: 0,
          actions: [],
          centerTitle: true,
          title: Text(
            "Add Task",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: Form(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<Taskcubit, Taskstate>(
                builder: (context, state) => Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Title',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Title",
                          fillColor: Appcolor.grey,
                          filled: true,
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          '  Note',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "  Enter Your Note",
                          fillColor: Appcolor.grey,
                          filled: true,
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          '  Date',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () async {
                                BlocProvider.of<Taskcubit>(context)
                                    .getdata(context);
                              },
                              icon: Icon(Icons.calendar_month_sharp)),
                          hintText: DateFormat.yMd().format(
                              BlocProvider.of<Taskcubit>(context).currentDate),
                          fillColor: Appcolor.grey,
                          filled: true,
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 50,
                          width: 150,
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () async {
                                      BlocProvider.of<Taskcubit>(context)
                                          .getdata2(context);
                                    },
                                    icon: Icon(Icons.timer)),
                                hintText: BlocProvider.of<Taskcubit>(context)
                                    .starttime,
                                fillColor: Appcolor.grey,
                                filled: true,
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                focusedBorder: OutlineInputBorder()),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 150,
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () async {
                                      BlocProvider.of<Taskcubit>(context)
                                          .getdata3(context);
                                    },
                                    icon: Icon(Icons.timer)),
                                hintText:
                                    BlocProvider.of<Taskcubit>(context).endtime,
                                fillColor: Appcolor.grey,
                                filled: true,
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                focusedBorder: OutlineInputBorder()),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 100,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              Text(
                                " Color ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              itemBuilder: (BuildContext context, int index) {
                                // Color Getcolor(index) {
                                //   switch (index) {
                                //     case 0:
                                //       return Colors.amber;
                                //     case 1:
                                //       return Colors.redAccent;
                                //     case 2:
                                //       return Colors.cyan;
                                //     case 3:
                                //       return Colors.orange;
                                //     case 4:
                                //       return Colors.teal;
                                //     case 5:
                                //       return Colors.grey;
                                //     default:
                                //       return Colors.black;
                                //   }
                                // }
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      BlocProvider.of<Taskcubit>(context)
                                          .getdata4(index);
                                    },
                                    child: CircleAvatar(
                                        child: index ==
                                                BlocProvider.of<Taskcubit>(
                                                        context)
                                                    .currentindex
                                            ? Icon(Icons.check)
                                            : null,
                                        radius: 25,
                                        backgroundColor:
                                            BlocProvider.of<Taskcubit>(context)
                                                .Getcolor(index)),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 250,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(23)),
                        onPressed: () {},
                        color: Color.fromARGB(255, 155, 47, 250),
                        child: Text("ADD TASK"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
