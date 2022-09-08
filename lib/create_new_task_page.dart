import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:promina_task/widgets/buttons.dart';
import 'package:promina_task/widgets/my_text_field.dart';
import 'package:promina_task/widgets/reusable_card.dart';

enum Category {
  development,
  research,
  design,
  backend,
}

class CreateNewTaskPage extends StatefulWidget {
  @override
  State<CreateNewTaskPage> createState() => _CreateNewTaskPageState();
}

class _CreateNewTaskPageState extends State<CreateNewTaskPage> {
  Category selectedcategory = Category.development;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var downwardIcon = Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black54,
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
                  width: width,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyBackButton(),
                          ImageIcon(
                            AssetImage("images/hamburger.png"),
                            color: Colors.black,
                            size: 24,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Create new task',
                            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
                          ),
                          ImageIcon(
                            AssetImage("images/task2.png"),
                            color: Colors.blue.shade200,
                            size: 28,
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      MyTextField(label: 'Task Name'),
                      SizedBox(height: 40),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Select Category',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue.shade300,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 65,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  ReusableCard(
                                    colour: selectedcategory == Category.development ? Colors.blue : Colors.white,
                                    onPress: () {
                                      setState(() {
                                        selectedcategory = Category.development;
                                      });
                                    },
                                    cardChild: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Development',
                                          style: TextStyle(
                                            color: selectedcategory == Category.development ? Colors.white : Colors.blue,
                                          )),
                                    ),
                                  ),
                                  ReusableCard(
                                    colour: selectedcategory == Category.research ? Colors.blue : Colors.white,
                                    onPress: () {
                                      setState(() {
                                        selectedcategory = Category.research;
                                      });
                                    },
                                    cardChild: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Research',
                                          style: TextStyle(
                                            color: selectedcategory == Category.research ? Colors.white : Colors.blue,
                                          )),
                                    ),
                                  ),
                                  ReusableCard(
                                    colour: selectedcategory == Category.design ? Colors.blue : Colors.white,
                                    onPress: () {
                                      setState(() {
                                        selectedcategory = Category.design;
                                      });
                                    },
                                    cardChild: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Design',
                                          style: TextStyle(
                                            color: selectedcategory == Category.design ? Colors.white : Colors.blue,
                                          )),
                                    ),
                                  ),
                                  ReusableCard(
                                    colour: selectedcategory == Category.backend ? Colors.blue : Colors.white,
                                    onPress: () {
                                      setState(() {
                                        selectedcategory = Category.backend;
                                      });
                                    },
                                    cardChild: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Backend',
                                          style: TextStyle(
                                            color: selectedcategory == Category.backend ? Colors.white : Colors.blue,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            child: MyTextField(
                              label: 'Date',
                              //icon: downwardIcon,
                            ),
                          ),
                          SizedBox(
                            width: 90,
                          ),
                          calendarIcon(),
                        ],
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                              child: MyTextField(
                            label: 'Start Time',
                            icon: downwardIcon,
                          )),
                          SizedBox(width: 40),
                          Expanded(
                            child: MyTextField(
                              label: 'End Time',
                              icon: downwardIcon,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      MyTextField(
                        label: 'Description',
                        minLines: 1,
                        maxLines: 3,
                      ),
                      SizedBox(height: 60),
                    ],
                  ),
                ),
              ],
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              bottom: MediaQuery.of(context).viewInsets.bottom == 0 ? 40 : MediaQuery.of(context).viewInsets.bottom,
              left: 40,
              child: Container(
                height: 80,
                width: width / 1.2,
                child: Container(
                  child: Text(
                    'Create Task',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 30),
                  ),
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 30),
                  width: width - 40,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

CircleAvatar calendarIcon() {
  return CircleAvatar(
    radius: 25.0,
    backgroundColor: Colors.blue,
    child: Icon(
      Icons.calendar_today,
      size: 20.0,
      color: Colors.white,
    ),
  );
}
