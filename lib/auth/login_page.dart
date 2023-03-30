
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:unixofficial/auth/register_page.dart';

import '../allpages.dart';
import '../editor.dart';
import '../helper/helper_function.dart';
import '../service/auth_service.dart';
import '../service/database_service.dart';
import '../widgets/widgets.dart';
import 'forgot_passwor.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool _isLoading = false;
  bool   autocorrect =true ;
  bool  obscuretext = true;
  AuthService authService = AuthService();



  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController myController = TextEditingController();


  String emailx ='Email';

  String passx ='password';


  exset() async {
    emailx= _emailController.text;

  }

  pxset() async {
    passx= _emailController.text;

  }


  getFromPhone() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {

      emailx=   preferences.getString('named').toString() ;
    });
    try {
      return preferences.getString('named');
    } catch (e) {
      print(e.toString());
    }
  }

  getFromPhonee() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {

      passx =   preferences.getString('nameed').toString() ;
    });
    try {
      return preferences.getString('nameed');
    } catch (e) {
      print(e.toString());
    }
  }


  saveToPhonee() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();


    try {
      preferences.setString(
          'nameed',_passwordController.text);
    } catch (e) {
      print(e.toString());
    }
  }

  saveToPhone() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      preferences.setString('named', _emailController.text,);
    } catch (e) {
      print(e.toString());
    }
  }

  void edata ()async{

    await  getFromPhone();
    await getFromPhonee();
    setState(() {
      _passwordController.text=passx.toString();
      _emailController.text=emailx.toString();
      print(passx.trim());
      print(emailx);
    });


  }
  void initState() {
    // TODO: implement initState
    super.initState();
    edata();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child:  Center(child: SpinKitDualRing(color:
              Colors.blue.shade900,size: 44,),),
            )
          : SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                         Text(
                          " Unix",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold,color: Colors.blue.shade900),
                        ),
                        const SizedBox(height: 10),
                        const Text("Login now to share your docs !",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400)),
                        Image.asset("assets/fe.png"),
                        TextFormField(

                          controller: _emailController,
                          decoration:InputDecoration(
                            labelText: "Email",
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.blue.shade900,
                            ),



                            hintText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (val) {
                            setState(() {
                         emailx = val;
                         Future.delayed(Duration(microseconds: 1)).whenComplete((){
                           setState(() {
                               exset();
                           });
                         }
                         );

                            });
                          },

                          // check tha validation
                          validator: (val) {
                            return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(val!)
                                ? null
                                : "Please enter a valid email";
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          autocorrect: autocorrect ,
                          obscureText: obscuretext?? true,
                          decoration: InputDecoration(
                              labelText: "Password",
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.blue.shade900,
                              ),
                            suffixIcon:  obscuretext == true
                                ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscuretext = false;
                                  });
                                },
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  size: 20,
                                ))
                                : IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscuretext = true;
                                  });
                                },
                                icon: Icon(
                                    Icons.visibility_off,
                                    size: 20
                                )
                            ),



                            hintText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          controller: _passwordController,

                          validator: (val) {
                            if (val!.length < 6) {
                              return "Password must be at least 6 characters";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (val) {
                            setState(() {
                              passx = val;
                              Future.delayed(Duration(microseconds: 1)).whenComplete((){
                                setState(() {
                                  pxset();
                                });
                              }
                              );

                            });
                          },
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        Text.rich(TextSpan(
                          text: "Forgot password ",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: "Click here",
                                style: const TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    nextScreen(context,  ForgotPassword());
                                  }),
                          ],
                        )),

                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            child: const Text(
                              "Sign In",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            onPressed: () {
                              login();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text.rich(TextSpan(
                          text: "Don't have an account? ",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: "Register here",
                                style: const TextStyle(
                                    color: Colors.black,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    nextScreen(context, const RegisterPage());
                                  }),
                          ],
                        )),
                      ],
                    )),
              ),
            ),
    );
  }

  login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .loginWithUserNameandPassword(_emailController.text, _passwordController.text)
          .then((value) async {
        if (value == true) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => editor()));
          saveToPhone();
          saveToPhonee();
          QuerySnapshot snapshot =
              await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                  .gettingUserData(_emailController.text);
          // saving the values to our shared preferences


        } else {
          showSnackbar(context, Colors.blue.shade800, value,);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
