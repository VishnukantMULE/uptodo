class ProfileModel{

  final String name;

  ProfileModel({required this.name});

  Map<String,dynamic> profileMap(){
     return {
        'name':name
     };
  }

}