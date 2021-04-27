import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';

class UserPaymentView extends StatefulWidget {
  static const id = 'UserPaymentView';

  @override
  _UserPaymentViewState createState() => _UserPaymentViewState();
}

class _UserPaymentViewState extends State<UserPaymentView> {
  final formKey = GlobalKey<FormState>();

  Widget buildPaymentTextFormField({String hint, IconData icon}) {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(
          icon,
          size: 30,
        ),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Required';
        }
//        return null;
      },
    );
  }

  Widget buildPaymentButton(
      {Color color, Widget child, Function function, double width}) {
    return TextButton(
      onPressed: function,
      child: Container(
        height: 50,
        width: width,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
        child: Center(child: child),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KGradientColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.close,
            color: Colors.white,
            size: 25,
          ),
        ),
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          'Payment Methods',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20, left: 20),
                width: double.infinity,
                height: 50,
                color: Colors.blueGrey[100],
                child: Text('Enter your payment method information: '),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.credit_card,
                        color: Colors.blue[900],
                        size: 35,
                      ),
                    ),
                    Expanded(
                        child: Text(
                      'Credit Card',
                      style: TextStyle(color: Colors.grey),
                    )),
                    Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.black54,
                      size: 30,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Row(
                  children: [
                    Container(
                        width: isPortrait ? width * .8 : width * .75,
                        child: buildPaymentTextFormField(
                            hint: '1234 5678 9012 3456 ',
                            icon: Icons.credit_card)),
                    Icon(
                      Icons.camera_alt,
                      color: KGradientColor,
                      size: 30,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Row(
                  children: [
                    Container(
                        width: isPortrait ? width * .39 : width * .37,
                        child: buildPaymentTextFormField(
                            hint: 'MM/YY ', icon: Icons.credit_card)),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        width: isPortrait ? width * .39 : width * .37,
                        child: buildPaymentTextFormField(
                            hint: 'CVV', icon: Icons.credit_card)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      width: isPortrait ? width * .8 : width * .75,
                      child: buildPaymentTextFormField(
                          hint: 'Zip Code', icon: Icons.credit_card),
                    ),
                  ],
                ),
              ),
              buildPaymentButton(
                  color: Colors.blueAccent,
                  child: Text('Save',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  function: () {
                    if (formKey.currentState.validate()) {
                      formKey.currentState.save();
                    }
                  },
                  width: isPortrait ? width * .9 : width * .75),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _customDivider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'OR',
                      style: TextStyle(
                        color: KGradientColor,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  _customDivider(),
                ],
              ),
              buildPaymentButton(
                  color: Colors.yellow[700],
                  child: Image.asset(
                    'assets/images/photos/paypal.png',
                    height: 35,
                  ),
                  function: () {},
                  width: isPortrait ? width * .9 : width * .75),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _customDivider() {
    return Expanded(
        child: Divider(
      color: KGradientColor,
      height: 2,
    ));
  }
}
