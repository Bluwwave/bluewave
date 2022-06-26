import 'package:google_sign_in/google_sign_in.dart';

import '/core/app_export.dart';
import 'package:bluewave/presentation/login_page_screen/models/login_page_model.dart';

class LoginPageController extends GetxController with StateMixin<dynamic> {
  //Rx<LoginPageModel> loginPageModelObj = LoginPageModel().obs;
  var _googleSignin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  login() async {
    googleAccount.value = await _googleSignin.signIn();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }
  //
  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
