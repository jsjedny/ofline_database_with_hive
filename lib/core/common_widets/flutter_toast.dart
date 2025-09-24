import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void errorToast(String title) {
  Fluttertoast.showToast(msg: title, backgroundColor: Colors.red);
}

void sucessToast(String title) {
  Fluttertoast.showToast(msg: title, backgroundColor: Colors.green);
}
