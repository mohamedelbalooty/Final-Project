import 'package:final_project/app_approach/controller/api_services.dart';
import 'package:final_project/app_approach/model/passenger.dart';
import 'package:final_project/app_approach/view/shared_view/home_view.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/core_errorHandeling/error_handeling.dart';
import 'package:final_project/provider/authentication_result.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          icon: Icon(Icons.logout,),
        ),
      ),
      body: FutureBuilder<List<Passenger>>(
        future: ApiService().getAllPassengers(context),
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
                          ? Column(
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
                                          _dataDetails[index].image,
                                        )),
                                    Container(
                                      width: double.infinity,
                                      height: isPortrait
                                          ? height * .3
                                          : height * .45,
                                      color: Color.fromRGBO(61, 102, 222, 0.5),
                                    ),
                                    Positioned(
                                      bottom: -35,
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundColor: Colors.white,
                                        backgroundImage: NetworkImage(
                                          _dataDetails[index].image,
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
//                                          _buildDetails(
//                                              label: 'الرقم السري',
//                                              title: '١٢٣٤'),
                                        _buildDetails(
                                            label: 'رقم الجوال',
                                            title: _dataDetails[index].phone),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
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

//        _isLoading == false
//            ? Center(child: CircularProgressIndicator())
//            : SingleChildScrollView(
//                child: Column(
//                  children: [
//                    Stack(
//                      overflow: Overflow.visible,
//                      alignment: Alignment.center,
//                      children: [
//                        Image(
//                            width: double.infinity,
//                            height: isPortrait ? height * .3 : height * .45,
//                            fit: BoxFit.cover,
//                            image: NetworkImage(passenger.image)),
//                        Container(
//                          width: double.infinity,
//                          height: isPortrait ? height * .3 : height * .45,
//                          color: Color.fromRGBO(61, 102, 222, 0.5),
//                        ),
//                        Positioned(
//                          bottom: -35,
//                          child: CircleAvatar(
//                            radius: 45,
//                            backgroundColor: Colors.white,
//                            backgroundImage: NetworkImage(passenger.image),
//                          ),
//                        ),
//                      ],
//                    ),
//                    SizedBox(
//                      height: 30,
//                    ),
//                    ListTile(
//                      title: Center(
//                        child: Text(
//                          passenger.name,
//                          style: TextStyle(
//                              fontWeight: FontWeight.bold, fontSize: 20),
//                        ),
//                      ),
//                    ),
//                    SizedBox(
//                      height: 10,
//                    ),
//                    Container(
//                      height: isPortrait ? height * .5 : height * .75,
//                      child: Padding(
//                        padding: const EdgeInsets.symmetric(
//                            horizontal: 20, vertical: 0),
//                        child: Column(
//                          children: [
//                            _buildDetails(
//                                label: 'الاسم', title: passenger.name),
//                            _buildDetails(
//                                label: 'البريد الاكتروني ',
//                                title: passenger.email),
////                    _buildDetails(label: 'الرقم السري', title: '١٢٣٤٥'),
//                            _buildDetails(
//                                label: 'رقم الجوال', title: passenger.phone),
//                            SizedBox(
//                              height: 100,
//                            ),
//                            InkWell(
//                              onTap: () => Navigator.pushReplacementNamed(
//                                  context, HomeViewShared.id),
//                              child: Container(
//                                height: 60,
//                                width: double.infinity,
//                                decoration: BoxDecoration(
//                                    border: Border.all(
//                                        color: Colors.indigo, width: 2),
//                                    borderRadius: BorderRadius.circular(3)),
//                                child: Center(
//                                  child: Text(
//                                    'تسجيل الخروج',
//                                    style: TextStyle(
//                                        color: Colors.indigo,
//                                        fontWeight: FontWeight.bold,
//                                        fontSize: 18),
//                                  ),
//                                ),
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),
//                  ],
//                ),
//              )
//      FutureBuilder<List<Passenger>>(
//        future: ApiService().getAllPassengers(context),
//        // ignore: missing_return
//        builder: (_, snapshot) {
//          switch (snapshot.connectionState) {
//            case ConnectionState.waiting:
//              return Center(child: CircularProgressIndicator());
//              break;
//            case ConnectionState.active:
//              return Center(child: CircularProgressIndicator());
//              break;
//            case ConnectionState.none:
//              return internetConnectionError();
//              break;
//            case ConnectionState.done:
//              if (snapshot.hasError) {
//                return internetConnectionError();
//              } else {
//                if (snapshot.data != null) {
//                  var _dataDetails = snapshot.data;
//                  if(var item in ){
//
//                  }
//                  return
//                }
//                return Center(child: Text('error'));
//              }
//              break;
//          }
//        },
//      ),
    );
  }
}
