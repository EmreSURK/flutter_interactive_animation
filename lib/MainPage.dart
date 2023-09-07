import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oaktree_order_tracking/OrderDetiailPage.dart';
import 'package:velocity_x/velocity_x.dart';

import 'main.dart';
import 'views/StandartScaffold.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final counter = ValueNotifier(0);

  final ScrollController scrollController = ScrollController();
  final opacity = 0.0.obs;
  final raWopacity = 0.0.obs;

  void onScroll() {
    print(scrollController.position.pixels);
    raWopacity.value = scrollController.position.pixels / 100;
    opacity.value = min(1, max(0, raWopacity.value - 0.2));
    // opacity.value = min(1, max(0, scrollController.position.pixels / 100 - 0.2));
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return StandartScaffol(
        body: [
      [
        // Spacer(),
        130.heightBox,
        orderCard,
        Obx(() => Padding(padding: EdgeInsets.only(top: 50 - opacity * 50), child: Opacity(child: orderCard, opacity: opacity.value))),
        Obx(() => Padding(padding: EdgeInsets.only(top: 50 - opacity * 50), child: Opacity(child: orderCard, opacity: opacity.value))),
        Obx(() => Padding(padding: EdgeInsets.only(top: 50 - opacity * 50), child: Opacity(child: orderCard, opacity: opacity.value))),

        /* [
          // Spacer(),
          mainButton(),
          55.widthBox,
          mainButton(),
          // Spacer(),
        ].row(alignment: MainAxisAlignment.spaceBetween).positioned(bottom: 20), */
        // ].stack(
      ]
          .column(
              // crossAlignment: CrossAxisAlignment.start,
              )
          .scrollVertical(
            controller: scrollController,
            physics: BouncingScrollPhysics(),
          ),
      Obx(
        () => [
          "Scroll down to see all orders".text.sm.white.center.make(),
          22.heightBox,
          Icon(
            Icons.arrow_drop_down_circle_outlined,
            color: Colors.white,
          ),
        ]
            .column(axisSize: MainAxisSize.min)
            .opacity(value: 1 - opacity.value)
            .paddingOnly(
              bottom: max(0, raWopacity.value * -20 + 50),
            )
            .objectBottomCenter(),
      ),
    ].stack());
  }

  Widget get orderCard {
    final heroTag = Random().nextInt(0x7FFFFFFF).toString();
    return Hero(
      tag: heroTag,
      child: Material(
        color: Colors.transparent,
        child: StandartContainer(
          child: [
            productList.w(double.maxFinite).p32(),
            seeAllButton,
          ].stack(alignment: Alignment.bottomCenter).h(445),
        ).paddingSymmetric(horizontal: 26).onInkTap(() {
          Get.to(
            () => OrderDetailPage(heroTag: heroTag),
            transition: Transition.fadeIn,
            duration: 700.milliseconds,
          );
          counter.value = counter.value + 1;
        }),
      ),
    ).py16();
  }

  Widget get productList => [
        "ON THE WAY".text.bold.xl2.make(),
        5.heightBox,
        "Ordered on 25.07".text.light.make(),
        4.heightBox,
        "Going to arrive on 29.07".text.light.make(),
        12.heightBox,
        "#3536".text.bold.xl2.make(),
        5.heightBox,
        "13.42 JD".text.light.make(),
        14.heightBox,
        "Turkish Delight".text.semiBold.make(),
        "1 Carton, 22.13 JD".text.light.color(Colors.blue.shade900.withAlpha(200)).sm.make(),
        9.heightBox,
        "Turkish Delight".text.semiBold.make(),
        "1 Carton, 22.13 JD".text.light.color(Colors.blue.shade900.withAlpha(200)).sm.make(),
        9.heightBox,
        "Turkish Delight".text.semiBold.make(),
        "1 Carton, 22.13 JD".text.light.color(Colors.blue.shade900.withAlpha(200)).sm.make(),
        9.heightBox,
        "Turkish Delight".text.semiBold.make(),
        "1 Carton, 22.13 JD".text.light.color(Colors.blue.shade900.withAlpha(200)).sm.make(),
        9.heightBox,
        "Turkish Delight".text.semiBold.make(),
        "1 Carton, 22.13 JD".text.light.color(Colors.blue.shade900.withAlpha(200)).sm.make(),
      ].column(
        crossAlignment: CrossAxisAlignment.start,
      );

  Widget get seeAllButton => "See All"
          .text
          .bold
          .xl2
          .make()
          .py12()
          .objectBottomCenter()
          .box
          .withDecoration(
            BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(
                  "assets/images/gradientBottomBack.png",
                ),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(33),
            ),
          )
          .height(170)
          .width(double.maxFinite)
          .make()

      // .backgroundColor(Colors.amber)
      // .objectBottomCenter()
      ;
}
