



import 'package:alok/helpers/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void bookmarkPost(id) {
    DocumentReference reference =
        FirebaseFirestore.instance.collection('Book').doc("");

    reference.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        
          reference.set({
            "message": FieldValue.arrayUnion([""])
          }, SetOptions(merge: true)).then((value) => message(message: "Added to bookmarks"));
        
    }});
  }