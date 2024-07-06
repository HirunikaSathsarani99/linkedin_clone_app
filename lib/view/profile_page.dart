
import 'package:flutter/material.dart';
import 'package:linkedin_clone_app/view/home_screen.dart';
import 'package:linkedin_clone_app/view/styles.dart';
import 'package:linkedin_clone_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController searchController = TextEditingController();

  // device back button navigation
  Future<bool> _onWillPop() async {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
    return false;
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = context.read<UserViewModel>().user;
      if (user != null) {
        setState(() {
          searchController.text = user.name;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = context.watch<UserViewModel>();
    final user = userViewModel.user;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: const Icon(Icons.arrow_back),
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextField(
                            controller: searchController,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Icon(Icons.settings),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Image.asset(
                      user!.coverPhotoUrl,
                      height: AppStyles.getScreenSize(context).height * 0.2,
                      width: AppStyles.getScreenSize(context).width,
                    ),
                    const Positioned(
                      top: 35,
                      right: 10,
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.edit)),
                    ),
                    Positioned(
                      bottom: 5,
                      left: 10,
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    AssetImage(user.profileImageURL),
                              ),
                              Positioned(
                                top: 60,
                                right: 10,
                                child: Container(
                                  // height:
                                  //     AppStyles.getScreenSize(context).height *
                                  //         0.015,
                                  // width:
                                  //     AppStyles.getScreenSize(context).width *
                                  //         0.02,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey)),

                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Icon(Icons.add,
                                        size: 20.0,
                                        color: Color.fromARGB(255, 26, 26, 26)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width:
                                AppStyles.getScreenSize(context).width * 0.65,
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                top: 55,
                              ),
                              child: const Icon(Icons.edit)),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            user.name,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10.0,),
                          Icon(Icons.volume_down)
                        ],
                      ),
                      Text(
                        user.headline,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        user.headline2,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: AppStyles.getScreenSize(context).height * 0.01,
                      ),
                      Text(
                        user.experience.first.company.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        user.experience.first.location,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: AppStyles.getScreenSize(context).height * 0.01,
                      ),
                      Row(
                        children: [
                          Text(
                            '${user.followers} followers',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.blue),
                          ),
                          SizedBox(
                            width:
                                AppStyles.getScreenSize(context).width * 0.05,
                          ),
                          Text(
                            '${user.connections} connections',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.blue),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppStyles.getScreenSize(context).height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppStyles.primaryColor,
                              minimumSize: Size(
                                  AppStyles.getScreenSize(context).width *
                                      0.7 /
                                      2,
                                  35),
                            ),
                            child: const Text(
                              'Open to',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          // SizedBox(
                          //   width:
                          //       AppStyles.getScreenSize(context).width * 0.02,
                          // ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              minimumSize: Size(
                                  AppStyles.getScreenSize(context).width *
                                      0.7 /
                                      2,
                                  35),
                              side: const BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            child: const Text(
                              'Add Section',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 143, 142, 142),
                                  fontSize: 18),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(color: Colors.grey)),
                            width: AppStyles.getScreenSize(context).width * 0.1,
                            height: 35,
                            child: const Icon(
                              Icons.more_horiz,
                              color: Colors.grey,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                      OpenToWorkWidget(),
                    ],
                  ),
                ),
                const Dashboard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userViewModel = context.watch<UserViewModel>();
    final user = userViewModel.user;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Card(
            color: Color.fromARGB(255, 227, 232, 238),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your Dashboard',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Private to you',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_border_outlined,
                            size: 30.0,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'ALL-STAR',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          DashboardItem(
                            count: user!.DashboardData.first.profileView
                                .toString(),
                            label: 'Who viewed your profile',
                          ),
                          VerticalDivider(color: Colors.grey),
                          DashboardItem(
                            count: user.DashboardData.first.postView.toString(),
                            label: 'Post Views',
                          ),
                          VerticalDivider(color: Colors.grey),
                          DashboardItem(
                            count: user.DashboardData.first.searchApperance
                                .toString(),
                            label: 'Search appearances',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.wifi_tethering, color: Colors.black),
                    title: Text('Creator mode: On'),
                    subtitle: Text(
                      'Creator mode highlights content on your profile and helps you get discovered by potential followers.',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  final String count;
  final String label;

  DashboardItem({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppStyles.getScreenSize(context).width * 0.23,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            count,
            style: TextStyle(
                color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(label),
        ],
      ),
    );
  }
}

class OpenToWorkWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userViewModel = context.watch<UserViewModel>();
    final user = userViewModel.user;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: AppStyles.getScreenSize(context).height * 0.14,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: user!.openToWork.length,
          itemBuilder: (context, index) {
            return Card(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 221, 219, 219),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: AppStyles.getScreenSize(context).width * 0.8,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Open to work'),
                        Icon(Icons.edit, color: Colors.grey),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user!.openToWork[index].position),
                        Text(
                          'See all details',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
