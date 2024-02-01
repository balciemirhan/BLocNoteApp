import 'package:cloud_firestore/cloud_firestore.dart';

/* class Note {
  /*  String userID; */
  String note;
  Timestamp timestamp;

  Note({
    required this.note,
    required this.timestamp,
    /* required this.userID */
  });

  factory Note.fromMap(Map<String, dynamic> json) {
    return Note(
      note: json['note'] as String,
      timestamp: json['timestamp'] as Timestamp,
      /*  userID: json["userId"] as String, */
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'note': note,
      'timestamp': timestamp, /* "userId": userID */
    };
  }
}
 */

// Kullanıcıya özel notlar oluşturmak için userId alanını kullanabilirsiniz.

class Note {
  String userId;
  String note;
  Timestamp timestamp;

  Note({
    required this.userId,
    required this.note,
    required this.timestamp,
  });

// haritalanmış(map) lenmiş verileri çekerken de Note sınıfına çeviriyor.Bu sayede verilerimizi kullanabiliyoruz.
  factory Note.fromMap(Map<String, dynamic> json) {
    return Note(
      userId: json['userId'] as String,
      note: json['note'] as String,
      timestamp: json['timestamp'] as Timestamp,
    );
  }
  //verileri haritalandır ve firestore aktar.
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'note': note,
      'timestamp': timestamp,
    };
  }
}
