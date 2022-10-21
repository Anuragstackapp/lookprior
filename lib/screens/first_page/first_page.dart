import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookprior/common/widget/commane_scroll_behavior.dart';
import 'package:lookprior/screens/first_page/categories_api_model/categories_api_model.dart';
import 'package:lookprior/screens/first_page/first_page_view_model.dart';
import 'package:lookprior/screens/first_page/first_page_widget.dart';
import 'package:http/http.dart' as http;
import 'package:lookprior/screens/location_page/location_page.dart';
import '../../common/constant/color_const.dart';
import '../../common/constant/image_const.dart';
import '../../common/constant/string_const.dart';
import '../../common/widget/commaneText.dart';
import '../../common/widget/common_navigator.dart';
import '../notifications_page/notifications_page.dart';


class FirstPage extends StatefulWidget {
  GlobalKey<ScaffoldState>? scaffoldState;
  FirstPage({this.scaffoldState});




  @override
  State<FirstPage> createState() => FirstPageState();
}

class FirstPageState extends State<FirstPage> {

  late Audio audio;
  bool catecoryCheck = false;
  List<String> adsimg = [
    ImageResources.bmw,
    ImageResources.pc,
    ImageResources.bmw,
    ImageResources.pc
  ];
  List<String> modelname = [
    "BMW 2021",
    "iMac Computer",
    "BMW 2021",
    "iMac Computer"
  ];
  List<String> prizename = ["1000", "2500", "1000", "2500"];
  List<String> locationname1 = [
    "California, USA",
    "Hawai, Hanamulu",
    "California, USA",
    "Hawai, Hanamulu"
  ];
  List<String> gridname = [
    (StringResources.canonlens),
    (StringResources.microwave),
    (StringResources.wallet),
    (StringResources.ring)
  ];

