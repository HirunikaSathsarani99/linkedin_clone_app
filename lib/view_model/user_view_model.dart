import 'package:flutter/material.dart';
import 'package:linkedin_clone_app/model/user.dart';

class UserViewModel extends ChangeNotifier {
  User? user;

  User? get _user => user;

  void _setUserData(String email, String password) {
    user = User(
      email: email,
      password: password,
      name: "John Doe",
      headline: "Freelance iOS Developer |UIKit |SwiftUI |",
      headline2: "Talks about #swift, #swiftui and #ios development",
      followers: 1200,
      connections: 500,
      experience: [
        Experience(company: "Lean Transition Solutions-LTS", location: "Thiruvanthapuram,Kerala,India"),
       
      ],
      profileImageURL: 'assets/images/profile_image.jpg',
      coverPhotoUrl: 'assets/images/cover_image.png',
       openToWork: [
        OpenTo(position: "iOS Developer roles"),
        OpenTo(position: "Flutter Developer roles")
       ],
       
        DashboardData: [
          DashboardDetails(profileView: 111, postView: 500, searchApperance: 85)
        ],
    );
  }

  void login(String email, String password) {
    _setUserData(email, password);
    notifyListeners();
  }

  void signup(String email, String password) {
    _setUserData(email, password);
    notifyListeners();
  }
}
