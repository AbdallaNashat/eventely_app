import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventely/core/services/firebase_firestore_service.dart';
import 'package:eventely/core/theme/color_palette.dart';
import 'package:eventely/core/widgets/custom_text_form_field.dart';
import 'package:eventely/core/widgets/event_card.dart';
import 'package:eventely/model/event_model.dart';
import 'package:flutter/material.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomTextFormField(
                prefixIcon: Icon(Icons.search ,
                color: ColorPalette.primaryColor,),
                hintColor: ColorPalette.primaryColor,
                hintText: "Search For Event",
              ),
            ),
            StreamBuilder <QuerySnapshot<EventDataModel>>(
              stream: FirebaseFirestoreService.getStreamFavoriteData(),
              builder: (context, snapshot) {
                if(snapshot.hasError){
                  return Column(
                    children: [
                      const Text("Error"),
                      const SizedBox(),
                      IconButton(onPressed: (){}, icon:const Icon(Icons.refresh) ,
                        color: ColorPalette.primaryColor,
                      ),
                    ],
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ColorPalette.primaryColor,
                    ),
                  );
                }
                List<EventDataModel> eventDataList = snapshot.data!.docs.map((element) {
                  return element.data();
                },).toList() ;
                return  eventDataList.isNotEmpty ? Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: eventDataList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return  EventCard(eventDataModel: eventDataList[index],);
                    },
                  ),
                ) : const Text("No Favorite Events" ,
                  style: TextStyle(
                      fontSize: 24,
                  ),);
              },
            ),

          ],
        ),
      ),
    );
  }
}
