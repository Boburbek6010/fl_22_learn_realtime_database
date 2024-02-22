import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'app.dart';
import 'firebase_options.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
runApp(const App());
}