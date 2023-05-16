import 'dart:ui';

import 'package:e_commarce/screens/login.dart';
import 'package:e_commarce/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/Sample.dart';
import '../helper/Colorsys.dart';
import '../models/Post.dart';
import 'SinglePost.dart';
import 'SingleUser.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedColor = Colors.blueGrey[200];
  var listImage = [];
  var catType = "";
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ));
                },
                icon: const Icon(
                  Icons.account_circle,
                  size: 30,
                  color: Colors.black54,
                )),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: height / 5,
              width: width,
              color: Colors.yellow[600]!,
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ));
                  },
                  child: const ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/users/hussam.jpg"),
                    ),
                    title: Text(
                      "Hussam General",
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      "Designer | video maker",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ),
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 5,
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: height - height / 4 - 10,
                width: width,
                child: ListView(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.home),
                      title: const Text("Home Page"),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      trailing: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 16,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.shopping_cart_sharp),
                      title: const Text("Order History"),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      trailing: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 16,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text("Logout"),
                      onTap: () {
                        Navigator.pop(context);
                        _logOut();
                      },
                      trailing: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 16,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            searchBox(),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "For you",
                    style: TextStyle(
                        color: Colorsys.darkGray,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colorsys.lightGrey))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Recommend",
                              style: TextStyle(
                                  color: Colorsys.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Container(
                              width: 50,
                              padding: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colorsys.orange, width: 3))),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Likes",
                          style: TextStyle(
                              color: Colorsys.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  makePost(Sample.postOne),
                  makePost(Sample.postTwo),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget makePost(Post post) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SingleUser(
                            user: post.user,
                          )));
            },
            child: Row(
              children: <Widget>[
                Hero(
                  transitionOnUserGestures: true,
                  tag: post.user.username,
                  child: CircleAvatar(
                    maxRadius: 28,
                    backgroundImage: AssetImage(post.user.profilePicture),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        post.user.name,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            post.location,
                            style:
                                TextStyle(fontSize: 13, color: Colorsys.grey),
                          ),
                          Text(
                            post.dateAgo,
                            style:
                                TextStyle(fontSize: 13, color: Colorsys.grey),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 300,
            padding: EdgeInsets.only(top: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: post.photos.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SinglePost(
                                  post: post,
                                  image: post.photos[index],
                                )));
                  },
                  child: AspectRatio(
                    aspectRatio: 1.2 / 1,
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(post.photos[index]),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.orange),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              margin: EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  ClipRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 5, sigmaY: 5),
                                      child: Container(
                                        width: 30.0,
                                        height: 30.0,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: Colors.grey[600]!
                                                .withOpacity(0.1)),
                                        child: Center(
                                            child: Image.asset(
                                                'assets/icons/link.png')),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  ClipRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 5, sigmaY: 5),
                                      child: Container(
                                        width: 30.0,
                                        height: 30.0,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: Colors.grey[600]!
                                                .withOpacity(0.1)),
                                        child: Center(
                                            child: Image.asset(
                                                'assets/icons/heart.png')),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget searchBox() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            "Best place to \nFind awesome design",
            style: TextStyle(
                fontSize: 22,
                color: Colorsys.darkGray,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 20, right: 3, top: 3, bottom: 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search for somthing",
                        hintStyle: TextStyle(color: Colorsys.grey),
                        border: InputBorder.none),
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  height: double.infinity,
                  minWidth: 50,
                  elevation: 0,
                  color: Colorsys.orange,
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _logOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('UserId', "");
    prefs.setString('UserName', "");
    prefs.setString('Email', "");
    prefs.setString('phone', "");
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const LoginPage(),
      ),
    );
  }
}
