import 'package:flutter/material.dart';
import 'package:linkedin_clone_app/view/styles.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppStyles.primaryColor,
      onPressed: () {
       
      },
      
      child: const Icon(Icons.add,color: Colors.white,),
    );
  }
}