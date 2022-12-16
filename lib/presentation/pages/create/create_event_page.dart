// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile/data/models/event.dart';
import 'package:flutter_mobile/data/models/event_post.dart';
import 'package:flutter_mobile/data/models/interest.dart';
import 'package:flutter_mobile/helper/constants.dart';
import 'package:flutter_mobile/helper/text_styles.dart';
import 'package:flutter_mobile/logic/cubits/events/events_cubit.dart';
import 'package:flutter_mobile/presentation/widgets/buttons/main_button.dart';
import 'package:flutter_mobile/presentation/widgets/others/custom_text_field.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:intl/intl.dart';

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({super.key});

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  TextEditingController titleInput = TextEditingController();
  TextEditingController descriptionInput = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  TextEditingController timeInput = TextEditingController();
  TextEditingController durationInput = TextEditingController();
  TextEditingController locationInput = TextEditingController();

  final List<Interest> selected = [];
  final List<Interest> interests = [
    Interest(id: 0, title: "Art"),
    Interest(id: 1, title: "Sport"),
    Interest(id: 2, title: "Gaming"),
    Interest(id: 3, title: "Picnic"),
    Interest(id: 4, title: "Reading"),
    Interest(id: 5, title: "Movie"),
    Interest(id: 6, title: "Music"),
  ];

  @override
  void initState() {
    dateInput.text = "";
    timeInput.text = "";
    durationInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        automaticallyImplyLeading: false,
        title: Subtitle1(
          title: "Create your Event",
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Subtitle1(title: "Title"),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: titleInput,
              hintText: "Enter title",
            ),
            SizedBox(
              height: 20,
            ),
            Subtitle1(title: "Date"),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: CustomTextField(
                    controller: dateInput,
                    hintText: "Enter date",
                    label: Text(
                      "Date",
                      style: TextStyle(fontSize: 14),
                    ),
                    keyboardType: TextInputType.datetime,
                    readOnly: true,
                    onTap: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030),
                      );
                      if (pickedDate != null) {
                        final String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        setState(() {
                          dateInput.text = formattedDate;
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 3,
                  child: CustomTextField(
                    controller: timeInput,
                    label: Text(
                      "Start",
                      style: TextStyle(fontSize: 14),
                    ),
                    hintText: "Time",
                    readOnly: true,
                    onTap: () async {
                      final TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        initialEntryMode: TimePickerEntryMode.inputOnly,
                      );
                      if (pickedTime != null) {
                        setState(() {
                          final now = DateTime.now();
                          final time = DateTime(
                            now.year,
                            now.month,
                            now.day,
                            pickedTime.hour,
                            pickedTime.minute,
                          );
                          timeInput.text = DateFormat('HH:mm').format(time);
                          print(timeInput.text);
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 3,
                  child: CustomTextField(
                    label: Text(
                      "Duration",
                      style: TextStyle(fontSize: 14),
                    ),
                    controller: durationInput,
                    hintText: "Duration",
                    readOnly: true,
                    onTap: () async {
                      Picker(
                        adapter: NumberPickerAdapter(
                          data: <NumberPickerColumn>[
                            const NumberPickerColumn(
                              end: 5,
                              suffix: Text('h'),
                            ),
                            const NumberPickerColumn(
                              end: 59,
                              suffix: Text('m'),
                              jump: 5,
                            ),
                          ],
                        ),
                        delimiter: <PickerDelimiter>[
                          PickerDelimiter(
                            child: Container(
                              width: 30.0,
                              alignment: Alignment.center,
                              child: Icon(Icons.more_vert),
                            ),
                          )
                        ],
                        textAlign: TextAlign.center,
                        hideHeader: true,
                        title: Text("Duration"),
                        onConfirm: (Picker picker, List<int> value) {
                          durationInput.text = _formatDuration(
                            Duration(
                              hours: picker.getSelectedValues().cast<int>()[0],
                              minutes:
                                  picker.getSelectedValues().cast<int>()[1],
                            ),
                          );
                        },
                      ).showDialog(context);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Subtitle1(title: "Location"),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: locationInput,
              hintText: "Enter location",
            ),
            SizedBox(
              height: 20,
            ),
            Subtitle1(title: "Interests"),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8,
                children: [...selected, ...interests]
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          if (interests.contains(e)) {
                            setState(() {
                              interests.remove(e);
                              selected.add(e);
                            });
                            return;
                          }
                          if (selected.contains(e)) {
                            setState(() {
                              selected.remove(e);
                              interests.add(e);
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                            top: 5,
                            bottom: 5,
                            right: 10,
                            left: 10,
                          ),
                          margin: EdgeInsets.only(bottom: 10, right: 5),
                          decoration: BoxDecoration(
                            color: selected.contains(e)
                                ? Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.5)
                                : Theme.of(context)
                                    .colorScheme
                                    .shadow
                                    .withOpacity(0.1),
                            borderRadius:
                                BorderRadius.circular(Constants.bigRadius5),
                          ),
                          child: Text(e.title),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.maxFinite,
              child: MainButton(
                title: "Create",
                onPressed: () {
                  print(titleInput.text);
                  print(dateInput.text);
                  print(timeInput.text);
                  print(durationInput.text);
                  print(descriptionInput.text);
                  print(interests.map((e) => e.id).toList());
                  final EventPost event = EventPost(
                    title: titleInput.text,
                    capacity: 10,
                    date: dateInput.text,
                    time: timeInput.text,
                    photo: "",
                    description: "descriptionInput.text",
                    owner: 1,
                    interests: [1],
                  );
                  try {
                    context.read<EventsCubit>().postEvent(event);
                  } catch (e) {
                    print(e.toString());
                  }
                  ;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final String hours = duration.inHours.toString().padLeft(0, '2');
    final String minutes =
        duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    return "$hours:$minutes";
  }
}
