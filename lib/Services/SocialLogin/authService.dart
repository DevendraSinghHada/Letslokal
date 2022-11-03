import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class authService {
  // function for google sign in

  static Future googleLogin() async {
    print("googleLogin method Called");
    GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      var result = await googleSignIn.signIn();
      if (result != null) {
        final userData = await result.authentication;
        final credential = GoogleAuthProvider.credential(
            accessToken: userData.accessToken, idToken: userData.idToken);
        var finalResult =
            await FirebaseAuth.instance.signInWithCredential(credential);

        print("Result $result");
        print("userData: $userData");
        print("credential : $credential");
        print("finalResult : $finalResult");
        print("name:${result.displayName}");

        // print("family name: "+ );
        var name = result.displayName.toString();
        //       // firstName = finalResult.additionalUserInfo?.profile!["given_name"];
        //       // lastName = finalResult.additionalUserInfo?.profile!["family_name"];
        print(name);
        //  email =  result.email.toString();

        //  socialLoginApi(name.toString(), email.toString(), "google");

        //  // print("name: " + name);
        // // print("email: " + email);

        return true;
      }

      return false;
    } catch (error) {
      print(error);
    }
  }

  // Function for Facebook Sign in

  static Future facebookLogin() async {
    print("FaceBook method is calling ");
    try {
      final res = await FacebookAuth.instance
          .login(permissions: ['public_profile', 'email']);
      if (res.status == LoginStatus.success) {
        final userData = await FacebookAuth.instance.getUserData();
        print(userData);
      }
      return res;
    } catch (error) {
      print(error);
    }
  }

  // SignOut page
  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
