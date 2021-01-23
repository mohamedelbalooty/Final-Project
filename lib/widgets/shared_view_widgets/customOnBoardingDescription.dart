import 'package:flutter/material.dart';
//Style
final kTitleStyle = TextStyle(color: Colors.black, fontSize: 25.0, height: 1.2,fontWeight: FontWeight.bold);
final kSubtitleStyle = TextStyle(color: Colors.grey, fontSize: 15.0, height: 1,);


Widget buildOnboardDescription({ BuildContext context,String img, String title, String description, }) {

  return Padding(
    padding: EdgeInsets.all(40.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.asset(img,width: 200,height: 200,),
        /*Center(
          child: Container(
            height:  isPortrait ? height * 0.36 : height * 0.6,
            width: width/2-10,
            decoration: BoxDecoration(
              image:DecorationImage(
                image: AssetImage(img,),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),*/
        SizedBox(height: 50.0),
        Text(
          title,
          style: kTitleStyle,
        ),
        SizedBox(height: 10.0),
        Text(
          description,
          style: kSubtitleStyle,
        ),
      ],
    ),
  );
}