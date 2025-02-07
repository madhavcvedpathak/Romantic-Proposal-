import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'proposal_animation_screen.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Love Propose App By Maddy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: ProposalScreen(),
    );
  }
}

class ProposalScreen extends StatefulWidget {
  @override
  _ProposalScreenState createState() => _ProposalScreenState();
}

class _ProposalScreenState extends State<ProposalScreen> {
  final TextEditingController nameController = TextEditingController();
  XFile? _imageFile;

  void _takeSelfie() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
      Fluttertoast.showToast(msg: "Selfie captured! 📸❤️");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/love_background.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(top: 50, left: 80, child: Icon(Icons.favorite, color: Colors.pinkAccent, size: 40)),
                    Positioned(top: 150, right: 80, child: Icon(Icons.favorite, color: Colors.red, size: 35)),
                    Positioned(bottom: 70, left: 50, child: Icon(Icons.favorite, color: Colors.redAccent, size: 50)),
                    Container(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          colors: [Colors.pink.withOpacity(0.3), Colors.transparent],
                          center: Alignment.center,
                          radius: 0.8,
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "💕",
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [Shadow(color: Colors.yellowAccent, blurRadius: 30)],
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Agar Tum Saath Ho, Har Raah Aasaan Lagti Hai...Mera Dil Kahin Dur Pahadon Mein Kho Gaya Hai, Bas Teri Yaadon Ke Sang...⛰️💞",
                              style: TextStyle(
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                shadows: [Shadow(color: Colors.pinkAccent, blurRadius: 80)],
                                color: Colors.white70,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 40),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.pink,
                                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                shadowColor: Colors.black38,
                                elevation: 8,
                              ),
                              onPressed: _takeSelfie,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.camera_alt, size: 24),
                                  SizedBox(width: 10),
                                  Text("Take Selfie", style: TextStyle(fontSize: 20)),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            TextField(
                              controller: nameController,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                hintText: "Enter your name 💌",
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.pink,
                                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                shadowColor: Colors.black38,
                                elevation: 8,
                              ),
                              onPressed: () {
                                if (_imageFile != null && nameController.text.isNotEmpty) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UltimateRomanticProposal(
                                        name: nameController.text,
                                        imageFile: _imageFile!,
                                      ),
                                    ),
                                  );
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "Please take a selfie & enter your name 💕",
                                  );
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.favorite, size: 24),
                                  SizedBox(width: 10),
                                  Text("Next", style: TextStyle(fontSize: 20)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "© Madhav Vedpathak 2025 | All Rights Reserved | Private License",
                          style: TextStyle(
                            fontSize: 7,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                            shadows: [Shadow(color: Colors.purpleAccent, blurRadius: 20)],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
