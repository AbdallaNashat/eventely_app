import 'package:eventely/core/constants/events_data.dart';
import 'package:eventely/core/services/firebase_firestore_service.dart';
import 'package:eventely/core/services/snack_bar_service.dart';
import 'package:eventely/core/widgets/custom_elevated_button.dart';
import 'package:eventely/core/widgets/custom_text_form_field.dart';
import 'package:eventely/model/event_model.dart';
import 'package:flutter/material.dart';
import 'package:eventely/core/theme/color_palette.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

import 'widgets/tab_bar_widget_create_event.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  final formKey = GlobalKey<FormState>();

  int selectedIndex = 0;

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _updateCategory(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: ColorPalette.white,
      appBar: AppBar(
        backgroundColor: ColorPalette.white,
        title: const Text(
          "Create Event",
          style: TextStyle(
            color: ColorPalette.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    EventsData.categories[selectedIndex].image,
                    height: size.size.height * 0.20,
                    width: size.size.width * 0.9,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
        
                // TabBar
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        List.generate(EventsData.categories.length, (index) {
                      final category = EventsData.categories[index];
                      return GestureDetector(
                        onTap: () => _updateCategory(index),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TabBarWidgetCreateEvent(
                            text: category.name,
                            icon: category.icon,
                            image: category.image,
                            isSelected: selectedIndex == index,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
        
                const SizedBox(height: 20),
        
                // Event Title
                CustomTextFormField(
                  controller: _titleController,
                  prefixIcon: const Icon(Icons.edit_note),
                  hintText: "Event Title",
                  hintColor: ColorPalette.generalGrayColor,
                ),
                const SizedBox(height: 16),
        
                // Event Description
                CustomTextFormField(
                  controller: _descriptionController,
                  minLines: 5,
                  hintText: "Description",
                  hintColor: ColorPalette.generalGrayColor,
                ),
                const SizedBox(height: 16),
        
                Row(
                  children: [
                    const Icon(Icons.calendar_month_rounded),
                    const SizedBox(width: 8),
                    const Text("Event Date"),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        selectedEventDate(context);
                      },
                      child: Text(
                        selectedDate != null
                            ? DateFormat("dd MMM yyyy").format(selectedDate!)
                            : ("Choose Date"),
                        style: const TextStyle(color: ColorPalette.primaryColor),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
        
                Row(
                  children: [
                    const Icon(Icons.access_time),
                    const SizedBox(width: 8),
                    const Text("Event Time"),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        selectedEventTime(context);
                      },
                      child: const Text(
                        "Choose Time",
                        style: TextStyle(color: ColorPalette.primaryColor),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
        
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: ColorPalette.primaryColor),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: ColorPalette.primaryColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(
                            Icons.gps_fixed,
                            color: ColorPalette.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Event Location",
                        style: TextStyle(
                          color: ColorPalette.primaryColor,
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: ColorPalette.primaryColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
        
                // Create Event Button
                CustomElevatedButton(
                  text: "Create Event",
                  bgColor: ColorPalette.primaryColor,
                  onTab: () {
                    var data = EventDataModel(
                      eventTitle: _titleController.text,
                      eventDesc: _descriptionController.text,
                      eventCategory: EventsData.categories[selectedIndex].name,
                      eventImage: EventsData.categories[selectedIndex].image,
                      eventDate: selectedDate ?? DateTime.now(),
                    );
                  if(formKey.currentState!.validate()){
                    if(selectedDate !=null && selectedTime !=null){
                      EasyLoading.show();
                      FirebaseFirestoreService.createNewEvent(data).then((value) {
                       EasyLoading.dismiss();
                       if(value == true){
                         Navigator.pop(context);
                         SnackBarService.showSuccessMessage("Event Created Successfuly");

                       }

                     },
                      );
                    }else{
                      SnackBarService.showErrorMessage("Please Select Date ");
                    }
                  }

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void selectedEventDate(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );

    if (newDate != null) {
      setState(() {
        selectedDate = newDate;
      });
      print(selectedDate);
    }
  }

  void selectedEventTime(BuildContext context) async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (newTime != null) {
      setState(() {
        selectedTime = newTime;
      });
    }
  }
}
