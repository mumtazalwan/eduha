import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  Future<bool> signUpEmail(String email, String password, String firstName,
      String lastName, String birthday) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        FirebaseFirestore.instance.runTransaction((transaction) async {
          DocumentReference documentReference = FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid);
          DocumentSnapshot snapshot = await transaction.get(documentReference);

          if (!snapshot.exists) {
            String fullName = "$firstName $lastName";
            documentReference.set({
              'email': email,
              'first-name': firstName,
              'last-name': lastName,
              'full-name': fullName,
              'birthday': birthday,
              'created-at': DateTime.now(),
              'updated-at': DateTime.now(),
            });
            return true;
          }
          return true;
        });
      });
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account was already');
      }
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> signInEmail(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
