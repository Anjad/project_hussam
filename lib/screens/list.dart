import 'package:e_commarce/data/Sample.dart';
import 'package:e_commarce/helper/Colorsys.dart';
import 'package:e_commarce/models/User.dart';
import 'package:flutter/material.dart';

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final List<User> users = [
    Sample.adel,
    Sample.anjad,
    Sample.yazan,
    Sample.hussam,
    Sample.yaser,
    Sample.mohammad,
  ];

  List<User> filteredUsers = [];

  @override
  void initState() {
    filteredUsers.addAll(users);
    super.initState();
  }

  void filterUsers(String query) {
    setState(() {
      filteredUsers = users
          .where(
              (user) => user.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'User List',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: TextField(
              onChanged: filterUsers,
              cursorColor: Colorsys.yellow,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                hintText: 'Search users',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colorsys.black),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            /*child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                final user = filteredUsers[index];
                return ListTile(
                  title: Text(
                    user.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(user.profilePicture),
                  ),
                );
              },*/
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: filteredUsers
                  .length, // Replace with the desired number of cards
              itemBuilder: (BuildContext context, int index) {
                final user = filteredUsers[index];
                return Card(
                  color: Colorsys.lightGrey,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 80,
                            color: Colors
                                .transparent, // Modify the color of the upper container
                          ),
                          Expanded(
                            child: Container(
                              color: Colors
                                  .white, // Modify the color of the lower container
                              child: Column(
                                children: [
                                  SizedBox(height: 16),
                                  Text(
                                    user.name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    user.username,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        user.followers.toString(),
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      Text("|"),
                                      SizedBox(width: 4),
                                      Text(
                                        user.following.toString(),
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 20,
                        left: 50,
                        right: 50,
                        child: ClipOval(
                          child: Image.asset(
                            user.profilePicture, // Replace with your image
                            fit: BoxFit.fill,
                            height: 70,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
