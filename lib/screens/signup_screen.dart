import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late bool showPassword;

  @override
  void initState() {
    showPassword = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                buildImage(),
                buildHeadingText(),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      buildNameFormField(),
                      buildEmailFormField(),
                      buildContactNumberFormField(),
                      buildPasswordFormField(),
                      buildSubmitButton(),
                    ],
                  ),
                ),
                buildRedirectText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImage() => Center(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(200),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0, 0),
                blurRadius: 5,
              ),
            ],
          ),
          child: Image.asset(
            'assets/qr_logo.png',
            width: MediaQuery.of(context).size.width * 0.5,
          ),
        ),
      );

  Widget buildHeadingText() => Column(
        children: [
          SizedBox(height: 10),
          Text(
            'SIGN UP',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
        ],
      );

  Widget buildNameFormField() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        child: TextFormField(
          keyboardType: TextInputType.text,
          onChanged: (value) {},
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your name';
            }
            return null;
          },
          controller: nameController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: "Username",
            hintText: "Username",
            floatingLabelBehavior: FloatingLabelBehavior.auto,
          ),
        ),
      );

  Widget buildEmailFormField() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {},
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your email address';
            }
            return null;
          },
          controller: emailController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: "Email",
            hintText: "Email",
            floatingLabelBehavior: FloatingLabelBehavior.auto,
          ),
        ),
      );

  Widget buildContactNumberFormField() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        child: TextFormField(
          keyboardType: TextInputType.number,
          onChanged: (value) {},
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your contact number';
            }
            return null;
          },
          controller: emailController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: "Contact Number",
            hintText: "Contact Number",
            floatingLabelBehavior: FloatingLabelBehavior.auto,
          ),
        ),
      );

  Widget buildPasswordFormField() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        child: TextFormField(
          obscureText: !showPassword,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter valid password';
            }
            return null;
          },
          controller: passwordController,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            suffix: GestureDetector(
              onTap: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              child: Icon(
                showPassword ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
                size: 16,
              ),
            ),
            labelText: "Password",
            hintText: "Password",
            floatingLabelBehavior: FloatingLabelBehavior.auto,
          ),
        ),
      );

  Widget buildConformPasswordFormField() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        child: TextFormField(
          obscureText: !showPassword,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter valid password';
            }
            return null;
          },
          controller: passwordController,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            suffix: GestureDetector(
              onTap: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              child: Icon(
                showPassword ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
                size: 16,
              ),
            ),
            labelText: "Confirm Password",
            hintText: "Confirm Password",
            floatingLabelBehavior: FloatingLabelBehavior.auto,
          ),
        ),
      );

  Widget buildSubmitButton() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  signUpUser();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildRedirectText() => GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/SignInScreen');
        },
        child: Text(
          'Already have an account?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w300,
            color: Colors.deepPurple,
          ),
        ),
      );

  void signUpUser() {
    if (_formKey.currentState!.validate()) {}
  }
}
