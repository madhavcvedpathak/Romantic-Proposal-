import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:just_audio/just_audio.dart';
import 'package:url_launcher/url_launcher.dart';


class UltimateRomanticProposal extends StatefulWidget {
  final String name;
  final XFile imageFile;

  UltimateRomanticProposal({required this.name, required this.imageFile});

  @override
  _UltimateRomanticProposalState createState() => _UltimateRomanticProposalState();
}

class _UltimateRomanticProposalState extends State<UltimateRomanticProposal>
    with TickerProviderStateMixin {
  late AudioPlayer _audioPlayer;
  late AnimationController _controller;
  List<Offset> _hearts = [];

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    _playMusic();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat();

    _generateHearts();
  }

  void _playMusic() async {
    await _audioPlayer.setAsset('assets/audio/zarasa.mp3');
    _audioPlayer.play();
  }



  void _generateHearts() {
    for (int i = 0; i < 10; i++) {
      _hearts.add(Offset(
        Random().nextDouble(),
        Random().nextDouble(),
      ));
    }
  }

  void _sendMessage() async {
    final phoneNumber = '9763031538';
    final message = 'I love you, Madhav! 💖 I love you! 💕 You mean the world to me! 🌍💫 Madhav, I don’t know how to say this but… I really like you. 💞 Every time I think about you, I smile 😊. You make everything feel so much better, like I’ve found something truly special. ✨💝 I love how you make me feel happy just by being you. 🥰 You’re so important to me, and I can’t imagine my life without you in it. 💑💖 I promise to always stand by you 🤝, to make you smile every day 😄, and to never let go no matter what happens. 💍💖 I’ll be your biggest supporter 💪, your best friend 🤗, and the one who loves you unconditionally forever. ♾️❤️ I really hope we can make this work. 💞 Hand in hand, heart to heart, forever and always. 💑💖 Your ${widget.name} ............................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................Send for magic feedback !';
    final whatsappUri = Uri.parse("whatsapp://send?phone=$phoneNumber&text=${Uri.encodeComponent(message)}");

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } else {
      print('WhatsApp is not installed.');
    }
  }

  void _showLoveLetter() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text("I Love You ${widget.name}✨💕"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Dear, ${widget.name}\n\n"
                      "From the first time I heard your voice 🎶, something felt different. I didn’t know your name, I hadn’t even seen you, but still, that voice stayed with me. It was like hearing something familiar for the first time, like a song that instantly feels special. 💖✨ Days passed, and I kept wondering—who was she? 🤔 I searched 🔍, I connected the dots, and after what felt like forever ⏳, I finally found out your name. But life had one more surprise waiting for me. The girl I had always thought was cute 🥰, brilliant 🧠, and one of the best in college 🎓… turned out to be you. The same voice, the same person. And that moment, I just smiled 😊 because it felt like everything was falling into place. 🌸 'Pehle awaaz se dil laga 🎶, phir naam jaanne ki bechaini… Aur jab sach samne aaya, tab samjha ki yeh bas ek ittefaq nahi tha.' 💕✨ And then, as if fate itself had planned everything 💫, we finally met. That moment, I just knew—this wasn’t random. This was meant to happen. 🥹💞 So today, I want to ask you something that has been on my mind for a long time… Will you be mine? 💍💖 Will you let me be the one who stands by you 👫, laughs with you 😂, supports you 💪, and makes countless memories together? 📸✨ 💛 'Zindagi ka ek hissa adhura lagta tha, par ab samajh aaya, uss kami ka naam tum thi.' 💕 I don’t know where life will take us 🚀, but one thing I’m sure of—I want to walk that path with you. 💑❤️ With all my heart, ur Maddy ❤️🌹\n\n",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _sendMessage,
                  child: Text("Yes, chalo phir💖🥰😍💍"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("For.. ${widget.name} ❤️"),
        backgroundColor: Colors.pinkAccent.shade100,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.file(
              File(widget.imageFile.path),
              fit: BoxFit.cover,
            ),
          ),
          ..._hearts.map((heart) => AnimatedPositioned(
            duration: Duration(seconds: 3),
            left: heart.dx * MediaQuery.of(context).size.width,
            top: heart.dy * MediaQuery.of(context).size.height,
            child: Icon(Icons.favorite, color: Colors.red, size: 30),
          )),
          Positioned(
            bottom: 80,
            left: MediaQuery.of(context).size.width / 2 - 35,
            child: GestureDetector(
              onTap: _showLoveLetter,
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
