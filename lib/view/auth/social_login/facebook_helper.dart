
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

class FacebookHelper {
  static final FacebookHelper _singleton =
  FacebookHelper._internal();

  factory FacebookHelper() {
    return _singleton;
  }

  FacebookHelper._internal();

  //Todo: initialized variable
  String? profileId;
  AccessToken? token;
  String? email;
  String? profilePicture;
  String? SocialId;
  String? name;
  Map<String, dynamic>? userData;

  Future<FacebookUser?> facebookLogin() async {
    print('Facebook Login ======');
    FacebookUser? user;
    final LoginResult result = await FacebookAuth.instance.login(permissions: [
      "public_profile",
      "email"
    ]); // by default we request the email and the public profile
    if (result.status == LoginStatus.success) {
      token = result.accessToken;
      print('TOken -->  ${token!.toJson()}');
      // get the user data
      // by default we get the userId, email,name and picture
      var userData = await FacebookAuth.instance.getUserData();
      // final userData = await FacebookAuth.instance.getUserData(fields: "email");
      print('User Profile --->}');
      print('User Profile ---> ${userData.toString()}');
      print('User Profile ---> ${userData['email']}');
      print('User Profile ---> ${userData.length}');
      //Todo: savingData Locally
      email = userData['email'];
      profilePicture = userData['picture']['data']['url'];
      SocialId = userData['id'];
      name = userData['name'];

      userData = userData;
       user=FacebookUser(name: name,email: email,imageUrl: profilePicture,id:SocialId);
      return user;
    } else {
      print(result.status);
      print(result.message);
     return user;
    }
  }

  //Todo:
  Future<bool> callSocialAPI() async {
    //  call social API
    userData!["email"];
    return true;
  }

  //Todo: logOutSocial
  Future<void> _logOut() async {
    await FacebookAuth.instance.logOut();
    token = null;
    userData = null;
  }
}

class FacebookUser{

  String? name;
  String? email;
  String? imageUrl;
  String? id;


  FacebookUser({this.name,this.email,this.imageUrl,this.id});
}