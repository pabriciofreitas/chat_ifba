import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String userName;
  final String message;
  final String idUser;
  final DateTime? sendDateTime;
  MessageModel({
    required this.userName,
    required this.message,
    required this.idUser,
    required this.sendDateTime,
  });

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
        userName: map['userName'] ?? "",
        message: map['message'] ?? "",
        idUser: map['id'] ?? "",
        sendDateTime: null
        //map['dateInicial'] as Timestamp).toDate(),
        );
  }

  Map<String, dynamic> toMap(FieldValue dateTimeServer) {
    return <String, dynamic>{
      'userName': userName,
      'message': message,
      'id': idUser,
      'sendDateTime': dateTimeServer,
    };
  }
}
