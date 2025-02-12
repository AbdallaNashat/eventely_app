import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:eventely/core/theme/color_palette.dart';
import 'package:eventely/modules/layout_view/provider_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    var provider = Provider.of<ProviderSettings>(context);

    Color textColor = provider.isDark() ? Colors.white : Colors.black;


    return Scaffold(
      body: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
            decoration: const BoxDecoration(
              color: ColorPalette.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(64.0),
              ),
            ),
            height: size.size.height * 0.27,
            width: size.size.height * 1,
            child: Row(
              children: [
                Container(
                  height: 124,
                  width: 124,
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    color: ColorPalette.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(1000.0),
                      bottomRight: Radius.circular(1000.0),
                      topRight: Radius.circular(1000.0),
                      topLeft: Radius.circular(25.0),
                    ),
                  ),
                  child: Image.asset("assets/images/route.png"),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Abdalla Nashaat",
                        style: TextStyle(
                          fontSize: 24,
                          color: ColorPalette.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "abdallanashat42@gmail.com",
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorPalette.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text("Language",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),

                CustomDropdown<String>(
                  hintText: provider.currentLanguage == "en" ? "English" : "عربي",
                  items: provider.languages,
                  onChanged: (value) {
                    if(value == "English"){
                      provider.setCurrentLanguage("en");
                    }else{
                      provider.setCurrentLanguage("ar");
                    }
                  },
                  decoration:  CustomDropdownDecoration(
                    closedBorder: Border.all(
                      color: ColorPalette.primaryColor,
                    ),
                    closedFillColor: Colors.transparent,

                    closedBorderRadius: BorderRadius.circular(16),
                      closedSuffixIcon: const Icon(Icons.arrow_drop_down_rounded,
                      size: 28,
                        color: ColorPalette.primaryColor,
                      ),
                  ),
                ),
                const SizedBox(height: 15,),
                 Text("Theme",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),),
                CustomDropdown<String>(

                  hintText: provider.isDark() ? "Light" : "Dark",
                  items: provider.themes,
                  onChanged: (value) {
                    if(value == "Dark") provider.setCurrentTheme(ThemeMode.dark);
                    if(value == "Light") provider.setCurrentTheme(ThemeMode.light);
                  },
                  decoration:  CustomDropdownDecoration(
                    closedBorder: Border.all(
                      color: ColorPalette.primaryColor,
                    ),
                    closedFillColor: Colors.transparent,
                    closedBorderRadius: BorderRadius.circular(16),
                    closedSuffixIcon: const Icon(Icons.arrow_drop_down_rounded,
                      size: 28,
                      color: ColorPalette.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
