import 'package:calendar_slider/calendar_slider.dart';
import 'package:db_final_project_fitness_app/constants/Color.dart';
import 'package:db_final_project_fitness_app/screens/MainScreens/AddActivity.dart';
import 'package:db_final_project_fitness_app/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class workoutProgress extends StatefulWidget {
  const workoutProgress({super.key});

  @override
  State<workoutProgress> createState() => _workoutProgressState();
}

class _workoutProgressState extends State<workoutProgress> {
  final _firstController = CalendarSliderController();

  late DateTime _selectedDateAppBBar;
  var CurrDate;
  DateTime getThirtyDaysAgo() {
    return DateTime.now().subtract(const Duration(days: 30));
  }

  DateTime getToday() {
    return DateTime.now();
  }

  void GetProgress() async {
    await workoutProgressProv.GetProgress(
        userProv.email, CurrDate.toString().substring(0, 10));
  }

  void ActivityPageCall() async {
    await Navigator.pushNamed(context, '/AddActivity');
    setState(() {
      _selectedDateAppBBar = CurrDate;
    });
  }

  @override
  void initState() {
    super.initState();
    CurrDate = getToday();
    _selectedDateAppBBar = CurrDate;
    workoutProgressProv.setDate(CurrDate.toString().substring(0, 10));
    print(workoutProgressProv.date);
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CalendarSlider(
        controller: _firstController,
        selectedDayPosition: SelectedDayPosition.center,
        fullCalendarScroll: FullCalendarScroll.vertical,
        backgroundColor: Colors.grey[900],
        fullCalendarWeekDay: WeekDay.short,
        selectedTileBackgroundColor: mainColor,
        monthYearButtonBackgroundColor: Colors.grey[700],
        monthYearTextColor: Colors.white,
        tileBackgroundColor: Colors.grey[700],
        selectedDateColor: Colors.black,
        dateColor: Colors.white,
        tileShadow: BoxShadow(
          color: Colors.black.withOpacity(1),
        ),
        locale: 'en',
        initialDate: getToday(),
        firstDate: getThirtyDaysAgo(),
        lastDate: getToday(),
        onDateSelected: (date) async {
          CurrDate = date;
          print('Before call email:' + userProv.email);
          await workoutProgressProv.GetProgress(
              userProv.email, CurrDate.toString().substring(0, 10));
          setState(() {
            _selectedDateAppBBar = CurrDate;
            workoutProgressProv.setDate(CurrDate.toString().substring(0, 10));
            print(CurrDate.toString().substring(0, 10));
          });
        },
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  this.ActivityPageCall();
                },
                child: CircularIndicatorText(
                  text: workoutProgressProv.caloriesBurnt.toString() + " Cal",
                  subText: 'Active Calories',
                  color: mainColor,
                  strokeWidth: 10,
                  size: size.width * 0.45,
                  value: workoutProgressProv.caloriesBurnt / 5000,
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      this.ActivityPageCall();
                    },
                    child: CircularIndicatorText(
                      text: workoutProgressProv.steps.toString(),
                      subText: 'Steps',
                      color: Colors.red,
                      strokeWidth: 7,
                      size: size.width * 0.26,
                      value: workoutProgressProv.steps / 10000,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      this.ActivityPageCall();
                    },
                    child: CircularIndicatorText(
                      text: workoutProgressProv.time.toString(),
                      subText: 'min',
                      color: Colors.blue,
                      strokeWidth: 7,
                      size: size.width * 0.26,
                      value: workoutProgressProv.time / 60,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      this.ActivityPageCall();
                    },
                    child: CircularIndicatorText(
                      text: workoutProgressProv.heartRate.toString(),
                      subText: 'bpm',
                      color: Colors.orange,
                      strokeWidth: 7,
                      size: size.width * 0.26,
                      value: workoutProgressProv.heartRate / 150,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Workout Progress',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text("View All",
                        style: TextStyle(fontSize: 15, color: mainColor)),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              const TextCheckboxContainer(
                text: 'Stability Training',
                subtext: '10:00am - 11:00am',
                value: true,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              const TextCheckboxContainer(
                text: 'Stability Training',
                subtext: '10:00am - 11:00am',
                value: false,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              const TextCheckboxContainer(
                text: 'Stability Training',
                subtext: '10:00am - 11:00am',
                value: true,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              const TextCheckboxContainer(
                text: 'Stability Training',
                subtext: '10:00am - 11:00am',
                value: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextCheckboxContainer extends StatelessWidget {
  const TextCheckboxContainer(
      {super.key,
      required this.text,
      required this.subtext,
      required this.value});

  final String text;
  final String subtext;
  final bool value;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.085,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 13),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    subtext,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  )
                ]),
          ),
          Container(
            child: Center(
              child: Checkbox(
                onChanged: (value) {},
                value: value,
                activeColor: mainColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CircularIndicatorText extends StatelessWidget {
  const CircularIndicatorText({
    super.key,
    required this.text,
    required this.subText,
    required this.color,
    required this.strokeWidth,
    this.size,
    required this.value,
  });

  final String text;
  final double? size;
  final String subText;
  final Color color;
  final double strokeWidth;
  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: size,
            width: size,
            child: CircularProgressIndicator(
              value: value,
              backgroundColor: Colors.grey[800],
              valueColor: AlwaysStoppedAnimation<Color>(color),
              strokeWidth: strokeWidth,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(fontSize: 26, color: Colors.white),
              ),
              Text(
                subText,
                style: const TextStyle(fontSize: 15, color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
