import 'package:eventely/core/constants/app_assets.dart';
import 'package:eventely/core/constants/local_storage_keys.dart';
import 'package:eventely/core/routes/pages_route_name.dart';
import 'package:eventely/core/services/local_storage_services.dart';
import 'package:eventely/model/on_boarding_model.dart';
import 'package:eventely/modules/onBoarding/widgets/on_boarding_items.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
   int activeIndex = 0 ;
   var controller = PageController();

   @override
  void initState() {
    super.initState();
    LocalStorageServices.setBool(LocalStorageKeys.isFirstTimeRun, false);
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14.0,
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 25,
            ),
            Image.asset(
              AppAssets.eventlyLogo2,
              height: size.height * 0.1,
            ),
            Expanded(
              child:PageView.builder(
                controller: controller,
                onPageChanged: (index){
                  activeIndex = index;
                  setState(() {});
                },
                itemCount: OnBoardingModel.onboardinglist.length,
                itemBuilder: (context, index) {
                  var onBoardingModel = OnBoardingModel.onboardinglist[index];
                  return OnBoardingItems(onBoardingModel: onBoardingModel);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: activeIndex !=0,
                  replacement: const Spacer(),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: IconButton(
                        onPressed: () {
                          controller.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,

                          );
                          if(activeIndex > 0 ){
                            activeIndex--;
                          }

                        },
                        icon: const Icon(
                          Icons.arrow_back_outlined,
                        )),
                  ),
                ),

                 const Spacer(),

                 AnimatedSmoothIndicator(
                  activeIndex: activeIndex,
                  count: OnBoardingModel.onboardinglist.length,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Color(0xff5669FF),
                    dotColor: Color(0xff1C1C1C),
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),

                const Spacer(),

                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: IconButton(
                      onPressed: () {
                        if(activeIndex == OnBoardingModel.onboardinglist.length -1){
                          Navigator.pushReplacementNamed(context, PagesRouteName.signIn);
                        }
                        controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,

                        );
                        if(activeIndex < OnBoardingModel.onboardinglist.length ){
                          activeIndex++;
                        }

                      },
                      icon: const Icon(
                        Icons.arrow_forward_outlined,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
