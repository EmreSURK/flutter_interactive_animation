import 'dart:io';

import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

import 'main.dart';
import 'views/StandartScaffold.dart';

class OrderDetailPage extends StatefulWidget {
  final String heroTag;

  const OrderDetailPage({super.key, required this.heroTag});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  final ValueNotifier<List<XFile>> photos = ValueNotifier(List<XFile>.empty(growable: true));
  FlipCardController cont = FlipCardController();

  // final ScrollController scrollController = ScrollController();

/*   @override
  void initState() {
    super.initState();
    // scrollController.position.addListener(() {
    //   //
    // });
  }
 */
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (cont.state?.isFront == true) {
          await cont.skew(0);
        }
        return true;
      },
      child: StandartScaffol(
        body: [
          (kToolbarHeight / 2).heightBox,
          [
            Hero(
              tag: widget.heroTag,
              child: Material(
                color: Colors.transparent,
                child: FlipCard(
                  fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
                  direction: FlipDirection.HORIZONTAL, // default
                  // side: flipside, // The side to initially display.
                  controller: cont,
                  back: mainContainer([
                    22.heightBox,
                    Icon(Icons.close).objectCenterRight().px20(),
                    22.heightBox,
                    VxTextField(
                      autofocus: false,
                      borderType: VxTextFieldBorderType.roundLine,
                      maxLine: 5,
                      hint: "Write your feedback here",
                      contentPaddingTop: 42,
                    ).p12(),
                    12.heightBox,
                    [
                      ValueListenableBuilder(
                          valueListenable: photos,
                          builder: (BuildContext context, dynamic value, Widget? child) {
                            final canAddImage = photos.value.length < 4;
                            return Icon(
                              canAddImage ? Icons.add_a_photo_outlined : Icons.no_photography,
                              size: 33,
                              color: canAddImage ? Colors.black : Colors.grey.shade500,
                            ).p12().onInkTap(() {
                              // cont.skew(0);
                              ImagePicker().pickImage(source: ImageSource.camera).then((value) {
                                if (value != null) {
                                  photos.value.add(value);
                                  photos.notifyListeners();
                                  // photos.value = photos.value;
                                }
                              });
                            });
                          }),
                      Spacer(),
                      ValueListenableBuilder(
                        valueListenable: photos,
                        builder: (BuildContext context, dynamic value, Widget? child) {
                          return photos.value
                              .mapIndexed((file, i) {
                                return Image.file(
                                  File(file.path),
                                  fit: BoxFit.fill,
                                ).w(44).h(44).clipOval().p2();
                              })
                              .toList()
                              .row();
                        },
                      ),
                    ].row().px32(),
                    32.heightBox,
                    FilledButton(
                      onPressed: () {},
                      child: "Send".text.bold.make().p12().px64(),
                    ),
                  ].column()),
                  front: mainContainer([
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
                    [
                      productList,
                      [
                        "Give Feedback".text.bold.make().p12().onInkTap(() {
                          cont.skew(1);
                        }),
                        // "Give Feedback".text.bold.make(),
                      ].row(alignment: MainAxisAlignment.spaceEvenly).py20()
                    ].column().expand()
                  ].column(crossAlignment: CrossAxisAlignment.start).p32()),
                ),
              ),
            ),
          ].stack()
        ]
            .column(
              crossAlignment: CrossAxisAlignment.start,
            )
            .safeArea(),
      ),
    );
  }

  var productList = [
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
    9.heightBox,
    "Turkish Delight".text.semiBold.make(),
    "1 Carton, 22.13 JD".text.light.color(Colors.blue.shade900.withAlpha(200)).sm.make(),
    9.heightBox,
    "Turkish Delight".text.semiBold.make(),
    "1 Carton, 22.13 JD".text.light.color(Colors.blue.shade900.withAlpha(200)).sm.make(),
    9.heightBox,
    "Turkish Delight".text.semiBold.make(),
    "1 Carton, 22.13 JD".text.light.color(Colors.blue.shade900.withAlpha(200)).sm.make(),
    22.heightBox,
  ].column(crossAlignment: CrossAxisAlignment.start).w(double.maxFinite).scrollVertical().expand();
}

Widget mainContainer(Widget c) {
  return c.box
      .width(double.maxFinite)
      .height(650)
      // .white‡
      .withDecoration(
        BoxDecoration(
          boxShadow: kShadow,
          image: const DecorationImage(
            image: AssetImage(
              "assets/images/boxBack.jpg",
            ),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(33),
        ),
      )
      .make()
      .paddingSymmetric(
        horizontal: 26,
      );
}

/* Widget __transitionBuilder(Widget widget, Animation<double> animation) {
  final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
  return AnimatedBuilder(
    animation: rotateAnim,
    child: widget,
    builder: (context, widget) {
      final isUnder = (ValueKey(1) != widget!.key);
      var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
      tilt *= isUnder ? -1.0 : 1.0;
      final value = isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
      return Transform(
        transform: Matrix4.rotationY(value)..setEntry(3, 0, tilt),
        alignment: Alignment.center,
        child: widget,
      );
    },
  );
}
 */