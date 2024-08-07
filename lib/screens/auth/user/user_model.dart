import 'dart:io';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

class UserModel {
  late String userName;
  File? image;
  RxInt stateChange = 0.obs;

  UserModel({
    this.userName = '',
    this.image,
  });
}
