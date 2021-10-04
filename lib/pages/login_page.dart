import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopking/utils/routes.dart';
import 'package:shopking/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));

      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 80,
              ),
              Text("Login",
                  style: TextStyle(
                    fontFamily: GoogleFonts.arvo().fontFamily,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: context.theme.buttonColor,
                  )),
              Image.asset(
                "assets/images/login_image.png",
                fit: BoxFit.cover,
                height: 280,
              ),
              /*SizedBox(
                  height: 20.0,
                ),*/
              Text(
                "Welcome $name",
                style: TextStyle(
                    fontFamily: GoogleFonts.arvo().fontFamily,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: context.theme.buttonColor),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(color: context.accentColor),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: MyTheme.cdarkbluishcolor)),
                        //fillColor: Colors.indigoAccent,
                        focusColor: MyTheme.cdarkbluishcolor,
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: MyTheme.cdarkbluishcolor)),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: context.theme.focusColor,
                        ),
                        //hintText: " Enter Password",
                        labelText: "Enter Username",
                        labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      cursorColor: context.theme.buttonColor,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "username cannot be empty";
                        }

                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      style: TextStyle(color: context.accentColor),
                      obscureText: true,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: MyTheme.cdarkbluishcolor),
                        ),
                        //fillColor: Colors.indigoAccent,
                        focusColor: MyTheme.cdarkbluishcolor,
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: MyTheme.cdarkbluishcolor),
                        ),
                        prefixIcon: Icon(
                          Icons.security,
                          color: context.theme.focusColor,
                        ),
                        //hintText: " Enter Password",
                        labelText: "Enter Password",
                        labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      cursorColor: context.theme.focusColor,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cant be Empty";
                        } else if (value.length < 6) {
                          return "Password should be greater the 6 character";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Material(
                      color: context.theme.buttonColor,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.lightGreenAccent,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
