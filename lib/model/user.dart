class User {
  
   String email;
   String password;
   String name;
   String profileImageURL;
   String headline;
   String headline2;
   int followers;
   int connections;
   String coverPhotoUrl;
   List<Experience> experience;
   List<OpenTo> openToWork;
   List<DashboardDetails> DashboardData;

   User({required this.email,required this.password,required this.name,
   required this.profileImageURL,
    required this.headline,
    required this.headline2,
    required this.followers,
    required this.connections,
    required this.experience,
    required this.coverPhotoUrl,
    required this.openToWork,
    required this.DashboardData,
    });
  

}
class Experience {
  final String company;
  final String location;

  Experience({required this.company, required this.location});
}
class OpenTo {
  final String position;
  

  OpenTo({required this.position});
}

class DashboardDetails {
  final int profileView;
  final int postView;
  final int searchApperance;
  

  DashboardDetails({required this.profileView,required this.postView,required this.searchApperance});
}