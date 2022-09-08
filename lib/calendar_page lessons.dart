import 'dart:math';

import 'package:date_format/date_format.dart';
import 'package:date_picker_timeline_fixed/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:promina_task/widgets/task_container.dart';

import 'create_new_task_page.dart';

class CalendarPageLessons extends StatefulWidget {
  @override
  State<CalendarPageLessons> createState() => _CalendarPageLessonsState();
}

class _CalendarPageLessonsState extends State<CalendarPageLessons> {
  DateTime _selectedDate = DateTime.now();
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Colors.blue, Colors.white], stops: [0.5, 0.5]),
          ),
          child: ClipPath(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.blue, Colors.white], stops: [0.5, 0.5]),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(45),
                            ),
                            color: Colors.white,
                          ),
                          width: MediaQuery.of(context).size.width / 1.45,
                          height: 80,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(40, 0, 20, 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ImageIcon(
                                  AssetImage("images/hamburger.png"),
                                  color: Colors.black,
                                  size: 24,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(Icons.notifications_active)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width / 3.2,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(45),
                            ),
                          ),
                          child: Center(
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage('images/profile.jpg'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.blue,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(45), bottomLeft: Radius.circular(45)),
                      color: Colors.white,
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        40,
                        20,
                        40,
                        40,
                      ),
                      child: Column(
                        children: <Widget>[
                          //SizedBox(height: 30.0),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                            Text(
                              'My Task',
                              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
                            ),
                            Container(
                              height: 40.0,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CreateNewTaskPage(),
                                    ),
                                  );
                                },
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Today',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                formatDate(DateTime.now(), [DD, ', ', d, ' ', MM]),
                                style: TextStyle(fontSize: 15, color: Colors.blue.shade200),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          //SizedBox(height: 20.0),
                          DatePicker(
                            DateTime.now(),
                            initialSelectedDate: DateTime.now(),
                            monthTextStyle: const TextStyle(fontSize: 0, height: 0),
                            selectionColor: Colors.blue,
                            selectedTextColor: Colors.white,
                            height: 64,
                            daysCount: 30,
                            onDateChange: (date) {
                              setState(() {
                                _selectedDate = date;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(45)),
                      color: Colors.blue,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: <Widget>[
                          // Expanded(
                          //   flex: 1,
                          //   child: VsScrollbar(
                          //     controller: _scrollController,
                          //     isAlwaysShown: true,
                          //     child: Container(),
                          //   ),
                          // ),
                          Expanded(
                            child: RawScrollbar(
                              controller: _scrollController,
                              //isAlwaysShown: true,
                              scrollbarOrientation: ScrollbarOrientation.left,
                              radius: Radius.circular(30),
                              trackVisibility: true,
                              thumbVisibility: true,
                              trackColor: Colors.white,
                              trackBorderColor: Colors.white,
                              thumbColor: Colors.black,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 40),
                                child: ListView(
                                  controller: _scrollController,
                                  shrinkWrap: true,
                                  //physics: NeverScrollableScrollPhysics(),
                                  children: _selectedDate.day == DateTime.now().day ? getTasks() : getTasks2(),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<TaskContainer> getTasks() {
  List<TaskContainer> tasks = [];
  var task = TaskContainer(
    title: 'Team Meeting',
    subtitle: 'Discuss all questions about new projects',
    boxColor: Colors.white,
    image: AssetImage('images/meeting.jpg'),
    time: '10:00 AM',
  );
  tasks.add(task);
  task = TaskContainer(
    title: 'Call the stylist',
    subtitle: 'Agree on an evening look',
    boxColor: Colors.white,
    image: AssetImage('images/phone.png'),
    time: '11:00 AM',
  );
  tasks.add(task);
  task = TaskContainer(
    title: 'Check Mail',
    subtitle: 'Write to the manager',
    boxColor: Colors.white,
    image: AssetImage('images/email.png'),
    time: '12:00 PM',
  );
  tasks.add(task);
  return tasks;
}

List<TaskContainer> getTasks2() {
  List<TaskContainer> tasks = [];
  var task = TaskContainer(
    title: 'Check Mail',
    subtitle: 'Write to the manager',
    boxColor: Colors.white,
    image: AssetImage('images/email.png'),
    time: '10:00 AM',
  );
  tasks.add(task);
  task = TaskContainer(
    title: 'Call the stylist',
    subtitle: 'Agree on an evening look',
    boxColor: Colors.white,
    image: AssetImage('images/phone.png'),
    time: '11:00 AM',
  );
  tasks.add(task);

  task = TaskContainer(
    title: 'Team Meeting',
    subtitle: 'Discuss all questions about new projects',
    boxColor: Colors.white,
    image: AssetImage('images/meeting.jpg'),
    time: '12:00 PM',
  );
  tasks.add(task);
  return tasks;
}
