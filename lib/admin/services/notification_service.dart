import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void initialize() {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void listenForBookings() {
    DatabaseReference bookingsRef =
        FirebaseDatabase.instance.ref().child('bookings');
    bookingsRef.onChildAdded.listen((event) {
      DataSnapshot snapshot = event.snapshot;
      if(snapshot.value !=null){
        Map<dynamic,dynamic> booking = snapshot.value as Map<dynamic,dynamic>;
        String service = booking['Service'] ?? 'N/A';
        String date = booking['Date'] ?? 'N/A';
        String time = booking['Time'] ?? 'N/A';
        showNotification(service,date,time);
      }
    });
  }

  void showNotification(String service, String date, String time) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            showWhen: false);
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, 'New Booking', 'A new service has been booked: $service at $time on $date', platformChannelSpecifics,
        payload: 'item x');
  }
}