import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/core/app_export.dart';
import 'package:bluewave/presentation/login_page_screen/models/login_page_model.dart';

class GoogleSignInProvider extends ChangeNotifier{
  //Rx<LoginPageModel> loginPageModelObj = LoginPageModel().obs;
  // var _googleSignin = GoogleSignIn();
  // var googleAccount = Rx<GoogleSignInAccount?>(null);
  final GoogleSignIn googleSignIn = GoogleSignIn();
  late GoogleSignInAccount googleSignInAccount;


  Future login() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      googleSignInAccount = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
    }

    notifyListeners();
  }

  Future logout() async{
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();

  }

}
