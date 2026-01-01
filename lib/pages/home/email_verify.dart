import 'package:b_s_p_consult/flutter_flow/flutter_flow_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../auth/firebase_auth/firebase_auth_manager.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black,
      padding: EdgeInsets.all(19),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/verify.png', height: 150),
          SizedBox(height: 75), 
          Text('Check your email', style: TextStyle(fontSize: 28, color: Colors.white)),
          SizedBox(height: 35),
          Text('To confirm your email address, tap the link in your email we sent to you.', style: TextStyle(fontSize: 16, color: Colors.white), textAlign: TextAlign.center,),
          SizedBox(height: 25),
          FFButtonWidget(
            text: 'Send again', 
            onPressed: ()async{
              final user = FirebaseAuth.instance.currentUser;
              await user!.sendEmailVerification();
            }, 
            options: FFButtonOptions(
              color: Color(0xFF7B7DF2),
              padding: EdgeInsets.symmetric(horizontal: 19, vertical: 12)
            )
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Do you want to try with another account!', style: TextStyle(fontSize: 12, color: Colors.white)),
              TextButton(
                child: Text('Log out'),
                onPressed: ()async{
                  final authManager = FirebaseAuthManager();
                  await authManager.signOut();
                }, 
              )
            ],
          )
        ],
      ),
    );
  }
}