import 'package:firebase_database/firebase_database.dart';
import 'package:fl_22_learn_realtime_database/models/post_model.dart';

class RTDBService{

  static DatabaseReference ref = FirebaseDatabase.instance.ref();

  static Future<void>storeData({required Map<String, dynamic> data, required String path})async{
    String? key = ref.child(path).push().key;
    await ref.child(path).child(key!).set(data);
  }






}