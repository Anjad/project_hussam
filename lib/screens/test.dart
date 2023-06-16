import 'package:beehatrack/screens/massage_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import '../helper/Colorsys.dart';
import '../models/User.dart';

class WorkStatus extends StatefulWidget {
  User user;
  WorkStatus({super.key, required this.user});

  @override
  State<WorkStatus> createState() => _WorkStatusState();
}

class _WorkStatusState extends State<WorkStatus> {
  final dataMap = <String, double>{
    "work-done": 35,
    "work-remaining": 65,
  };

  final colorList = <Color>[
    Colorsys.orange,
    Colors.redAccent,
  ];

  void onTapGridItem(String title, int idx) {
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
          content: Scaffold(
            backgroundColor: Colorsys.lightGrey,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colorsys.grey,
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    size: 25,
                    color: Colorsys.grey,
                  ),
                  onPressed: () {},
                )
              ],
            ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Hero(
                                      transitionOnUserGestures: true,
                                      tag: widget.user.name,
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            widget.user.profilePicture),
                                        maxRadius: 40,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      widget.user.name,
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
                                        MediaQuery.of(context).size.width / 5,
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
                              "Campaign",
                              style:
                                  TextStyle(fontSize: 14, color: Colorsys.grey),
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
                              style:
                                  TextStyle(fontSize: 14, color: Colorsys.grey),
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
                              style:
                                  TextStyle(fontSize: 14, color: Colorsys.grey),
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
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorsys.lightGrey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colorsys.grey,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_horiz,
              size: 25,
              color: Colorsys.grey,
            ),
            onPressed: () {},
          )
        ],
      ),
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Hero(
                                transitionOnUserGestures: true,
                                tag: widget.user.name,
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(widget.user.profilePicture),
                                  maxRadius: 40,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                widget.user.name,
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
                                  MediaQuery.of(context).size.width / 5,
                              chartType: ChartType.ring,
                              baseChartColor: Colors.red[50]!.withOpacity(0.15),
                              colorList: colorList,
                              legendOptions: const LegendOptions(
                                showLegendsInRow: false,
                                legendPosition: LegendPosition.bottom,
                                showLegends: true,
                                legendTextStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              centerTextStyle: GoogleFonts.farro(fontSize: 10),
                              chartValuesOptions: const ChartValuesOptions(
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
                    mainAxisAlignment: MainAxisAlignment.start,
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
                        "Campaign",
                        style: TextStyle(fontSize: 14, color: Colorsys.grey),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Video",
                        style: TextStyle(fontSize: 14, color: Colorsys.grey),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Logo",
                        style: DefaultTextStyle.of(context).style.copyWith(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 14,
                            color: Colorsys.grey),
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
                        style: TextStyle(fontSize: 14, color: Colorsys.grey),
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
                        style: TextStyle(fontSize: 14, color: Colorsys.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

/*

 */
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MessagingPage()));
                  },
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

  Widget makeFollowWidgets({count, name}) {
    return Row(
      children: <Widget>[
        Text(
          count.toString(),
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colorsys.black),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 15, color: Colorsys.darkGray),
        ),
      ],
    );
  }
}
