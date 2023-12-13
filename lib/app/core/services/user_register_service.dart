import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:metropolly/app/common/widgets/info_dialog.dart';
import '../models/user_model.dart';

class UserRegisterService {
  final _dataBase = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user, BuildContext context) async {
    await _dataBase
        .collection('users')
        .add(user.toMap())
        .whenComplete(
          () => showDialog(
            context: context,
            builder: (_) => infoDialog("Sucesso!", "Usuario cadastrado."),
          ),
        )
        .catchError((error, stackTrace) {
      return error;
      // return showDialog(
      //   context: context,
      //   builder: (_) => infoDialog("Ops!", "Algo deu errado."),
      // );
    });
  }
}
