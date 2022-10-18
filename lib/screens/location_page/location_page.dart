import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lookprior/common/constant/color_const.dart';
import 'package:lookprior/common/constant/string_const.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../common/constant/image_const.dart';
import '../../common/widget/commaneText.dart';
import '../../common/widget/common_listtile.dart';
import '../../common/widget/common_navigator.dart';
import '../../common/widget/elevated_button.dart';
import 'category_page/category_page.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  Completer<GoogleMapController> _controller = Completer();
  double _value = 50;
  static final LatLng _kMapCenter =
  LatLng(19.018255973653343, 72.84793849278007);

  static final CameraPosition _kInitialPosition =
  CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsResources.registerScreen,
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: SizedBox(
              height: 30,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    width: 50,
                  ),
                  const CommonText(
                    text: StringResources.selectcategory,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  )
                ],
              )),
        ),
        Expanded(
          child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                   Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CommonText(
                      text: StringResources.categories,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: Colors.grey, width: 0.4)),
                    child: CommonListTile(
                      onTap: () {
                        Navigator.push(context,
                            CommonNavigator(child: const CategoryPage()));
                      },
                      text: ImageResources.category,
                      titletext: StringResources.selectcategory,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      imgtext: ImageResources.backarow,
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CommonText(
                      text: StringResources.location,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: Colors.grey, width: 0.4)),
                    child:  CommonListTile(
                      text: ImageResources.Locationicon1,
                      titletext: 'californiaUSA',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      // imgtext: ImageResources.editicon,
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CommonText(
                      text: 'selectdistance',
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  SfSlider(
                    min: 50,
                    max: 250,
                    value: _value,
                    interval: 50,
                    showTicks: true,
                    showLabels: true,
                    enableTooltip: true,
                    activeColor: ColorsResources.registerScreen,
                    stepSize: 50,
                    inactiveColor: Colors.grey.withOpacity(0.3),
                    onChanged: (dynamic value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                  Expanded(
                    child: Container(
                      height: 200,
                      width:double.infinity,
                      margin: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: GoogleMap(
                        compassEnabled: true,
                        myLocationEnabled: true,
                        zoomGesturesEnabled: true,
                        scrollGesturesEnabled: true,
                        myLocationButtonEnabled: true,
                        rotateGesturesEnabled: true,
                        mapType: MapType.normal,
                        initialCameraPosition: _kInitialPosition,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonElevatedButton(
                    onPressed: () {
                      // _goToTheLake;
                      // setState(() {});
                    },
                    buttonColor: ColorsResources.registerScreen,
                    textSize: 16,
                    text: StringResources.apply,
                    textColor: Colors.white,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )),
        ),
      ]),
    );
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
