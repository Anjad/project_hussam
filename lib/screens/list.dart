import 'package:animated_background/animated_background.dart';
import 'package:e_commarce/data/Sample.dart';
import 'package:e_commarce/helper/Colorsys.dart';
import 'package:e_commarce/models/User.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

import 'test.dart';

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage>
    with TickerProviderStateMixin {
  final List<User> users = [
    SampleData.adel,
    SampleData.anjad,
    SampleData.yazan,
    SampleData.hussam,
    SampleData.yaser,
    SampleData.mohammad,
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

  final dataMap = <String, double>{
    "work-done": 35,
    "work-remaining": 65,
  };

  final colorList = <Color>[
    Colorsys.orange,
    Colors.redAccent,
  ];
  void onTapGridItem(User user) {
    showDialog<void>(
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titleTextStyle: GoogleFonts.josefinSans(fontSize: 18),
          scrollable: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            // Set the desired border radius
          ),
          elevation: 0,
          title: const Text("Discription of your business.."),
          backgroundColor: Colors.white,
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 300.0,
                maxHeight: 400.0,
                minHeight: 200.0,
                minWidth: 300.0,
              ),
              child: Scaffold(
                backgroundColor: Colorsys.lightGrey,
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Hero(
                                          transitionOnUserGestures: true,
                                          tag: user.name,
                                          child: CircleAvatar(
                                            backgroundImage:
                                                AssetImage(user.profilePicture),
                                            maxRadius: 40,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          user.name,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colorsys.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      child: PieChart(
                                        dataMap: dataMap,
                                        chartRadius:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        chartType: ChartType.ring,
                                        baseChartColor:
                                            Colors.red[50]!.withOpacity(0.15),
                                        colorList: colorList,
                                        centerText: "format work",
                                        legendOptions: const LegendOptions(
                                          showLegendsInRow: false,
                                          legendPosition: LegendPosition.bottom,
                                          showLegends: true,
                                          legendTextStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        centerTextStyle:
                                            GoogleFonts.farro(fontSize: 10),
                                        chartValuesOptions:
                                            const ChartValuesOptions(
                                          showChartValuesInPercentage: true,
                                          showChartValuesOutside: false,
                                        ),
                                        totalValue: 100,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              makeActionButtons()
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Work type",
                                  style: GoogleFonts.josefinSans(
                                    textStyle: const TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Video animation",
                                  style: TextStyle(
                                      fontSize: 14, color: Colorsys.grey),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Duration time",
                                  style: GoogleFonts.josefinSans(
                                    textStyle: const TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "1 year",
                                  style: TextStyle(
                                      fontSize: 14, color: Colorsys.grey),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Start date",
                                  style: GoogleFonts.josefinSans(
                                    textStyle: const TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "23/03/2023",
                                  style: TextStyle(
                                      fontSize: 14, color: Colorsys.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
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
          'Clients',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(
          options: ParticleOptions(
            particleCount: 10,
            baseColor: Colorsys.orange,
            spawnMaxSpeed: 100.0,
            spawnMinSpeed: 5.0,
            //image: Image.asset('assets/images/cc.png'),
            spawnMaxRadius: 50.0,
            spawnMinRadius: 10.0,
            minOpacity: 0.3,
            maxOpacity: 0.9,
          ),
        ),
        child: Column(
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
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage2(user: user),
                        ),
                      );
                      //onTapGridItem(user);
                    },
                    child: Card(
                      color: Colors.transparent,
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 80,
                                color: Colors.white.withOpacity(
                                    0.5), // Modify the color of the upper container
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget makeActionButtons() {
    return Transform.translate(
      offset: Offset(0, 20),
      child: Container(
        height: 65,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey, blurRadius: 20, offset: Offset(0, 10))
            ]),
        child: Row(
          children: <Widget>[
            Expanded(
              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  height: double.infinity,
                  elevation: 0,
                  onPressed: () {},
                  color: Colors.transparent,
                  child: Text(
                    "Contact me",
                    style: TextStyle(
                        color: Colorsys.black, fontWeight: FontWeight.w400),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
