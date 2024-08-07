import 'package:get/get.dart';
import 'package:uptodo/screens/index/index_model.dart';
import 'package:uptodo/service/firebase_service/firestore_service.dart';

class IndexController extends GetxController
{
  final IndexModel indexModel=IndexModel();

  @override
  void onInit() {
    // TODO: implement onInit
    FirestoreService().getAllTask();
    super.onInit();
  }


}