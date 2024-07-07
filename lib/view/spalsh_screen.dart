import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:linkedin_clone_app/view/styles.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _Pagecontroller = PageController();
  final int pageCount = 3;
  double currentPage = 0;

  void initState() {
    super.initState();
    _Pagecontroller.addListener(() {
      setState(() {
        currentPage = _Pagecontroller.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/linkedIn_logo.png",
              height: screenSize.height * 0.1,
              width: screenSize.width * 0.5,
            ),
            SizedBox(
              height: screenSize.height * 0.04,
            ),
            Container(
              height: screenSize.height*0.47,
              child: PageView(
                controller: _Pagecontroller,
                children: [
                  SubPage(
                    ImageUrl: 'assets/images/splash_screen_image.jpg',
                  ),
                  SubPage(
                    ImageUrl: 'assets/images/splash_screen_image.jpg',
                  ),
                  SubPage(
                    ImageUrl: 'assets/images/splash_screen_image.jpg',
                  ),
                ],
              ),
            ),
           
            
            DotsIndicator(
              dotsCount: pageCount,
              position: currentPage,
              decorator: const DotsDecorator(
                  color: Colors.grey, activeColor: AppStyles.primaryColor,
                  ),
                  
            ),
            
            Container(
              width: screenSize.width*0.7,
              height: screenSize.height*0.25,
              child: Row(
                children: [
                  GestureDetector(
                    child: Buttons("Sign UP", Colors.white, AppStyles.primaryColor),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/signup');
                    },),
                  GestureDetector(
                    child: Buttons(
                      "Login",
                      AppStyles.primaryColor,
                      Colors.white,
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

// ignore: must_be_immutable
class SubPage extends StatelessWidget {
  SubPage({
    super.key,
    required this.ImageUrl,
  });

  String ImageUrl;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Image.asset(
          ImageUrl,
          height: screenSize.height * 0.25,
          width: screenSize.width * 0.9,
        ),
        Icon(Icons.arrow_circle_right,color: AppStyles.primaryColor,size: 65,),
        SizedBox( height: screenSize.height * 0.02,),
        const Text(
            "Land your Job",
            style: TextStyle(fontSize: 16, color: AppStyles.primaryColor,
            fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox( height: screenSize.height * 0.02,),
        Container(
          width: screenSize.width * 0.6,
          child: const Text(
            "Coonect, Apply and Get Hired with your favourite job around the world",
            style: TextStyle(fontSize: 12, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
         
          
        ),
  
      ],
    );
  }
}

Widget Buttons(String text, Color backgroundColor, Color textColor) {
  
  return Container(
   
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 15.0),
      child: Text(
        text,
        style: TextStyle(
            color: textColor, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
