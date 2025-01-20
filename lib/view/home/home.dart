import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wecredit/constants/color_constants.dart';
import 'package:wecredit/constants/string_constants.dart';
import 'package:wecredit/controllers/home_screen_controller/home_controller.dart';
import 'package:wecredit/view/home/home_utils.dart';
import '../../constants/textStyleConstant.dart';
import '../../data/images.dart';

class Home extends StatelessWidget {
  Home({super.key});

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/logo.png",
          width: 130,
          height: 40,
        ),
        actions: [
          HomeUtils.customButton("Login"),
          Builder(builder: (context) {
            return IconButton(
              icon: Image.asset(
                "assets/images/drawer_button.png",
                height: 40,
                width: 40,
              ), // Drawer icon
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            );
          }),
        ],
      ),
      endDrawer: HomeUtils.endDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            title(),
            animatedDynamicContainer(),
            carousalSlider(context),
            indicator(),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Our Services",
              style: weight700size20primary,
            ),
            ourServices(),
            const Text(
              "Trending Offers",
              style: weight700size20primary,
            ),
            const SizedBox(
              height: 16,
            ),
            tabBarButton(),
            toggleButton(),
            loanOffers(),
            HomeUtils.certify(),
            ourPartners(),
            const SizedBox(height: 32,),
            const Text("Testimonials", style: weight700size20primary,),
            const SizedBox(height: 12,),
            testimonials(),
            const Text("Frequently asked questions", style: weight700size20primary,),
            const SizedBox(height: 20,),
            faq(),
            const SizedBox(height: 24,),
            footer()
          ],
        ),
      ),
    );
  }

  Widget title() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      child: Text.rich(
        TextSpan(
          text: "Your Trusted Marketplace for ",
          style: weight700Size20Black,
          children: [
            TextSpan(
                text: "Financial Solutions", style: weight700Size20LightBlue)
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget animatedDynamicContainer(){
    return  Container(
      height: 50,
      margin: const EdgeInsets.only(
        left: 50,
        right: 50,
      ),
      width: double.infinity,
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
        borderRadius: BorderRadius.circular(50),
      ),
      child: Container(
        margin: const EdgeInsets.all(0.9),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(50)
          ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: HomeUtils.carouselSlider(
            images.map((imagePath) => Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                ),
              ),
            )
                .toList(),
            scrollDirection: Axis.vertical,
          ),
        ),
      ),
    );
  }

  Widget carousalSlider(context){
    return HomeUtils.carouselSlider([
      Image.asset(
        "assets/images/banner.png",
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          "assets/images/green_dot.png",
          width: 4,
          height: 4,
        ),
        const SizedBox(
          width: 9,
        ),
        const Text(
          "300+\t",
          style: weight700size16blueFour,
        ),
        const Flexible(
          child: Text(
            "new loan request received",
            style: weight600size15blueThree,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(
          width: 7,
        ),
        SizedBox(
          width: 80,
          child: HomeUtils.customButton("Apply", callback: ()=> HomeUtils.bottomSheet(context)),
        ),
      ]),
    ],
        autoPlayInterval: 5,
        homeController: homeController,
    );

  }

  Widget indicator(){
    return Obx(
          () => CarouselIndicator(
        color: greyColor,
        activeColor: blueThree,
        count: 2,
        index: homeController.currentIndex.value,
      ),
    );
  }

  Widget ourServices(){
    return SizedBox(
      height: 100,
      child: ListView.builder(
          padding: const EdgeInsets.only(top: 12, bottom: 16),
          scrollDirection: Axis.horizontal,
          itemCount: services.length,
          itemBuilder: (context, index) {
            return Container(
              margin:
              EdgeInsets.only(left: index == 0 ? 15 : 0, right: 15),
              child: Image.asset(
                services[index],
                width: 90,
              ),
            );
          },
          ),
    );
  }

  Widget tabBarButton(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HomeUtils.tabBarButton(StringConstants.LOANS, () {
          homeController.buttonText.value = StringConstants.LOANS;
        }, homeController),
        const SizedBox(
          width: 16,
        ),
        HomeUtils.tabBarButton(StringConstants.CREDIT_CARDS, () {
          homeController.buttonText.value =
              StringConstants.CREDIT_CARDS;
        }, homeController),
      ],
    );
  }

  Widget toggleButton(){
    return Padding(
      padding: const EdgeInsets.only(
          top: 16, bottom: 20, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Flexible(
              child: Text(
                "Personal Loans",
                style: weight700size14blue,
              )),
          const SizedBox(
            width: 12,
          ),
          AdvancedSwitch(
            activeColor: blueOne,
            inactiveColor: greyColor.withOpacity(0.4),
            height: 16,
            width: 36,
            disabledOpacity: 1,
            thumb: Container(
              decoration: const BoxDecoration(
                color: blueOne,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                size: 10,
                color: whiteColor,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          const Flexible(
              child: Text(
                "Business Loans",
                style: weight700size14grey,
              )),
        ],
      ),
    );
  }

  Widget loanOffers(){
    return ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: HomeUtils.cards.length,
        itemBuilder: (context, index) {
          return Obx(() => homeController.buttonText.value ==
              StringConstants.LOANS
              ? HomeUtils.cards[index]
              : HomeUtils.cards[HomeUtils.cards.length - 1 - index]);
        });
  }

  Widget ourPartners(){
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        HomeUtils.carouselSlider([
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset("assets/images/partners.png"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset("assets/images/partners.png"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset("assets/images/partners.png"),
          ),
        ], fromPartners: true, homeController: homeController),
        Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Obx(
              () => CarouselIndicator(
                color: greyColor.withOpacity(0.5),
                activeColor: blueThree,
                count: 3,
                height: 5,
                width: 10,
                index: homeController.currentIndexPartnersCarousel.value,
              ),
            )),
      ],
    );
  }

  Widget testimonials(){
    return Container(
      height: 192,
      margin: const EdgeInsets.only(bottom: 30),
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index){
            return Container(
              margin: EdgeInsets.only(left: index==0?20:0, right:index == 4?20: 5),
              child: Image.asset(
                "assets/images/testimonial.png",
                height: 192,
                width: 228,
              ),
            );
          }
      ),
    );
  }

  Widget faq(){
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: faqItems.length,
        itemBuilder: (context, index) {
          final faq = faqItems[index];
          return ExpansionTile(
            backgroundColor: skyBlue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            title: Text(
              faq["question"]!,
              style: weight700size14primary,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Text(faq["answer"]!, style: weight400size14primary,),
              ),
            ],
          );
        });
  }

  Widget footer(){
    return Container(
      decoration: const BoxDecoration(
          color: skyBlue
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        children: [
          Align(alignment: Alignment.topLeft,child: Image.asset("assets/images/logo.png", width: 130,),),
          const SizedBox(height: 24,),
          const Align(alignment: Alignment.topLeft,child: Text("Follow Us :", style: weight700size14primary,),),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/facebook.png", height: 40, width: 32,),
              Image.asset("assets/images/instagram.png", height: 40, width: 32,),
              Image.asset("assets/images/Youtube.png", height: 40, width: 32,),
              Image.asset("assets/images/twitter.png", height: 40, width: 32,),
              Image.asset("assets/images/Linkedin.png", height: 40, width: 32,),
            ],
          ),
          const SizedBox(height: 24,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategory(
                    "Company",
                    ["About Us", "Partner With Us", "Careers"],
                  ),
                  _buildCategory(
                    "Legal",
                    ["Privacy Policies", "Terms of Use", "Grievance Redressals"],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategory(
                    "Services Offered",
                    ["Credit Cards", "Personal Loans", "Business Loans"],
                  ),
                  _buildCategory(
                    "Resources",
                    ["Blogs", "Calculator"],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24,),
          const Align(alignment: Alignment.topLeft,child: Text("Download the WeCredit App:", style: weight700size14primary,),),
          const SizedBox(height: 16,),
          Align(alignment: Alignment.topLeft,child: Image.asset("assets/images/google_play.png", width: 195, height: 52,),),
          const SizedBox(height: 12,),



        ],
      ),
    );
  }

  Widget _buildCategory(String title, List<String> items) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:weight700size14primary
          ),
          const SizedBox(height: 8),
          for (var item in items)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: InkWell(
                onTap: () {
                },
                child: Text(
                  item,
                  style:weight500size12primary
                ),
              ),
            ),
        ],
      ),
    );
  }
}
