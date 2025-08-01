import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserDetails(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfoMap);
  }

  Future<Map<String, dynamic>?> getUserDetailsByEmail(String email) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("users")
          .where("Email", isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var userData = querySnapshot.docs.first.data() as Map<String, dynamic>;
        return userData;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
  Future addUserBooking(Map<String, dynamic> userInfoMap) async {
    return await FirebaseFirestore.instance
        .collection("Booking")
        .add(userInfoMap);
  }

  Stream<QuerySnapshot> getBookings() {
    return FirebaseFirestore.instance.collection("Booking").snapshots();
  }

  Future<void> acceptBooking(String bookingId) async {
    return await FirebaseFirestore.instance
        .collection("Booking")
        .doc(bookingId)
        .update({"Status": "Accepted"});
  }

  Future<void> deleteBooking(String bookingId) async {
    return await FirebaseFirestore.instance
        .collection("Booking")
        .doc(bookingId)
        .delete();
  }
}
