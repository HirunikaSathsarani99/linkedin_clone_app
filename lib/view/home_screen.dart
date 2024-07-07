import 'package:flutter/material.dart';
import 'package:linkedin_clone_app/model/user.dart';
import 'package:linkedin_clone_app/view/components/search_bar.dart';
import 'package:linkedin_clone_app/view/styles.dart';
import 'package:linkedin_clone_app/view_model/post_view_model.dart';
import 'package:linkedin_clone_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import 'components/bottom_bar.dart';
import 'components/floating_action_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to exit the app?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/main');
                },
                child: Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = context.watch<UserViewModel>();
    final user = userViewModel.user;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 245, 243, 243),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //profile Image
                  if (user != null)
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/profile');
                      },
                      child: CircleAvatar(
                        backgroundImage: AssetImage(user.profileImageURL),
                        radius: AppStyles.getScreenSize(context).height * 0.03,
                      ),
                    ),

                  Image.asset(
                    "assets/images/linkedIn_logo.png",
                    height: AppStyles.getScreenSize(context).height * 0.08,
                    width: AppStyles.getScreenSize(context).width * 0.3,
                  ),

                  Image.asset(
                    "assets/images/notofication_icon.jpg",
                    height: AppStyles.getScreenSize(context).height * 0.1,
                    width: AppStyles.getScreenSize(context).width * 0.1,
                  )
                ],
              ),
              SearchBarWidget(),
              StoriesWidget(user: user),
              SizedBox(
                height: AppStyles.getScreenSize(context).height * 0.02,
              ),
              PostView(),
            ],
          ),
        )),
        bottomNavigationBar: const BottomBar(),
        floatingActionButton: const FloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class PostView extends StatefulWidget {
  const PostView({
    super.key,
  });

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  bool showFullText = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<PostViewModel>(
        builder: (context, postViewModel, child) {
          return ListView.builder(
            itemCount: postViewModel.posts.length,
            itemBuilder: (context, index) {
              final post = postViewModel.posts[index];
              return Container(
                margin: EdgeInsets.only(bottom: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage(post.userProfileImageUrl),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    post.userName,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    post.connection,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              Container(
                                width: AppStyles.getScreenSize(context).width *
                                    0.55,
                                child: Text(
                                  post.userHeadline,
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Text(
                                '${post.time} Edited',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Icon(Icons.more_vert)
                    ],
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(
                        top: AppStyles.getScreenSize(context).height * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.caption,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          maxLines: showFullText ? null : 2,
                        ),
                        if (post.caption.length > 100 && !showFullText)
                          TextButton(
                            onPressed: () {
                              setState(() {
                                showFullText = true;
                              });
                            },
                            child: Text(
                              'See more..',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        if (post.caption.length > 100 && showFullText)
                          TextButton(
                            onPressed: () {
                              setState(() {
                                showFullText = false;
                              });
                            },
                            child: Text(
                              'See less..',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        SizedBox(
                          height:
                              AppStyles.getScreenSize(context).height * 0.02,
                        ),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(post.imageUrl)),
                        SizedBox(
                          height:
                              AppStyles.getScreenSize(context).height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${post.likes} likes'),
                            Text('${post.comments} comments'),
                          ],
                        ),
                        SizedBox(
                          height:
                              AppStyles.getScreenSize(context).height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.thumb_up,
                                  color: AppStyles.iconColor,
                                  size: 30.0,
                                ),
                                SizedBox(
                                  width:
                                      AppStyles.getScreenSize(context).width *
                                          0.1,
                                ),
                                const Icon(
                                  Icons.chat_bubble_rounded,
                                  color: AppStyles.iconColor,
                                  size: 30.0,
                                ),
                                SizedBox(
                                  width:
                                      AppStyles.getScreenSize(context).width *
                                          0.17,
                                ),
                                Transform(
                                  transform: Matrix4.rotationY(
                                      math.pi), 
                                  child: const Icon(Icons.reply, color: AppStyles.iconColor,
                                  size: 35.0,),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.bookmark,
                              color: Color.fromARGB(255, 214, 212, 212),
                              size: 30,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class StoriesWidget extends StatelessWidget {
  const StoriesWidget({
    super.key,
    required this.user,
  });

  final User? user;

  @override
  Widget build(BuildContext context) {
    final dummyImages = [
      'assets/images/Stories_images/user1.jpg',
      'assets/images/Stories_images/user2.jpg',
      'assets/images/Stories_images/user3.jpg',
      'assets/images/Stories_images/user4.jpg',
      'assets/images/Stories_images/user5.jpg',
      'assets/images/Stories_images/user6.jpg',
    ];
    return Container(
      height: AppStyles.getScreenSize(context).height * 0.12,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dummyImages.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: AppStyles.getScreenSize(context).height * 0.02,
                      right: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppStyles.primaryColor,
                        width: 3.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage(user?.profileImageURL ?? ''),
                        radius: AppStyles.getScreenSize(context).height * 0.03,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  right: 0,
                  child: CircleAvatar(
                    radius: AppStyles.getScreenSize(context).height * 0.02,
                    backgroundColor: AppStyles.primaryColor,
                    child: Icon(Icons.add, size: 16.0, color: Colors.white),
                  ),
                ),
              ],
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppStyles.primaryColor,
                    width: 3.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(dummyImages[index - 1]),
                    radius: AppStyles.getScreenSize(context).height * 0.03,
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
