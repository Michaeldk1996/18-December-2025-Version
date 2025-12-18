import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDlBq75FgR2sa20Ap6PHdqzGg58LwNnfdM",
            authDomain: "bspconsult-bcd6e.firebaseapp.com",
            projectId: "bspconsult-bcd6e",
            storageBucket: "bspconsult-bcd6e.appspot.com",
            messagingSenderId: "209328620753",
            appId: "1:209328620753:web:a42e728f0d5cd74101f1f0",
            measurementId: "G-RXQB0FWLHX"));
  } else {
    await Firebase.initializeApp();
  }
}
