import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package_base/src/widget/raised_gradient_button.dart';

class MessageDialog extends StatelessWidget {
  final String text;
  final String textContent;
  final String textOK;
  final VoidCallback onOk;

  const MessageDialog(
      {Key key, this.text, this.onOk, this.textContent, this.textOK})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                text,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: textContent != null,
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                    textContent ?? '',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              RaisedGradientButton(
                onPressed: () {
                  onOk?.call();
                },
                gradient: LinearGradient(
                    colors: [Color(0xffB254E8), Color(0xff6a54e8)]),
                child: Text(
                  textOK ?? 'OK',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                height: 48,
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
