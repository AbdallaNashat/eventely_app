import 'package:eventely/core/theme/color_palette.dart';
import 'package:eventely/model/event_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventCard extends StatelessWidget {
  final EventDataModel eventDataModel;
  const EventCard({super.key , required this.eventDataModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: size.size.height * 0.22,
        width: size.size.width * 0.92,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorPalette.primaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16),
          image:  DecorationImage(
            image: AssetImage(eventDataModel.eventImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: ColorPalette.white,
              ),
              padding: const EdgeInsets.symmetric(
                  vertical: 0, horizontal: 8),
              child:  Column(
                children: [
                  Text(
                    DateFormat("dd MMM").format(eventDataModel.eventDate),
                    style: TextStyle(
                      fontSize: 20,
                      color: ColorPalette.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Nov",
                    style: TextStyle(
                      fontSize: 20,
                      color: ColorPalette.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: ColorPalette.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 4 , ),
              child: Row(
                children: [
                   Text(eventDataModel.eventTitle,
                    style: TextStyle(
                        fontSize: 16,
                        color: ColorPalette.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const Spacer(),
                  IconButton(onPressed: (){},  icon: const Icon(Icons.favorite  ,
                    color: ColorPalette.primaryColor ,
                  ) ,
                  ),
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}
