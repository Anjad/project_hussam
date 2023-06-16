import 'package:circular_color_picker/circular_color_picker.dart';
import 'package:beehatrack/data/Sample.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../helper/Colorsys.dart';
import '../widgets/circle_picker.dart';

class VisualDesign extends StatefulWidget {
  const VisualDesign({super.key});

  @override
  _VisualDesignState createState() => _VisualDesignState();
}

class _VisualDesignState extends State<VisualDesign> {
  ScrollController _scrollController = ScrollController();
  TextEditingController _textEditingController = TextEditingController();
  String _displayText = "";
  List<String> selectedColors = [];
  late final ValueNotifier<Color> _chosenColor;
  late int boxIndix;
  Color container1 = Colors.red;
  Color container2 = Colors.red;
  Color container3 = Colors.red;

  void _updateText() {
    setState(() {
      _displayText = _textEditingController.text;
    });
  }

  void onTapGridItem(String title, int idx) {
    if (title == "Job discribtion") {
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
                child: TextField(
                  controller: _textEditingController,
                  cursorColor: Colorsys.orange,
                  maxLength: 500,
                  maxLines: 8,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .black54), // Set the border color when the TextField is focused
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .grey), // Set the border color when the TextField is not focused
                    ),
                    hintText: 'Enter discription',
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    // Set the desired border radius
                  ),
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text(
                  'save',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (title == "Colors") {
      showDialog(
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
            title: const Text("Select favorate colors.."),
            backgroundColor: Colors.white,
            content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: StatefulBuilder(
                builder: (context, setState) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 300.0,
                        maxHeight: 400.0,
                        minHeight: 200.0,
                        minWidth: 300.0,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: 300,
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: Container(
                                    color: Colors.white,
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: CircularColorPicker(
                                              radius: 100,
                                              pickerOptions:
                                                  const CircularColorPickerOptions(
                                                showBackground: true,
                                                backgroundColor: Colors.white,
                                                callOnChangeFunctionOnEnd:
                                                    false,
                                              ),
                                              pickerDotOptions:
                                                  const PickerDotOptions(
                                                isInner: false,
                                                borderWidth: 8,
                                                shadows: [],
                                              ),
                                              onColorChange: (value) {
                                                //
                                                // change it as you want
                                                //
                                                _chosenColor.value = value;
                                              },
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:
                                                ValueListenableBuilder<Color>(
                                              valueListenable: _chosenColor,
                                              builder:
                                                  (context, value, child) =>
                                                      Container(
                                                height: 20,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  color: value,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ValueListenableBuilder<Color>(
                                  valueListenable: _chosenColor,
                                  builder: (context, value, child) => InkWell(
                                    onTap: () {
                                      setState(
                                        () {
                                          boxIndix = 1;
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: 40,
                                      width:
                                          MediaQuery.of(context).size.width / 7,
                                      color: boxIndix == 1
                                          ? (container1 = value)
                                          : container1,
                                    ),
                                  ),
                                ),
                                ValueListenableBuilder<Color>(
                                  valueListenable: _chosenColor,
                                  builder: (context, value, child) => InkWell(
                                    onTap: () {
                                      setState(
                                        () {
                                          boxIndix = 2;
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: 40,
                                      width:
                                          MediaQuery.of(context).size.width / 7,
                                      color: boxIndix == 2
                                          ? (container2 = value)
                                          : container2,
                                    ),
                                  ),
                                ),
                                ValueListenableBuilder<Color>(
                                  valueListenable: _chosenColor,
                                  builder: (context, value, child) => InkWell(
                                    onTap: () {
                                      setState(
                                        () {
                                          boxIndix = 3;
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: 40,
                                      width:
                                          MediaQuery.of(context).size.width / 7,
                                      color: boxIndix == 3
                                          ? (container3 = value)
                                          : container3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    // Set the desired border radius
                  ),
                  textStyle: Theme.of(context).textTheme.headline6,
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  boxIndix = -1;
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, StateSetter setState) {
              return AlertDialog(
                scrollable: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  // Set the desired border radius
                ),
                backgroundColor: Colors.white,
                elevation: 10,
                titleTextStyle: GoogleFonts.josefinSans(fontSize: 18),
                title: Text(title),
                content: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 300.0, // Set the maximum width
                    maxHeight: 400.0,
                    minHeight: 200.0,
                    minWidth: 300.0, // Set the maximum height
                  ),
                  child: SingleChildScrollView(
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 5,
                      runSpacing: 5,
                      children: List<Widget>.generate(
                          SampleData.favData.favDataItems[idx]
                              .favDataCollections.length, (index) {
                        return ChoiceChip(
                          backgroundColor: Colors.white,
                          pressElevation: 2,
                          selectedColor: Colors.amber[100],
                          labelStyle: GoogleFonts.alexandria(fontSize: 14),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Colors.black54,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          label: Text(SampleData.favData.favDataItems[idx]
                              .favDataCollections[index]),
                          onSelected: (bool selected) {
                            setState(() {
                              if (selected) {
                                selectedColors.add(SampleData
                                    .favData
                                    .favDataItems[idx]
                                    .favDataCollections[index]);
                              } else {
                                selectedColors.remove(SampleData
                                    .favData
                                    .favDataItems[idx]
                                    .favDataCollections[index]);
                              }
                            });
                          },
                          selected: selectedColors.contains(SampleData.favData
                              .favDataItems[idx].favDataCollections[index]),
                          avatar: selectedColors.contains(SampleData.favData
                                  .favDataItems[idx].favDataCollections[index])
                              ? const CircleAvatar(
                                  backgroundColor: Colors.amber,
                                  child: Icon(Icons.task_alt_outlined,
                                      color: Colors.white),
                                )
                              : const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.circle_outlined,
                                      color: Colors.grey),
                                ),
                        );
                      }),
                    ),
                  ),
                ),
                actions: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.amber[100], // Replace with your desired color
                      // Add any additional styling here
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Done',
                      style: GoogleFonts.alexandria(
                          fontSize: 14, color: Colors.black54),
                    ),
                  ),
                ],
              );
            },
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _chosenColor = ValueNotifier(const Color(0xFFFF0000));
    boxIndix = -1;
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {}); // Redraw the list when scrolling
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Make your design better\nby choosing the best...",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colorsys.darkGray,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: SizedBox(
                    width: width / 5,
                    child: Expanded(
                      child: Lottie.network(
                          alignment: Alignment.center,
                          "https://assets1.lottiefiles.com/packages/lf20_kimfrhe8.json"),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                controller: _scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Set the number of columns in the grid
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: SampleData.favData.favDataItems.length,
                itemBuilder: (context, index) {
                  final child = SampleData.favData.favDataItems[index];
                  return InkWell(
                    onTap: () => onTapGridItem(child.title.toString(), index),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: SizedBox(
                                child: Lottie.network(
                                    alignment: Alignment.center, child.image),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(child.title,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.acme(
                                      fontSize: 18, color: Colors.grey[900])),
                            ),
                          ],
                        ),
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
}