  List<String> gridimg = [
    (ImageResources.grid1pic),
    (ImageResources.grid2pic),
    (ImageResources.grid3pic),
    (ImageResources.grid4pic)
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 0),
      () {
        alertDilog(context);
      },
    );
    categoryData();
  }

  void categoryData() async {
    var url = Uri.parse(
        'https://lookprstage.com/admin//api/v1/category/getcategories?isOrderByName=false');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      audio = audioFromJson(response.body);
      print(audio);
    }
    setState(() {
      catecoryCheck = true;
    });
  }

  Widget categoryItem() {
    return Padding(
      padding: const EdgeInsets.only( left: 15, right: 15),
      child: Container(
        height: 80,
        width: double.infinity,
        child: catecoryCheck
            ? (audio.categories!.length > 0
                ? ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Color(0xFFC4F5D8),
                          ),
                          color: Color(0xFFE4FFEF),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Image.network("${audio.categories![0].imagePath}",
                                height: 30),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${audio.categories![0].name}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                              overflow: TextOverflow.fade,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Color(0xFFC4F5D8),
                          ),
                          color: Color(0xFFE4FFEF),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Image.network("${audio.categories![1].imagePath}",
                                height: 30),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${audio.categories![1].name}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                              overflow: TextOverflow.fade,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Color(0xFFC4F5D8),
                          ),
                          color: Color(0xFFE4FFEF),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Image.network("${audio.categories![2].imagePath}",
                                height: 30),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${audio.categories![2].name}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                              overflow: TextOverflow.fade,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Color(0xFFC4F5D8),
                          ),
                          color: Color(0xFFE4FFEF),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Image.network("${audio.categories![3].imagePath}",
                                height: 30),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${audio.categories![3].name}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                              overflow: TextOverflow.fade,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Color(0xFFC4F5D8),
                          ),
                          color: Color(0xFFE4FFEF),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            SvgPicture.asset(ImageResources.catagoryIcon,
                                height: 30),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "More",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                              overflow: TextOverflow.fade,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : const Center(
                    child: Text("No Data Found"),
                  ))
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    FirstPageViewModel? firstPageViewModel;
    firstPageViewModel = (firstPageViewModel ?? FirstPageViewModel(this));

    final size = MediaQuery.of(context).size;

    return  Scaffold(
      resizeToAvoidBottomInset: false,
     appBar:AppBar(
        backgroundColor: ColorsResources.registerScreen,
        elevation: 0,
        leading:InkWell(
            onTap: () {
              print("true");
              widget.scaffoldState!.currentState!.openDrawer();
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SvgPicture.asset(ImageResources.drawerIcon),
            )) ,
        title: Center(child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Image.asset(ImageResources.firstPageIcon),
        ),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {

                Navigator.push(context,
                    CommonNavigator(child: const NotificationsPage()));
              },
              child: SvgPicture.asset(ImageResources.notiFicationIcon,
                  height: 37, width: 20),
            ),
          ),
        ],
      ),
      body:SafeArea(
          child: Container(
            height: size.height,
            width: size.width,
            color: ColorsResources.registerScreen,
            child: Stack(
              children: [

                Padding(
                  padding: const EdgeInsets.only(top: 8, right: 8, left: 15),
                  child: Container(
                    height: 40,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            flex: 7,
                            child: Container(
                              child: seachTextFild(),
                            )),
                        Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {

                                Navigator.push(context,
                                    CommonNavigator(child: const LocationPage()));
                              },
                              child: Container(
                                child: SvgPicture.asset(
                                  ImageResources.locationIcon,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                Align(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Container(
                      height: double.infinity,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          child: ScrollConfiguration(
                            behavior: MyBehavior(),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  categoryItem(),
                                  adsText(),
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 193,
                                          child: ListView.builder(
                                            itemCount: 4,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return Card(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      alignment: Alignment.topRight,
                                                      height: 90,
                                                      width: 140,
                                                      margin: const EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                          color: Colors.grey,
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  adsimg[index]),
                                                              fit: BoxFit.fill),
                                                          borderRadius:
                                                          const BorderRadius.all(
                                                              Radius.circular(5))),
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsets.all(5.0),
                                                        child: SvgPicture.asset(
                                                          ImageResources.likeicon,
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        CommonText(
                                                            text: modelname[index],
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 14),
                                                        const SizedBox(
                                                          width: 4,
                                                        ),
                                                        CommonText(
                                                            text: prizename[index],
                                                            fontWeight: FontWeight.w500,
                                                            color: ColorsResources
                                                                .registerScreen,
                                                            fontSize: 10),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        SvgPicture.asset(
                                                          ImageResources.location,
                                                          height: 11,
                                                        ),
                                                        CommonText(
                                                          text: locationname1[index],
                                                          fontSize: 10,
                                                          color: Colors.grey,
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          height: 27,
                                                          alignment: Alignment.center,
                                                          decoration: BoxDecoration(
                                                              color: ColorsResources
                                                                  .registerScreen,
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  5)),
                                                          child: Container(
                                                              alignment:
                                                              Alignment.center,
                                                              width: 76,
                                                              child: SvgPicture.asset(
                                                                ImageResources.share,
                                                                height: 40,
                                                              )),
                                                        ),
                                                        const SizedBox(
                                                          width: 30,
                                                        ),
                                                        SvgPicture.asset(
                                                          ImageResources.trophyicon,
                                                          height: 27,
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.only(
                                                top: 5, right: 250, left: 15),
                                            child: CommonText(
                                              text: 'Near you',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            )),
                                        SizedBox(
                                          child: GridView.builder(
                                            itemCount: 4,
                                            shrinkWrap: true,
                                            physics:
                                            const NeverScrollableScrollPhysics(),
                                            gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                childAspectRatio: 0.9,
                                                crossAxisCount: 2),
                                            itemBuilder: (context, index) {
                                              return Card(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      alignment: Alignment.topRight,
                                                      height: 90,
                                                      width: 140,
                                                      margin: const EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                          color: Colors.grey,
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  gridimg[index]),
                                                              fit: BoxFit.fill),
                                                          borderRadius:
                                                          const BorderRadius.all(
                                                              Radius.circular(10))),
                                                      child: SvgPicture.asset(
                                                        ImageResources.likeicon,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 10),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          CommonText(
                                                              text: gridname[index],
                                                              fontWeight:
                                                              FontWeight.w400,
                                                              fontSize: 14),
                                                          const SizedBox(
                                                            width: 4,
                                                          ),
                                                          CommonText(
                                                              text: prizename[index],
                                                              fontWeight:
                                                              FontWeight.w500,
                                                              color: ColorsResources
                                                                  .registerScreen,
                                                              fontSize: 10),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 10),
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                            ImageResources.location,
                                                            height: 11,
                                                          ),
                                                          CommonText(
                                                            text: locationname1[index],
                                                            fontSize: 10,
                                                            color: Colors.grey,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 10),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            height: 26,
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color: ColorsResources
                                                                    .registerScreen,
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(6)),
                                                            child: Container(
                                                                alignment:
                                                                Alignment.center,
                                                                width: 76,
                                                                child: SvgPicture.asset(
                                                                  ImageResources.share,
                                                                  height: 40,
                                                                )),
                                                          ),

                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // conteryCode(context),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Country Pickers Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//API Collection : https://www.getpostman.com/collections/2b3e2d731ae23c6acd7e
//       routes: {
//         '/': (context) => DemoPage(),
//       },
//     );
//   }
// }
