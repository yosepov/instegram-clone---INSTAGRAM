import 'package:cloud_firestore/cloud_firestore.dart';

class Activity {
  final String id;
  final String postId;
  final String postImageUrl;
  final String comment;
  final String fromUserId;
  final Timestamp timestamp;

  Activity(
      {this.id,
      this.fromUserId,
      this.postId,
      this.timestamp,
      this.comment,
      this.postImageUrl});

  factory Activity.fromDoc(DocumentSnapshot doc) {
    return Activity(
      id: doc.documentID,
      fromUserId: doc['fromUserId'],
      postId: doc['postId'],
      postImageUrl: doc['postImageUrl'],
      comment: doc['comment'],
      timestamp: doc['timestamp'],
    );
  }
}
