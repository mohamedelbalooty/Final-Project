import 'package:flutter/material.dart';

import '../../../constants.dart';

class DriverProfileView extends StatelessWidget {
  static String id = 'DriverProfileView';

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
        title: Text(
          'الملف الشخصي',
          style: TextStyle(fontSize: 20),
        ),
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
                      'assets/images/photos/person1.jpg',
                    )),
                Container(
                  width: double.infinity,
                  height: isPortrait ? height * .3 : height * .45,
                  color: Color.fromRGBO(61, 102, 222, 0.5),
                ),
                Positioned(
                    bottom: -35,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      backgroundImage:
                          AssetImage('assets/images/photos/person1.jpg'),
                    ))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              title: Center(
                  child: Text(
                'مصطفى',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: isPortrait ? height * .5 : height * .9,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    _buildDetails(label: 'الاسم', title: 'مصطفى'),
                    _buildDetails(
                        label: 'البريد الاكتروني ', title: 'mostafa@gmail.com'),
                    _buildDetails(label: 'الرقم السري', title: '١٢٣٤'),
                    _buildDetails(label: 'رقم الجوال', title: '٠١٠٢٣٤٥٦٧٨٩'),
                    _buildDetails(label: 'رقم السياره', title: '١٢٣٤'),
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
