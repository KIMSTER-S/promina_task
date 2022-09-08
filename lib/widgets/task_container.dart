import 'package:flutter/material.dart';

class TaskContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color boxColor;
  final AssetImage image;
  final String time;
  TaskContainer({required this.title, required this.subtitle, required this.boxColor, required this.image, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 140,
      width: 310,
      margin: EdgeInsets.symmetric(vertical: 15.0),
      //padding: EdgeInsets.fromLTRB(10.0),
      child: Stack(children: <Widget>[
        Container(
          height: 130,
          width: 305,
          //margin: EdgeInsets.symmetric(vertical: 15.0),
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                child: Image(
                  image: this.image,
                ),
              ),
              SizedBox(
                width: 25,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.blue.shade300,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade900, borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                time,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
