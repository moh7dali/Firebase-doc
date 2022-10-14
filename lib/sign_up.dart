import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_signup/home.dart';
import 'package:flutter/material.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({super.key});

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  TextEditingController em = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text("Sign Up page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              "Sign Up Page",
              style: TextStyle(fontSize: 35, color: Colors.pinkAccent),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Email",
              style: TextStyle(fontSize: 25, color: Colors.pinkAccent),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: em,
              decoration: InputDecoration(
                  hintText: 'Enter your Email',
                  prefixIcon: Icon(Icons.email),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600))),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "password",
              style: TextStyle(fontSize: 25, color: Colors.pinkAccent),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
                obscureText: _isObscure,
                controller: pass,
                decoration: InputDecoration(
                  hintText: 'Enter Your password',
                  prefixIcon: Icon(Icons.password),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 150,
              color: Colors.pinkAccent,
              child: TextButton(
                  onPressed: () async {
                    try {
                      var auth = FirebaseAuth.instance;
                      UserCredential myuser =
                          await auth.createUserWithEmailAndPassword(
                              email: em.text, password: pass.text);
                      Navigator.pushNamed(context, "login");
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${e.toString()}")));
                    }
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "login");
                },
                child: Text("Already have Account ? Log In"))
          ],
        ),
      ),
    );
  }
}
