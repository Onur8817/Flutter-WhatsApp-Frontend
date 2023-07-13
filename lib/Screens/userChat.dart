import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:puan/ColorForApp.dart';

class UserChat extends StatelessWidget {
  UserChat({super.key});
  List actions = [
    "Kişiyi görüntüle",
    "Medya, bağlantılar ve belgeler",
    "Ara",
    "Bildirimleri sessize al",
    "Süreli mesajlar",
    "Duvar kağıdı"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 400,
        backgroundColor: Color.fromARGB(255, 7, 94, 84),
        leading: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: GestureDetector(
                  child: Icon(Icons.arrow_back),
                  onTap: () => Navigator.pushNamed(context, "/")),
            ),
            Padding(
                padding: const EdgeInsets.all(3),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  maxRadius: 18,
                  child: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 7, 94, 84),
                  ),
                )),
            SizedBox(
              width: 5,
            ),
            GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/personPage"),
                child: Container(
                  child: Expanded(
                    child: Text(
                      "Onur",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )),
          ],
        ),
        actions: [
          Icon(Icons.video_call),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.call),
          PopupMenuButton(
              itemBuilder: (context) =>
                  actions.map((e) => PopupMenuItem(child: Text(e))).toList())
        ],
      ),
      body: UserChatScreen(),
    );
  }
}

class UserChatScreen extends StatefulWidget {
  const UserChatScreen({super.key});

  @override
  State<UserChatScreen> createState() => _UserChatScreenState();
}

class _UserChatScreenState extends State<UserChatScreen> {
  Widget messageSend(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double screen_width = size.width;
    double screen_height = size.height;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/whatsapp.png"),
              fit: BoxFit.cover)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: Container(
                width: screen_width / 1.1751,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.tag_faces_outlined,
                      color: Colors.grey,
                    ),
                    Flexible(
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                    ),
                    Icon(
                      Icons.attach_file,
                      color: Colors.grey,
                    ),
                    Icon(
                      Icons.camera_alt,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
              ),
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.mic,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: ColorApp.koyuYesilRenk),
            ),
          ),
        ],
      ),
    );
  }

  Widget messageArea() {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/whatsapp.png"),
                fit: BoxFit.cover)),
        child: Flexible(
          child: ListView.builder(
              itemCount: 100, itemBuilder: (context, index) => Text("")),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //ana yapi
      children: [messageArea(), messageSend(context)],
    );
  }
}
