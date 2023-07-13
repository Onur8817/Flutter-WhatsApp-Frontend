import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:puan/ColorForApp.dart';

class PersonPage extends StatelessWidget {
  PersonPage({super.key});
  static List personActionsPopUp = [
    "Paylaş",
    "Düzenle",
    "Telefon Rehberinde Görüntüle",
    "Güvenlik kodunu doğrula"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyUser(),
    );
  }
}

class MyUser extends StatefulWidget {
  const MyUser({super.key});

  @override
  State<MyUser> createState() => _MyUserState();
}

class _MyUserState extends State<MyUser> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Card(
            child: Column(
              children: [
                //Ana ekran
                Header(),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Onur Karahan",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                Text("+90 555 555 55 55"),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(children: [
                      IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.call,
                            color: ColorApp.acikYesilRenk,
                          )),
                      Text(
                        "Sesli",
                        style: TextStyle(color: ColorApp.acikYesilRenk),
                      ),
                    ]),
                    Column(
                      children: [
                        IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.video_camera_front,
                              color: ColorApp.acikYesilRenk,
                            )),
                        Text(
                          "Görüntülü",
                          style: TextStyle(color: ColorApp.acikYesilRenk),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.search,
                              color: ColorApp.acikYesilRenk,
                            )),
                        Text(
                          "Ara",
                          style: TextStyle(color: ColorApp.acikYesilRenk),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey.shade300)),
              margin: EdgeInsets.symmetric(vertical: 10),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Meşgul",
                      style: TextStyle(),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "7 Ocak 2004",
                      style: TextStyle(color: Colors.black54),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: BoxDecoration(color: Colors.amber),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //geri tusu resım ve menu bulunacak

          Padding(
              padding: EdgeInsets.only(bottom: 80, left: 10),
              child: IconButton(
                onPressed: () => Navigator.pushNamed(context, "/userChat"),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.grey.shade700,
                ),
              )),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: CircleAvatar(
              backgroundColor: ColorApp.koyuYesilRenk,
              maxRadius: 50,
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 80, right: 10),
            child: PopupMenuButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.grey.shade700,
                ),
                itemBuilder: (context) => PersonPage.personActionsPopUp
                    .map((e) => PopupMenuItem(child: Text(e)))
                    .toList()),
          )
        ],
      ),
    );
  }
}
