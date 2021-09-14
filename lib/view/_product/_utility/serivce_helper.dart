import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

abstract class ServiceHelper {
  void showMessage(
      GlobalKey<ScaffoldState>? scaffoldKey, IErrorModel? errorModel) {
    if (scaffoldKey == null || errorModel == null) return;
    // ignore: deprecated_member_use
    scaffoldKey.currentState!.showSnackBar(SnackBar(
        content:
            Text(errorModel.description ?? errorModel.statusCode.toString())));
  }
}
