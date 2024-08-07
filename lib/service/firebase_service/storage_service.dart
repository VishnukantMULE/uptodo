import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService{

  Future<String?> uploadProfilePhoto(File image)async{

    try{
      final storageRef = FirebaseStorage.instance.ref().child('user_photos/${DateTime.now().millisecondsSinceEpoch}.jpg');
      UploadTask uploadTask = storageRef.putFile(image);
      await uploadTask;

      String imgUrl = await storageRef.getDownloadURL();

      if (imgUrl.isNotEmpty) {
        return imgUrl;
      } else {
        return null;
      }
    }
    catch(e){
      print("Error in Upload Picture ${e}");
      return null;
    }

  }


}