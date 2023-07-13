import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleSignInHelper {
  Future<AppleUser> appleSignIn() async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    if (credential.email == null || credential.email == '') {
      var value =
          await FlutterKeychain.get(key: "${credential.userIdentifier}");
      if (value != null) {
        print('User detail --> $value');
        String name = value.split('/').first;
        String email = value.split('/').last;
        // appleLogin(email, credential.userIdentifier, name);
        //socialLogin("Apple",credential.userIdentifier);
        print('Email - $name');
        print('Email - $email');
        //  appleLogIn(email, credential.userIdentifier);
        AppleUser user=AppleUser(name: name,email: email,id: credential.userIdentifier);
        ///Todo: hit_api of social login
        return user;
      } else {
        //   appleLogIn(credential.email, credential.userIdentifier);
        AppleUser user=AppleUser(name: credential.givenName,email: credential.email,id: credential.userIdentifier);
        ///Todo: hit_api of social login
        return user;
      }
    } else {
      await FlutterKeychain.put(
          key: credential.userIdentifier.toString(),
          value: "${credential.givenName}/${credential.email}");
      // appleLogIn(credential.email, credential.userIdentifier);
      ///Todo: hit_api of social login
      ///
      AppleUser user=AppleUser(name: credential.givenName,email: credential.email,id: credential.userIdentifier);
      return user;
    }
  }


}

class AppleUser{

  String? name;
  String? email;
  String? id;


  AppleUser({this.name,this.email,this.id});
}