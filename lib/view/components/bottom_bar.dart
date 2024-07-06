import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../styles.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    super.key,
  });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color getIconColor(int index){
   return  _selectedIndex==index? AppStyles.primaryColor:Colors.grey;
  }

  @override
  Widget build(BuildContext context) {

    
    return BottomAppBar(
     color: Color.fromARGB(255, 255, 255, 255),
      shape: const CircularNotchedRectangle(),
      notchMargin: 15.0,
      child: SizedBox(
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon:  Icon(Icons.home_filled,color: getIconColor(0),size: 30,),
              onPressed: () {
                 _onItemTapped(0);
              },
            ),
            IconButton(
              icon:  Icon(Icons.group,color: getIconColor(1),size: 30,),
              onPressed: () {
                 _onItemTapped(1);
              },
            ),
            const SizedBox(width: 40.0), 
            IconButton(
              icon:  Icon(Icons.mark_chat_unread,color: getIconColor(2),size: 30,),
              onPressed: () {
                 _onItemTapped(2);
              },
            ),
            IconButton(
              icon:  Icon(Icons.home_repair_service,color: getIconColor(3),),
              onPressed: () {
                _onItemTapped(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}