import 'package:flutter/material.dart';
import 'package:test_app/common_widgets/textfield_widget.dart';
import 'package:test_app/controller/controller.dart';
import 'package:test_app/view/sign_up_page.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Controller _controller = Get.put(Controller());
  bool seeker = false;
  bool recruiter = false;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 16.24,
              ),
              const Text(
                'Login',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 16.24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              seeker = true;
                              recruiter = false;
                            });
                          },
                          icon: seeker
                              ? const Icon(Icons.radio_button_checked_sharp,
                                  color: Colors.blue)
                              : const Icon(
                                  Icons.radio_button_off,
                                  color: Colors.grey,
                                )),
                      Text(
                        'Seeker',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: seeker ? Colors.blue : Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              seeker = false;
                              recruiter = true;
                            });
                          },
                          icon: recruiter
                              ? const Icon(Icons.radio_button_checked_sharp,
                                  color: Colors.blue)
                              : const Icon(Icons.radio_button_off,
                                  color: Colors.grey)),
                      Text(
                        'Recruiter',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: recruiter ? Colors.blue : Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 16.24,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 18.75),
                child: Column(
                  children: [
                    TextFieldWidget(
                      keyType: TextInputType.emailAddress,
                      obscure: false,
                      controller: email,
                      label: 'Your email',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40.6,
                    ),
                    TextFieldWidget(
                      maxLines: 6,
                      keyType: TextInputType.number,
                      obscure: true,
                      controller: password,
                      label: 'Password',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 16.24,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 20.3,
                width: MediaQuery.of(context).size.width / 3.13,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xffab47bc),
                        Colors.deepPurpleAccent,
                      ],
                    )),
                child: TextButton(
                    onPressed: () async {
                      await _controller.signIn(email.text, password.text);
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 16.24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't Have an Account",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage())),
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
