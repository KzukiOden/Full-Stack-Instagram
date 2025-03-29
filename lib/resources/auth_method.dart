import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/resources/storage_method.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign Up User
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required Uint8List file,
  }) async {
    String result = "Some error occurred";
    try {
      if (email.isNotEmpty &&  // Changed || to &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          file != null) {
        // register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        print(cred.user!.uid);

        // Get photoUrl first
        String photoUrl = await StorageMethod().uploadImageToStorage(
          'profilePictures',
          file,
          false,
        );

        // add user to database
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username': username,  // Fixed typo in 'username'
          'uid': cred.user!.uid,
          'email': email,
          'followers': [],
          'following': [],
          'photoUrl': photoUrl,  // Now storing actual String URL
        });
        result = 'success';  // Fixed typo in 'success'
      } else {
        result = "Please enter all the fields";
      }
    } catch (error) {
      result = error.toString();
    }
    return result;
  }
}