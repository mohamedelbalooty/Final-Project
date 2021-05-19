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
    return Flexible(
      child: Container(
        height: 50,
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 15, left: 10),
            enabledBorder: _customOutlineInputBorder(),
            focusedBorder: _customOutlineInputBorder(),
            errorBorder: _errorBorder(),
            focusedErrorBorder: _errorBorder(),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey),
          ),
          // ignore: missing_return
          validator: (value) {
            if (value.isEmpty) {
              return 'Required';
            }
          },
        ),
      ),
    );
  }

  OutlineInputBorder _errorBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(5),
    );
  }

  OutlineInputBorder _customOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: KGradientColor,
      ),
      borderRadius: BorderRadius.circular(5),
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
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 30,
              color: Colors.blueGrey[100],
              child: Center(
                child: Text(
                  'Enter your payment information',
                  style: TextStyle(color: Colors.indigoAccent),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.credit_card,
                      color: KGradientColor,
                      size: 35,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Credit Card',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black54,
                    size: 30,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  buildPaymentTextFormField(
                    hint: '1234 5678 9012 3456 ',
                    icon: Icons.credit_card,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  buildPaymentTextFormField(hint: 'MM/YY ', icon: Icons.circle),
                  SizedBox(
                    width: 10,
                  ),
                  buildPaymentTextFormField(
                      hint: 'CVV', icon: Icons.credit_card),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  buildPaymentTextFormField(
                      hint: 'Zip Code', icon: Icons.credit_card),
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
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
