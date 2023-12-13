import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:metropolly/app/common/widgets/info_dialog.dart';
import '../models/post_model.dart';

class UserRegisterService {
  final _dataBase = FirebaseFirestore.instance;

  Future<void> createUser(PostModel post, BuildContext context) async {
    await _dataBase
        .collection('posts')
        .add(post.toMap())
        .whenComplete(
          () => showDialog(
            context: context,
            builder: (_) => infoDialog("Sucesso!", "Post cadastrado."),
          ),
        )
        .catchError((error, stackTrace) {
      showDialog(
        context: context,
        builder: (_) => infoDialog("Ops!", "Algo deu errado."),
      );
      print(error.toString());
    });
  }
}
