

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginHelper{

  final GoogleSignIn googleSignIn = GoogleSignIn();

  String? name;
  String? email;
  String? imageUrl;
  String? id;


  Future<GoogleUser> signInWithGoogle() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final  user = (await _auth.signInWithCredential(credential)).user;
    print(user);
    // Checking if email and name is null
    assert(user!.email != null);
    assert(user!.displayName != null);
    assert(user!.photoURL != null);

    id = user!.uid;
    name = user.displayName ?? "";
    email = user.email ?? "";
    imageUrl = user.photoURL ?? "";

    // Only taking the first part of the name, i.e., First Name
    if (name!.contains(" ")) {
      name = name!.substring(0, name!.indexOf(" "));
    }

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    // final FirebaseAuth currentUser = await _auth.currentUser();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? userdata = auth.currentUser;
    final uid = userdata?.uid;
    assert(user.uid == uid);
    GoogleUser userData=GoogleUser(name: user.displayName,email: user.email,imageUrl: user.photoURL,id:user.uid);
    return userData;
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();

    print("User Sign Out");
  }
}

class GoogleUser{

  String? name;
  String? email;
  String? imageUrl;
  String? id;


  GoogleUser({this.name,this.email,this.imageUrl,this.id});
}