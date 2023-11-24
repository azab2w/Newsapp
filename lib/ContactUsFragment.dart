import 'package:flutter/material.dart';

class ContactUsFragment extends StatefulWidget{
  @override
  State<ContactUsFragment> createState() => _ContactUsFragmentState();
}

class _ContactUsFragmentState extends State<ContactUsFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(30),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.purpleAccent
                ),
                child: SelectableText("Phone :   01094086701" , style: TextStyle(
                    fontSize: 18
                ),),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(30),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.purpleAccent
                ),
                child: SelectableText("Email : am9368117@gmail.com" , style: TextStyle(
                    fontSize: 18
                ),),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(30),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.purpleAccent
                ),
                child: SelectableText("Github : https://github.com/azab2w" , style: TextStyle(
                    fontSize: 18
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}