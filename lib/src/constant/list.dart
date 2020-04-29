import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ListData{

  static const List<Permission> permission = [
    Permission.camera,
    Permission.location,
    Permission.storage
  ];
}