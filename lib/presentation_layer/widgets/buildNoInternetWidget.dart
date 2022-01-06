import 'package:breaking_bad/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Widget buildNoInternetWidget()
{

  return Center(
    child:Container(
      color: Color(0xFFFFFFFF),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Text('Can\'t connect... check internet',style: TextStyle(
            color: gry,
            fontSize: 22
          ),),
          SizedBox(
            height: 10,
          ),
          Image.asset('assets/images/offline.png')
        ],
      ),
    )
  );
}