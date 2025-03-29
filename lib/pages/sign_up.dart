import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/resources/auth_method.dart';
import 'package:instagram_clone/utili/colors.dart';
import 'package:instagram_clone/utili/pick_image.dart';
import 'package:instagram_clone/widgets/text_fields.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWord = TextEditingController();
  // final TextEditingController _bioController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  Uint8List? _image;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passWord.dispose();
    // _bioController.dispose();
    _userController.dispose();
  }

  void selectImageFromGallery() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(flex: 2, child: Container()),
              // SVG image
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                color: primaryColor,
                height: 64,
              ),
              SizedBox(height: 64),
              // Circular Widget for showing file selected from gallery
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                        radius: 64,
                        backgroundImage: MemoryImage(_image!),
                      )
                      : CircleAvatar(
                        radius: 64,
                        backgroundImage: AssetImage('assets/profile.jpg'),
                      ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: () {
                        selectImageFromGallery();
                      },
                      icon: Icon(Icons.add_a_photo),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 64),
              // Text Field for userName
              TextFields(
                hintText: 'Enter your username',
                textEditingController: _userController,
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 24),
              // Text Field for email
              TextFields(
                hintText: 'Enter your email',
                textEditingController: _emailController,
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 24),
              // Text Field for Password
              TextFields(
                hintText: 'Enter your password',
                textEditingController: _passWord,
                textInputType: TextInputType.emailAddress,
                isPass: true,
              ),
              SizedBox(height: 24),
              // TextFields(
              //   hintText: 'Enter your bio',
              //   textEditingController: _bioController,
              //   textInputType: TextInputType.text,
              // ),
              SizedBox(height: 24),

              // button for login
              InkWell(
                onTap: () async {
                  String res = await AuthMethod().signUpUser(
                    email: _emailController.text,
                    password: _passWord.text,
                    username: _userController.text,
                    file: _image!,
                  );
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: ShapeDecoration(
                    color: blueColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                  child: Text('Login'),
                ),
              ),
              SizedBox(height: 12),
              Flexible(flex: 2, child: Container()),
              // SignUp
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text("Don't have an account?  "),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
