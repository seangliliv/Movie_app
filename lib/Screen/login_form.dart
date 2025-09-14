import 'package:demo/Screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF19171A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF19171A),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              icon: const Icon(
                Icons.cancel_outlined,
                size: 45,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SafeArea(
          child: Column(
            // Center the content vertically
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to MovieAPP',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36, color: Colors.red
                ),
                textAlign: TextAlign.center, // Center text horizontally
              ),
              const SizedBox(height: 25.0),
              // Email
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  filled: true,
                  prefixIcon: const Icon(Icons.email),
                ),
              ),

              const SizedBox(height: 20.0),

              // Password
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  filled: true,
                  prefixIcon: const Icon(Icons.lock),
                ),
              ),

              const SizedBox(height: 15.0),

              const SizedBox(
                height: 15,
              ),

              const Row(
                children: [
                  Spacer(),
                  Text('Forget Password?', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
                ],
              ),

              const SizedBox(
                height: 15,
              ),

              InkWell(
                onTap: () {},
                child: Center(
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.green),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: "LOGIN".text.color(Colors.white).fontWeight(FontWeight.bold).make(),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    "Don't have account? ".text.color(Colors.white).fontWeight(FontWeight.bold).make(),GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisterScreen()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: "Create new account"
                            .text
                            .fontWeight(FontWeight.bold)
                            .color(Colors.blue) // Optionally add color for visual indication
                            .make(),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              const Row(children: <Widget>[
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.only(left: 5.0, top: 8.0, right: 5.0, bottom: 8.0),
                  child: Text("OR", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),),),
                Expanded(child: Divider()),
              ],),
              const SizedBox(height: 20,),
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 25,
                  ),
                  Flexible(
                    child: InkWell(
                      onTap: () {},
                      child: Center(
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.red),
                          child: const Row( // Use Row to arrange icon and text
                            mainAxisAlignment: MainAxisAlignment.center, // Center widgets horizontally
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 10.0), // Adjust padding as needed
                                child: Icon(
                                  Icons.g_mobiledata_rounded, // Use Google Plus icon for visual consistency
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Google",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Flexible(
                    child: InkWell(
                      onTap: () {},
                      child: Center(
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.blueAccent),
                          child: const Row( // Use Row to arrange icon and text
                            mainAxisAlignment: MainAxisAlignment.center, // Center widgets horizontally
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 10.0), // Adjust padding as needed
                                child: Icon(
                                  Icons.facebook_outlined, // Use Google Plus icon for visual consistency
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Facebook",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
