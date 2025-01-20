import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wecredit/controllers/home_screen_controller/home_controller.dart';
import '../../constants/color_constants.dart';
import '../../constants/textStyleConstant.dart';
import '../../main.dart';

class HomeUtils{
  static List<Widget> cards = [
    HomeUtils.buildHighlightOfferCard(logoPath: "assets/images/kreditbee.png", companyName: "KreditBee", highlightTitle: "Highlight of the Offer", amount: "Upto 5 lakhs", interestRate: "From 1.5%", tenure: "Upto 24 m", colors: [yellowTwo,yellowOne,yellowOne.withOpacity(0.35), ]),
    HomeUtils.buildHighlightOfferCard(logoPath: "assets/images/ramcorp.png", companyName: "Ram Fincorp", highlightTitle: "Highlight of the Offer", amount: "Upto 5 lakhs", interestRate: "From 1.5%", tenure: "Upto 24 m", colors: [blueGradientTwo,blueGradientTwo.withOpacity(0.2)]),
    HomeUtils.buildHighlightOfferCard(logoPath: "assets/images/zype.png", companyName: "Zype", highlightTitle: "Highlight of the Offer", amount: "Upto 5 lakhs", interestRate: "From 1.5%", tenure: "Upto 24 m", colors: [peachOne,peachOne.withOpacity(0.2)])
  ];
  static carouselSlider(List<Widget> items, {Axis scrollDirection = Axis.horizontal, double? height, double aspectRatio = 16/9, int autoPlayInterval = 2, HomeController? homeController, bool fromPartners = false}){
    return CarouselSlider(
      options: CarouselOptions(
        height: height,
        aspectRatio: aspectRatio,
        autoPlay: true,
        enlargeFactor: 0,
        viewportFraction: 1,
        autoPlayInterval: Duration(seconds: autoPlayInterval),
        scrollDirection: scrollDirection,
        enlargeCenterPage: true,
        onPageChanged: (index, reason){
          if(!fromPartners) {
            homeController?.currentIndex.value = index;
          }else{
            homeController?.currentIndexPartnersCarousel.value = index;
          }
        }
      ),
      items: items,
    );
  }

  static customButton(String text, {VoidCallback? callback}){
    return Container(
      height: 36,
      width: 78,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        gradient: LinearGradient(
          colors: [lightBlue, blueOne, blueTwo, blueThree], // Gradient colors
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          textStyle: weight600size16white,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
          ),
        ),
        onPressed: callback,
        child: Text( text, style: weight600size16white,),
      ),
    );
  }
  static Widget tabBarButton(String buttonName, VoidCallback voidCallBack, HomeController? homeController){
    return Obx(()=>
        ElevatedButton(
          onPressed: voidCallBack,
          style: ElevatedButton.styleFrom(
              elevation:0,
              shadowColor: transparent,
              backgroundColor: homeController?.buttonText.value==buttonName?blueThree:whiteColor),
          child: Text(
            buttonName,
            style: homeController?.buttonText.value==buttonName?weight600size16white:weight600size16primary,maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
    );
  }

  static Widget buildHighlightOfferCard({
    required String logoPath,
    required String companyName,
    required String highlightTitle,
    required String amount,
    required String interestRate,
    required String tenure,
    required List<Color> colors,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, left: 20, right: 20),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(2, 4),
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: 82,
            height: 90,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors:colors),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  logoPath,
                  width: 70,
                ),
                const SizedBox(height: 11,),
                Text(companyName,style: weight600size8primary,)
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 12 ,top: 12, bottom: 12, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    highlightTitle,
                    style: weight700size13primary,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _infoColumn('Amount', amount),
                      const SizedBox(width: 2,),
                      _infoColumn('Int. Rate', interestRate),
                      const SizedBox(width: 2,),
                      _infoColumn('Tenure', tenure),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  static Widget _infoColumn(String title, String value) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: weight500size10grey,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: weight600size11primary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  static Widget certify(){
    return Container(
      margin: const EdgeInsets.only(top: 21,bottom: 16),
      padding: const EdgeInsets.only(top: 16, left: 34,right: 34, bottom: 22),
      child:  Column(
        children: [
          const Text("Certified by", style: weight700size20primary,),
          const SizedBox(height: 12,),
          Image.asset("assets/images/certify.png")
        ],
      ),
    );
  }

  static bottomSheet(context){
     var ui = SingleChildScrollView(
       child: Container(
         decoration: const BoxDecoration(
           borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16)),
           gradient: LinearGradient(
             begin: Alignment.topLeft,
             end: Alignment.bottomRight,
             colors: [
               color1,
               color2,
               color3,
               color4,
               color5,
               color6,
               color7,
               color8,
               color9,
               color10,
               color11,
             ],
           ),
         ),
         child: Container(
           margin: const EdgeInsets.only(top: 4),
          decoration: const BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16))
          ),
          padding: const EdgeInsets.all(16.0),

          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title
                const Text(
                  "Get Personalized Loan Offers",
                  style: weight700size18primary,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                // Subtitle
                const Text(
                  "Tenure upto 6 months",
                  style:weight500size14blueText,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        color1,
                        color2,
                        color3,
                        color4,
                        color5,
                        color6,
                        color7,
                        color8,
                        color9,
                        color10,
                        color11,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(42)
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(1),
                    constraints: const BoxConstraints(maxWidth: 450),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(42),
                      border: Border.all(color: skyBlue),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Mobile Number Here",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                const Text.rich(
                  TextSpan(
                    text: "By signing up you agree to ",
                    style: TextStyle(fontSize: 13, color: Color(0xff071C2C), fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text: "Terms & Conditions",
                        style: TextStyle(
                            color: blueThree,
                            fontWeight: FontWeight.w500,
                            fontSize: 13
                        ),
                      ),
                      TextSpan(
                        text: " and ",
                        style: TextStyle(fontSize: 13, color: Color(0xff071C2C), fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(
                            color: blueThree,
                            fontWeight: FontWeight.w500,
                            fontSize: 13
                        ),
                      ),
                      TextSpan(
                        text: " of WeCredit.",
                        style: TextStyle(fontSize: 13, color: Color(0xff071C2C), fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  height: 40,
                  constraints: const BoxConstraints(maxWidth: 450),
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(36)),
                    gradient: LinearGradient(
                      colors: [lightBlue, blueOne, blueTwo, blueThree], // Gradient colors
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      textStyle: weight600size16white,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36),
                      ),
                    ),
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Flexible(child: Text( "Apply Now", style: weight600size16white,maxLines: 1,)),
                        const SizedBox(width: 10,),
                        Image.asset("assets/images/arrow.png", height: 16, width: 16,)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
             ),
       ),
     );
     showModalBottomSheet(
         backgroundColor: Colors.white,
         context: context,
         isScrollControlled: true,
         builder: (context) =>
             FractionallySizedBox(
               heightFactor: 0.38,
                 child: ui
             )
     );
  }

  static Widget endDrawer(context){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                color: whiteColor,
              ),
              child: Image.asset(
                "assets/images/logo.png",
              )),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}