import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventely/core/constants/app_assets.dart';
import 'package:eventely/core/constants/events_data.dart';
import 'package:eventely/core/services/firebase_firestore_service.dart';
import 'package:eventely/core/theme/color_palette.dart';
import 'package:eventely/core/widgets/custom_elevated_button.dart';
import 'package:eventely/core/widgets/event_card.dart';
import 'package:eventely/core/widgets/tab_bar_widget.dart';
import 'package:eventely/model/event_model.dart';
import 'package:eventely/modules/layout_view/provider_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    var provider = Provider.of<ProviderSettings>(context);

    Color textColor = provider.isDark() ? Colors.white : Colors.black;


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
                        GestureDetector(
                          onTap: (){
                            if(provider.isDark()){
                              provider.setCurrentTheme(ThemeMode.light);
                            }else {
                              provider.setCurrentTheme(ThemeMode.dark);
                            }
                          },
                          child: const ImageIcon(
                            AssetImage(AppAssets.sunLogo),
                            color: ColorPalette.white,
                          ),
                        ),
                        const SizedBox(width: 8),
                        CustomElevatedButton(
                          text: provider.currentLanguage == "en" ? "EN" : "AR", // Show current language
                          borderRadius: 8,
                          textColor: ColorPalette.primaryColor,
                          bgColor: ColorPalette.white,
                          onTab: () {
                            String newLanguage = provider.currentLanguage == "en" ? "ar" : "en";
                            provider.setCurrentLanguage(newLanguage);
                          },
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
                      child: TabBar(
                        indicatorColor: Colors.transparent,
                        dividerColor: Colors.transparent,
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        onTap: (index) {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        tabs: [
                          Tab(
                            child: TabBarWidget(
                              text: "All",
                              icon: Icons.copy_all_outlined,
                              isSelected: _selectedIndex == 0,
                            ),
                          ),
                          Tab(
                            child: TabBarWidget(
                              text: "Book Club",
                              icon: Icons.menu_book,
                              isSelected: _selectedIndex == 1,
                            ),
                          ),
                          Tab(
                            child: TabBarWidget(
                              text: "Sport",
                              icon: Icons.directions_bike,
                              isSelected: _selectedIndex == 2,
                            ),
                          ),
                          Tab(
                            child: TabBarWidget(
                              text: "Birthday",
                              icon: Icons.cake,
                              isSelected: _selectedIndex == 3,
                            ),
                          ),
                          Tab(
                            child: TabBarWidget(
                              text: "Gaming",
                              icon: Icons.videogame_asset,
                              isSelected: _selectedIndex == 4,
                            ),
                          ),
                          Tab(
                            child: TabBarWidget(
                              text: "Holiday",
                              icon: Icons.beach_access,
                              isSelected: _selectedIndex == 5,
                            ),
                          ),
                          Tab(
                            child: TabBarWidget(
                              text: "Exhibition",
                              icon: Icons.art_track,
                              isSelected: _selectedIndex == 6,
                            ),
                          ),
                          Tab(
                            child: TabBarWidget(
                              text: "Eating",
                              icon: Icons.fastfood,
                              isSelected: _selectedIndex == 7,
                            ),
                          ),
                          Tab(
                            child: TabBarWidget(
                              text: "meeting",
                              icon: Icons.business_center,
                              isSelected: _selectedIndex == 8,
                            ),
                          ),
                          Tab(
                            child: TabBarWidget(
                              text: "Work Shop",
                              icon: Icons.build,
                              isSelected: _selectedIndex == 9,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            StreamBuilder<QuerySnapshot<EventDataModel>>(
              stream: FirebaseFirestoreService.getStreamData(
                  EventsData.categories[_selectedIndex].name),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Column(
                    children: [
                      const Text("Error"),
                      const SizedBox(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.refresh),
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
                List<EventDataModel> eventDataList = snapshot.data!.docs.map(
                  (element) {
                    return element.data();
                  },
                ).toList();
                return eventDataList.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: eventDataList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return EventCard(
                              eventDataModel: eventDataList[index],
                            );
                          },
                        ),
                      )
                    :  Text(
                        "No Data",
                        style: TextStyle(fontSize: 24,
                        color: textColor,
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
