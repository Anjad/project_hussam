import 'package:e_commarce/data/Sample.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChipDialog extends StatefulWidget {
  const ChipDialog({super.key});

  @override
  _ChipDialogState createState() => _ChipDialogState();
}

class _ChipDialogState extends State<ChipDialog> {
  List<String> chipChoices = [
    'Reds',
    'Blued',
    'Grehgen',
    'Yelloaw',
    'Rhed',
    'Blughde',
    'Green',
    'Yedllow',
    'Red',
    'Blue',
    'Green',
    'Yellow',
    'Redf',
    'Bluefgd',
    'Greens',
    'Yellowd Yellow kkkkkkkkkkkkkkkkkkkkkk',
    'Redc',
    'Bluce',
    'Greecn',
    'Yelloaw'
  ];
  List<String> selectedColors = [];

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (context, StateSetter setState) {
                return AlertDialog(
                  scrollable: true,
                  backgroundColor: Colors.white,
                  elevation: 10,
                  titleTextStyle: GoogleFonts.alexandria(),
                  title: Text('Select color(s)'),
                  content: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 5,
                    runSpacing: 5,
                    children: List<Widget>.generate(
                        SampleData.favData.favDataItems.length, (index) {
                      return ChoiceChip(
                        backgroundColor: Colors.white,
                        pressElevation: 2,
                        selectedColor: Colors.amber[100],
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.black,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        label: Text(chipChoices[index]),
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              selectedColors.add(chipChoices[index]);
                            } else {
                              selectedColors.remove(chipChoices[index]);
                            }
                          });
                        },
                        selected: selectedColors.contains(chipChoices[index]),
                        avatar: selectedColors.contains(chipChoices[index])
                            ? const CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(Icons.task_alt_outlined,
                                    color: Colors.grey),
                              )
                            : const CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(Icons.circle_outlined,
                                    color: Colors.grey),
                              ),
                      );
                    }),
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
      child: Text('Open Dialog'),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(child: ChipDialog()),
    ),
  ));
}
