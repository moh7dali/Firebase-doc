import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Log_in extends StatefulWidget {
  const Log_in({super.key});

  @override
  State<Log_in> createState() => _Log_inState();
}

class _Log_inState extends State<Log_in> {
  TextEditingController em = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              "Log In page",
              style: TextStyle(fontSize: 35, color: Colors.blue),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Email",
              style: TextStyle(fontSize: 25, color: Colors.blue),
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
              style: TextStyle(fontSize: 25, color: Colors.blue),
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
              color: Colors.blue.shade600,
              child: TextButton(
                  onPressed: () async {
                    try {
                      var auth = FirebaseAuth.instance;
                      UserCredential myuser =
                          await auth.signInWithEmailAndPassword(
                              email: em.text, password: pass.text);
                      Navigator.pushNamed(context, "home");
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${e.toString()}")));
                    }
                  },
                  child: Text(
                    "Log In",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
