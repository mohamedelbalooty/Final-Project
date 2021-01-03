import 'package:flutter/material.dart';

class DriverSignInView extends StatelessWidget {
  static String id = 'DriverSignInView';
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF012e67),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              width: double.infinity,
              height: 300,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF5d80b6),
                    Color(0xFFcbc6c3),
                  ],
                ),
                image: DecorationImage(
                  image: AssetImage('null'),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Inputs(
            icon: Icons.email,
            inputType: 'Email',
            controllerType: email,
            txtType: TextInputType.emailAddress,
          ),
          Inputs(
            icon: Icons.security,
            inputType: 'Password',
            controllerType: password,
            txtType: TextInputType.visiblePassword,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
            height: 50,
            color: Color(0xff0194fe),
            child: RaisedButton(
              onPressed: null,
              child: Text(
                "Sign In",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: 30.0,
            color: Colors.teal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(color: Color(0xFFcbc6c3)),
                ),
                FlatButton(
                  onPressed: null,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Color(0xff012b7e),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

//TextField
class Inputs extends StatelessWidget {
  final TextInputType txtType;
  final IconData icon;
  final String inputType;
  final controllerType;

  Inputs({this.icon, this.inputType, this.controllerType, this.txtType});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 9.0, vertical: 6.0),
      child: TextField(
        keyboardType: txtType,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 0.0),
          ),
          prefixIcon: Icon(
            icon,
            color: Color(0xffdcdfe4),
          ),
          labelText: '$inputType',
          labelStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        controller: controllerType,
        onSubmitted: (_) => null,
      ),
    );
  }
}

//header decoration
class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(oldClipper) => false;
}
