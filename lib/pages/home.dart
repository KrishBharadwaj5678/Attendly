import 'package:attendance_calculator/constants/attendanceui.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State {
  final TextEditingController _classesAttended = TextEditingController();
  final TextEditingController _totalClasses = TextEditingController();
  final TextEditingController _minimumAttendance = TextEditingController();
  double? _percentage = 0;
  int? _classesMissed = 0;
  bool status = false;
  double _bunk = 0;
  String _bunkLabel = 'You cannot bunk class.';
  bool showAttendanceReport = false;

  void calculateAttendance() {
    int total = int.parse(_totalClasses.text);
    int attended = int.parse(_classesAttended.text);
    int minimumAttd = int.parse(_minimumAttendance.text);

    _percentage = attended / total * 100;
    _classesMissed = total > attended ? total - attended : 0;

    if (_percentage! >= minimumAttd) {
      status = true;
    } else {
      status = false;
    }

    _bunk = total - (attended * 100 / minimumAttd);

    if (_bunk.toStringAsFixed(0) == "0") {
      _bunkLabel = 'No classes can be skipped.';
    } else if (_bunk >= 0) {
      _bunkLabel = 'You must attend ${_bunk.toStringAsFixed(0)} more classes.';
    } else {
      _bunkLabel =
          'You can bunk ${_bunk.abs().toStringAsFixed(0)} classes safely.';
    }

    showAttendanceReport = true;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(28),
          child: Column(
            spacing: 10,
            children: [
              Text("Attendance Tracker", style: AttendanceUi.headingStyle),

              // Classes Attended
              SizedBox(height: 10),
              TextField(
                controller: _classesAttended,
                keyboardType: AttendanceUi.keyboardType,
                decoration: AttendanceUi.decoration("Attended Classes"),
                style: AttendanceUi.style,
              ),

              // Total Classes
              SizedBox(height: 1),
              TextField(
                controller: _totalClasses,
                keyboardType: AttendanceUi.keyboardType,
                decoration: AttendanceUi.decoration("Total Classes"),
                style: AttendanceUi.style,
              ),

              // Minimum Percentage
              SizedBox(height: 1),
              TextField(
                controller: _minimumAttendance,
                keyboardType: AttendanceUi.keyboardType,
                decoration: AttendanceUi.decoration("Minimum Attendance (%)"),
                style: AttendanceUi.style,
              ),
              SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    calculateAttendance();
                  },
                  style: AttendanceUi.btnStyle,
                  child: Text(
                    "Check Attendance",
                    style: TextStyle(fontSize: 19),
                  ),
                ),
              ),
              SizedBox(height: 8),

              Column(
                children: [
                  if (showAttendanceReport) ...[
                    Divider(color: Colors.black12),
                    SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: AttendanceUi.boxDecoration,
                      child: Column(
                        children: [
                          /// Attendance
                          Row(
                            children: [
                              Icon(
                                Icons.insights,
                                color: status ? Colors.green : Colors.red,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Attendance: ${_percentage?.toStringAsFixed(2)}%",
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                                  color: status ? Colors.green : Colors.red,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 10),

                          /// Classes Missed
                          Row(
                            children: [
                              const Icon(
                                Icons.cancel_outlined,
                                color: Colors.orange,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Total Classes Missed: ",
                                style: const TextStyle(
                                  fontSize: 18.4,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                _classesMissed!.abs().toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),

                          /// Bunk status
                          Row(
                            children: [
                              const Icon(
                                Icons.lightbulb_outlined,
                                color: Colors.blue,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                _bunkLabel,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
