import 'package:final_project/app_approach/controller/api_services.dart';
import 'package:final_project/app_approach/model/driver.dart';
import 'package:final_project/app_approach/view/shared_view/home_view.dart';
import 'package:final_project/core_errorHandeling/error_handeling.dart';
import 'package:final_project/provider/authentication_result.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: KGradientColor,
        automaticallyImplyLeading: false,
        title: Text(
          'الملف الشخصي',
          style: TextStyle(fontSize: 20),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pushReplacementNamed(context, HomeViewShared.id),
          icon: Icon(Icons.logout),
        ),
//          InkWell(
//            onTap: () =>
//                Navigator.pushReplacementNamed(context, HomeViewShared.id),
//            child: Padding(
//              padding: const EdgeInsets.all(10.0),
//              child: Image.asset('assets/images/icons/logout.png', height: 20, width: 20,),
//            ),
//          ),
      ),
      body: FutureBuilder<List<Driver>>(
        future: ApiService().getAllDrivers(context),
        // ignore: missing_return
        builder: (_, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
              break;
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());
              break;
            case ConnectionState.none:
              return internetConnectionError();
              break;
            case ConnectionState.done:
              if (snapshot.hasError) {
                return internetConnectionError();
              } else {
                if (snapshot.data != null) {
                  var _dataDetails = snapshot.data;
                  return ListView.builder(
                    itemCount: _dataDetails.length,
                    itemBuilder: (context, index) {
                      return _dataDetails[index].email ==
                              Provider.of<AuthenticationResult>(context)
                                  .emailing
                          ? SingleChildScrollView(
                              child: Column(
                                children: [
                                  Stack(
                                    overflow: Overflow.visible,
                                    alignment: Alignment.center,
                                    children: [
                                      Image(
                                          width: double.infinity,
                                          height: isPortrait
                                              ? height * .3
                                              : height * .45,
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            _dataDetails[index].profileImage,
                                          )),
                                      Container(
                                        width: double.infinity,
                                        height: isPortrait
                                            ? height * .3
                                            : height * .45,
                                        color:
                                            Color.fromRGBO(61, 102, 222, 0.5),
                                      ),
                                      Positioned(
                                        bottom: -35,
                                        child: CircleAvatar(
                                          radius: 40,
                                          backgroundColor: Colors.white,
                                          backgroundImage: NetworkImage(
                                            _dataDetails[index].profileImage,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  ListTile(
                                    title: Center(
                                      child: Text(
                                        _dataDetails[index].name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height:
                                        isPortrait ? height * .5 : height * .9,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Column(
                                        children: [
                                          _buildDetails(
                                              label: 'الاسم',
                                              title: _dataDetails[index].name),
                                          _buildDetails(
                                              label: 'البريد الاكتروني ',
                                              title: _dataDetails[index].email),
                                          _buildDetails(
                                              label: 'رقم الجوال',
                                              title: _dataDetails[index].phone),
                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            )
                          : Container();
                    },
                  );
                }
                return Center(child: Text('error'));
              }
              break;
          }
        },
      ),
    );
  }
}
