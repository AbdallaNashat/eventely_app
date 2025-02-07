import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventely/core/constants/app_assets.dart';
import 'package:eventely/core/constants/events_data.dart';
import 'package:eventely/core/services/firebase_firestore_service.dart';
import 'package:eventely/core/theme/color_palette.dart';
import 'package:eventely/core/widgets/custom_elevated_button.dart';
import 'package:eventely/core/widgets/event_card.dart';
import 'package:eventely/core/widgets/tab_bar_widget.dart';
import 'package:eventely/model/event_model.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;

  void _updateCategory(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);

    return DefaultTabController(
      length: 10,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              height: size.size.height * 0.27,
              width: size.size.width,
              decoration: const BoxDecoration(
                color: ColorPalette.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35.0),
                  bottomRight: Radius.circular(35.0),
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome Back",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: ColorPalette.white,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Abdalla Nashat",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: ColorPalette.white,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const ImageIcon(
                          AssetImage(AppAssets.sunLogo),
                          color: ColorPalette.white,
                        ),
                        const SizedBox(width: 8),
                        CustomElevatedButton(
                          text: "EN",
                          borderRadius: 8,
                          textColor: ColorPalette.primaryColor,
                          bgColor: ColorPalette.white,
                          onTab: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: ColorPalette.white,
                        ),
                        Text(
                          "Cairo , Egypt",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: ColorPalette.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: SingleChildScrollView(
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
                                child: TabBarWidget(
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
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            
            StreamBuilder <QuerySnapshot<EventDataModel>>(
              stream: FirebaseFirestoreService.getStreamData(EventsData.categories[selectedIndex].name),
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
                List<EventDataModel> eventDataList =   snapshot.data!.docs.map((element) {
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
                  ) : const Text("No Data" ,
                  style: TextStyle(
                    fontSize: 24
                  ),);
                },
            ),

          ],
        ),
      ),
    );
  }
}
