import 'package:flutter/material.dart';
import 'package:sample_i/constant.dart';
import 'package:sample_i/model/user.dart';
import 'package:sample_i/page/home.dart';
import '../api/dummy_api.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;
  late String userName;
  late UserDetail _userDetail;

  Future<void> getDummies() async {
    print("loading api");
    _userDetail = await DummyApi.getDummy();
  }

  // Future<void> getData() async {
  //   // print("loading data api");
  //   // _data = await DataApi.getData();
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        child: Container(
          width: width,
          height: height * 0.62,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(
              left: Constants.pdSm, right: Constants.pdSm, top: 24),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(1, 0),
                  spreadRadius: 1,
                  blurRadius: 3,
                  color: Constants.shadowColor,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Logo
              Padding(
                padding: const EdgeInsets.symmetric(vertical: Constants.pdBg),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/logo2.webp"),
                    ),
                    Container(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ministry of",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Constants.textColor),
                        ),
                        Text(
                          "Commerce",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Constants.textColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //Form
              buildForm(width, height),

              // Login btn
              Padding(
                padding: const EdgeInsets.symmetric(vertical: Constants.pdBg),
                child: SizedBox(
                    width: width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Constants.brColor,
                          padding: const EdgeInsets.symmetric(vertical: 16)),
                      child: _isLoading
                          ? const FittedBox(child: CircularProgressIndicator())
                          : Text(
                              "Login",
                              style: Theme.of(context)
                                  .textTheme
                                  .button!
                                  .copyWith(color: Colors.white),
                            ),
                      onPressed: () async {

                        await getDummies();
                        setState(() => _isLoading = true);


                        print(_userDetail.email);

                        setState(() => _isLoading = false);
                        (userName == _userDetail.userName)
                            ? navigateHome()
                            : "";
                        (userName == _userDetail.email)
                            ? navigateHome()
                            : "";

                        print("Checked");
                      },
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  // form widget
  Widget buildForm(double width, double height) {
    return Container(
      width: width,
      padding:
          const EdgeInsets.only(top: Constants.pdSm, bottom: Constants.pdSm),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Username or email field
          Text("Email or Username",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Constants.captionColor)),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: Constants.pdSm),
            child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ThemeData().colorScheme.copyWith(
                      primary: Constants.brColor,
                    ),
              ),
              child: TextFormField(
                validator: (email) {
                  if (_userDetail.email == email) {
                    return null;
                  } else {
                    return 'Enter a valid email address';
                  }
                },
                onChanged: (username) => userName = username,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintText: 'Enter your email'),
              ),
            ),
          ),

          // password field
          Text("Password",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Constants.captionColor)),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: Constants.pdSm),
            child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ThemeData().colorScheme.copyWith(
                      primary: Constants.brColor,
                    ),
              ),
              child: const TextField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintText: 'Enter your email'),
              ),
            ),
          ),
          Text("Forgot Password?",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Constants.brColor)),
        ],
      ),
    );
  }

  // navigate home function
  void navigateHome() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
  }
}
