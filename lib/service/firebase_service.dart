import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  Future<bool> signUpEmail(BuildContext context, String email, String password,
      String firstName, String lastName, String birthday) async {
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
              'progress': 1,
            });
            return true;
          } else {
            documentReference.update({
              'first-name': firstName,
              'last-name': lastName,
              'birthday': birthday,
              'updated-at': DateTime.now(),
            });
          }
          return true;
        });
      });
      return true;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding: const EdgeInsets.all(20),
          content: Text(
            e.message.toString(),
            style: GoogleFonts.inter(),
          ),
        ),
      );
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> signInEmail(
      BuildContext context, String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding: const EdgeInsets.all(20),
          content: Text(
            e.message.toString(),
            style: GoogleFonts.inter(),
          ),
        ),
      );
      return false;
    }
  }

  Future<bool> signInGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) {
          FirebaseFirestore.instance.runTransaction((transaction) async {
            DocumentReference documentReference = FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser!.uid);
            DocumentSnapshot snapshot =
                await transaction.get(documentReference);

            String firstName =
                googleSignInAccount.displayName!.split(' ').first;

            if (!snapshot.exists) {
              documentReference.set({
                'email': googleSignInAccount.email,
                'full-name': googleSignInAccount.displayName,
                'first-name': firstName,
                'created-at': DateTime.now(),
                'updated-at': DateTime.now(),
                'progress': 1,
              });
              return true;
            } else {
              documentReference.update({
                'updated-at': DateTime.now(),
              });
            }
            return true;
          });
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          print('account-exists-with-different-credential');
        }
        return false;
      }
      return true;
    } else {
      return false;
    }
  }

  Future<bool> resetPassword(BuildContext context, String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding: const EdgeInsets.all(20),
          content: Text(
            'Password reset email sent',
            style: GoogleFonts.inter(),
          ),
        ),
      );
      return true;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding: const EdgeInsets.all(20),
          content: Text(
            e.message.toString(),
            style: GoogleFonts.inter(),
          ),
        ),
      );
      return false;
    }
  }

  Future initLearningPath(String learningPath, String course) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;

      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection(learningPath)
          .doc(course);

      FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(documentReference);

        if (!snapshot.exists) {
          documentReference.set({
            'index': 0,
          });
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future saveProgressCourse(String learningPath, String course, String type,
      String lesson, double progress,
      {int? index, int? indexCourse, bool isLastIndex = false}) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;

      DocumentReference userDocument =
          FirebaseFirestore.instance.collection('users').doc(uid);

      DocumentReference learningPathDocument = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection(learningPath)
          .doc(course);

      DocumentReference courseDocument = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection(learningPath)
          .doc(course)
          .collection(type)
          .doc(lesson);

      FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot user = await transaction.get(userDocument);

        DocumentSnapshot learningPath =
            await transaction.get(learningPathDocument);

        DocumentSnapshot course = await transaction.get(courseDocument);

        if (isLastIndex == true) {
          if (course['isLastIndex'] == false) {
            int newValue = user['progress'] + 1;
            userDocument.update({
              'progress': newValue,
            });
          }

          courseDocument.update({
            'isLastIndex': true,
          });
        } else {
          transaction.update(learningPathDocument, {
            'index': indexCourse,
          });

          if (!course.exists) {
            courseDocument.set({
              'index': index,
              'progress': progress,
              'isLastIndex': false,
            });
          } else {
            if (course['progress'] < 0.999) {
              transaction.update(courseDocument, {
                'progress': progress,
                'index': index,
              });
            }
          }
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future saveProgressExercise(String learningPath, String course, String type,
      String lesson, double progress) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;

      DocumentReference courseDocument = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection(learningPath)
          .doc(course)
          .collection(type)
          .doc(lesson);

      FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot course = await transaction.get(courseDocument);

        if (!course.exists) {
          courseDocument.set({
            'progress': progress,
          });
        } else {
          if (course['progress'] < 0.999) {
            transaction.update(courseDocument, {
              'progress': progress,
            });
          }
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
