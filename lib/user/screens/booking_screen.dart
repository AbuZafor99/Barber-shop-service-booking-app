import 'package:barber_booking_app/ui/services/database.dart';
import 'package:barber_booking_app/ui/widgets/main_button.dart';
import 'package:barber_booking_app/ui/widgets/screens_bg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/shared_pref.dart';

class BookingScreen extends StatefulWidget {
  BookingScreen({super.key, required this.service});
  final String service;

  static const String name = '/booking-screen';

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {

  String? name, image,email;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      name = await SharedPreferenceHelper().getUserName();
      image = await SharedPreferenceHelper().getUserImage();
      email=await SharedPreferenceHelper().getUserEmail();
    } catch (e) {
      // Set default values if there's an error
      name = "Guest";
      image =
      "https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg";
    }

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreensBG(
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Let's the\njourney begin",
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset("images/discount.png", fit: BoxFit.cover),
              ),
              const SizedBox(height: 20),
              Text(
                widget.service,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Color(0xFFb4817e),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Text(
                      "Set a Date",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _selectDate(context);
                          },
                          child: Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Color(0xFFb4817e),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Text(
                      "Set a Time",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _selectTime(context);
                          },
                          child: Icon(
                            Icons.alarm,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          _selectedTime.format(context),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: MainButton(
                  title: "Booked Now",
                  onClick: onTapBookingButton,
                  color: Color(0xFFf38f33),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPressBackButton() {
    Navigator.pop(context);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(_selectedDate.year),
      lastDate: DateTime(_selectedDate.year + 1),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      if (mounted) {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      if (mounted) {
        setState(() {
          _selectedTime = pickedTime;
        });
      }
    }
  }
  void onTapBookingButton()async{
    Map<String,dynamic>userBookingMap={
      "Service":widget.service,
      "Date":"${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}".toString(),
      "Time":_selectedTime.format(context).toString(),
      "Name":name,
      "Image":image,
      "Email":email
    };
    await DatabaseMethods().addUserBooking(userBookingMap).then((onValue){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Service booking successful.')),
      );
    });
  }
}
