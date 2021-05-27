import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';

class UserProfileView extends StatelessWidget {
  static String id = 'UserProfileView';

  Widget _buildDetails({String label, String title}) {
    return Column(
      children: [
        Align(
            alignment: Alignment.topRight,
            child: Text(
              label,
              style:
              TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
            )),
        Align(
            alignment: Alignment.topRight,
            child: Text(
              title,
            )),
        Divider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: KGradientColor,
        automaticallyImplyLeading: false,
        title: Text('الملف الشخصي', style: TextStyle(fontSize: 20),),
      ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                overflow: Overflow.visible,
                alignment: Alignment.center,
                children: [
                  Image(
                      width: double.infinity,
                      height: isPortrait ? height * .3 : height * .45,
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/photos/driver.jpg',
                      )),
                  Container(
                    width: double.infinity,
                    height: isPortrait ? height * .3 : height * .45,
                    color: Color.fromRGBO(61, 102, 222, 0.5),
                  ),

                  Positioned(
                      bottom: -35,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/images/photos/driver.jpg'),
                      ))
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ListTile(
                title: Center(child: Text('محمود حمزه', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
//                subtitle: Center(child: Text('حمزه')),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: isPortrait ? height * .5 : height * .75,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Column(
                    children: [
                      _buildDetails(label: 'الاسم', title: 'محمود'),
                      _buildDetails(label: 'البريد الاكتروني ', title: 'mahmoud@gmail.com'),
                      _buildDetails(label: 'الرقم السري', title: '١٢٣٤٥'),
                      _buildDetails(label: 'رقم الجوال', title: '٠١٠٢٣٤٥٦٧٨٩'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}