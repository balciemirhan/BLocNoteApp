import 'package:cloud_firestore/cloud_firestore.dart';

// class FirestoreService {
// // get collection of notes (notların toplanmasını sağlayın)
//   final CollectionReference notes =
//       FirebaseFirestore.instance.collection("notes");

// // CREATE : add a new note.
//   Future addNote(String note) async {
//     return notes.add({
//       'note': note,
//       'timestamp': Timestamp.now(),
//     });
//   }

// // READ : get notes from database (streamBuilder || futureBuilder)
//   Stream<QuerySnapshot> getNotesStream() {
//     final notesStream =
//         notes.orderBy('timestamp', descending: true).snapshots();
//     return notesStream;
//   }

// // UPDATE : modify an existing note.
// //burada bir id vererek notu güncelleyeceğiz.
// // Çünkü hangi notu güncellediğimizi bilmemiz gerekiyor.
//   Future<void> updateNote(String docID, String newNote) async {
//     return notes.doc(docID).update({
//       'note': newNote,
//       'timestamp': Timestamp.now(),
//     });
//   }

// // DELETE : remove a specific note.
// // hangi notu sildiğimi bilmem gerek => docID
//   Future<void> deleteNote(String docID) {
//     return notes.doc(docID).delete();
//   }
// }

import 'package:crud_operations/models/notes_model.dart';

class FirestoreService {
  // Get collection of notes
  final CollectionReference<Map<String, dynamic>> notes =
      FirebaseFirestore.instance.collection("notes");

  // CREATE
  Future addNote(Note note) async {
    return notes.add(note.toMap()); // verileri haritalandır ve firestore aktar.
  }

  // READ
  /*  Stream<QuerySnapshot> getNotesStream() {
    return notes.orderBy('timestamp', descending: true).snapshots();
  } */

  Stream<QuerySnapshot> getNotesStream(String userId) {
    return notes
        .where('userId', isEqualTo: userId)
        /*   .orderBy('timestamp', descending: false) */
        .snapshots(includeMetadataChanges: true);
  }

  // UPDATE
  Future<void> updateNote(String docID, Note newNote) async {
    return notes.doc(docID).update(newNote.toMap());
  }

  // DELETE
  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
  }
}

// ---------------------------> ÖNEMLİİİİ ---------------------------------->

// addNote fonksiyonu, add() metodunu doc().set({}) yerine kullanır. Bu metot yeni not için otomatik olarak benzersiz bir ID üretir ve bunu koleksiyona ekler.

  // -->>>>>>>>>>>>>>>>> Stream Builder yerine kullanılabilir. (Future (tek seferlik.)) -->>>>>>>>>>>>>>>>>

// firestore dan veri çekerken steream + future 
// stream => .snapshots (sürekli izleme)
// future=> .get (tek seferlik izleme)

/* Future<QuerySnapshot> getNotesFuture() {
  return notes.orderBy('timestamp', descending: true).get();
}

 */

/* Stream<QuerySnapshot> getNotes() {
  return notes.snapshots();
}

// UPDATE : modify an existing note.
Future updateNote(String id, String updatedText) =>
    notes.doc(id).update({'note': updatedText});

// DELETE : remove a specific note.
Future deleteNote(String id) => notes.doc(id).delete();   
// UPDATE :  update notes given a doc id

// */

// add yerine doc().set({}) ' de olur.

/*   Future addNote(String note) async {
    return notes.doc().set({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  } */

//   private db: any;
//   constructor() {
//     const firebase = require('firebase');
//     this.db = firebase.firestore();
//   }

/* getCollection(collectionName) {
    return this.db.collection(collectionName);
  }

  addToCollection(collectionName, data) {
    return this.getCollection(collectionName).add(data);
  }

  updateDocument(collectionName, docId, data) {
    let docRef = this.db.doc(`${collectionName}/${docId}`);
    return docRef.update(data);
  }

  deleteFromCollection(collectionName, docId) {
    let docRef = this.db.doc(`${collectionName}/${docId}`);
    return docRef.delete();
  }

  findInCollection(collectionName, queryData) {
    let collectionRef = this.getCollection(collectionName);
    let query = collectionRef.where(queryData.field, queryData.operator, queryData.value);

    if (queryData.orderBy) {
      query = query.orderBy(queryData.orderBy.field, queryData.orderBy.direction);
    }

    return query.get().then((snapshot) => {
      let documents = snapshot.docs.map((doc) => {
        return { id : doc.id, ...doc.data() };
      });
      return documents;
    });
  } */
