
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'package:lookprior/screens/post_add_page/post_your_ad/post_your_ad_view_model.dart';
import '../../../common/constant/color_const.dart';
import '../../../common/widget/elevated_button.dart';



// ignore: must_be_immutable
class PostYourAdDescription extends StatefulWidget {
  List<XFile?> videopath;
  List<XFile?> photoPath;
  PostYourAdDescription(this.videopath,this.photoPath, {super.key});



  @override
  State<PostYourAdDescription> createState() => PostYourAdDescriptionState();
}

class PostYourAdDescriptionState extends State<PostYourAdDescription> {
  PostYourAdViewModel? postYourAdViewModel;

  TextEditingController title = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController description = TextEditingController();


  String dropdownvalue = '';
  String dropdownvalue1 = '';

  // List of items in our dropdown menu
  var items = ['', 'Business'];
  var items1 = ['', 'Business'];
  TextEditingController controller = TextEditingController();
  // Future<bool> goback(){
  //
  //   showDialog(
  //     barrierDismissible: false,
  //     context: context, builder: (context) {
  //     return  WillPopScope(
  //       onWillPop: () async => false,
  //       child: AlertDialog(
  //         content: Text("If you navigate away from this page,You'|| lose your progress.",overflow: TextOverflow.fade),
  //         actions: [
  //           Row(
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.only(left: 40),
  //                 child: ElevatedButton(onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //                     style: ElevatedButton.styleFrom(
  //                       backgroundColor: Colors.grey.shade300,
  //                       textStyle: const TextStyle(
  //                         color: Colors.white
  //                       ),
  //                     ),
  //                     child: const Text("Cancel")),
  //               ),
  //               const SizedBox(width: 30),
  //               Padding(
  //                 padding: const EdgeInsets.only(right: 40),
  //                 child: ElevatedButton(onPressed: () {
  //                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
  //                     return PostAddPage();
  //                   },));
  //                 },
  //                     style: ElevatedButton.styleFrom(
  //                       backgroundColor: ColorsResources.registerScreen,
  //                       textStyle: const TextStyle(
  //                           color: Colors.white
  //                       ),
  //                     ),child: const Text("Ok")),
  //               ),
  //             ],
  //           )
  //         ],
  //       ),
  //     );
  //   },);
  //
  //
  //   // ignore: null_argument_to_non_null_type
  //   return Future.value();
  // }
  @override
  Widget build(BuildContext context) {

    postYourAdViewModel ?? (postYourAdViewModel = PostYourAdViewModel(this));
    return Scaffold(

      appBar: AppBar(
        // leading: IconButton( icon: const Icon(Icons.arrow_back)),
        title: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 35),
          child: Text("Post your Ad",style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Colors.white,
            fontSize: 16

          ),),
        ),
      ),
      backgroundColor: ColorsResources.registerScreen,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: ColorsResources.registerScreen,
        child: Stack(
         children: [
           Container(
             height: double.infinity,
             width: double.infinity,
             decoration: const BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.only(topRight: Radius.circular(35),topLeft: Radius.circular(35)),
             ),
             child: Padding(
               padding: const EdgeInsets.only(top: 35.0),
               child: SingleChildScrollView(
                 child: Column(
                   children: [
                     Align(
                       alignment: Alignment.topLeft,
                       child: Padding(
                         padding: const EdgeInsets.only(left: 20.0),
                         child: Text("Ad Details",style: GoogleFonts.poppins(
                           fontWeight: FontWeight.w500,
                           fontSize: 16,
                           color: Colors.black
                         ),),
                       ),
                     ),
                     Align(
                       alignment: Alignment.topLeft,
                       child: Padding(
                         padding: const EdgeInsets.only(left: 20.0,top: 30),
                         child: Text("Title",style: GoogleFonts.poppins(
                             fontWeight: FontWeight.w400,
                             fontSize: 14,
                             color: Colors.black
                         )),
                       ),
                     ),
                      Padding(
                       padding: const EdgeInsets.only(left: 20.0,top: 10,right: 20),
                       child: SizedBox(
                         height: 45,
                         child: TextField(
                           controller: title,
                           decoration: const InputDecoration(
                             border: OutlineInputBorder(),
                           ),
                         ),
                       ),
                     ),
                     Align(
                       alignment: Alignment.topLeft,
                       child: Padding(
                         padding: const EdgeInsets.only(left: 20.0,top: 10),
                         child: Text("Amount",style: GoogleFonts.poppins(
                             fontWeight: FontWeight.w400,
                             fontSize: 14,
                             color: Colors.black
                         )),
                       ),
                     ),
                      Padding(
                       padding: const EdgeInsets.only(left: 20.0,top: 10,right: 20),
                       child: SizedBox(
                         height: 45,
                         child: TextField(
                           controller: amount,
                           keyboardType: TextInputType.number,
                           decoration: const InputDecoration(
                             border: OutlineInputBorder(),
                             hintText: 'Amount(\$)'
                           ),
                         ),
                       ),
                     ),
                     Align(
                       alignment: Alignment.topLeft,
                       child: Padding(
                         padding: const EdgeInsets.only(left: 20.0,top: 10),
                         child: Text("Description",style: GoogleFonts.poppins(
                             fontWeight: FontWeight.w400,
                             fontSize: 14,
                             color: Colors.black
                         )),
                       ),
                     ),
                      Padding(
                       padding: const EdgeInsets.only(left: 20.0,top: 10,right: 20),
                       child: TextField(
                         controller: description,
                         maxLines: 5,
                         decoration: const InputDecoration(
                           border: OutlineInputBorder(),
                           hintText: 'Description'
                         ),
                       ),
                     ),
                     Align(
                       alignment: Alignment.topLeft,
                       child: Padding(
                         padding: const EdgeInsets.only(left: 20.0,top: 10),
                         child: Text("Select Category",style: GoogleFonts.poppins(
                             fontWeight: FontWeight.w400,
                             fontSize: 14,
                             color: Colors.black
                         )),
                       ),
                     ),
                     Padding(
                       padding:
                       const EdgeInsets.only(top: 15, right: 20, left: 20),
                       child: Container(
                         height: 40,
                         width: double.infinity,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(5.0),
                           border: Border.all(
                               color: Colors.grey,
                               style: BorderStyle.solid,
                               width: 0.80),
                         ),
                         child: DropdownButtonHideUnderline(
                           child: DropdownButton(
                             underline: const SizedBox(),
                             borderRadius: BorderRadius.circular(8),

                             // Initial Value
                             value: dropdownvalue,
                             items: items.map((String items) {
                               return DropdownMenuItem(
                                 value: items,
                                 child: Padding(
                                   padding: const EdgeInsets.only(left: 5),
                                   child: Text(items),
                                 ),
                               );
                             }).toList(),
                             // After selecting the desired option,it will
                             // change button value to selected value
                             onChanged: (String? newValue) {
                               setState(() {
                                 dropdownvalue = newValue!;
                               });
                             },
                           ),
                         ),
                       ),
                     ),
                     Align(
                       alignment: Alignment.topLeft,
                       child: Padding(
                         padding: const EdgeInsets.only(left: 20.0,top: 10),
                         child: Text("Select Subcategory",style: GoogleFonts.poppins(
                             fontWeight: FontWeight.w400,
                             fontSize: 14,
                             color: Colors.black
                         )),
                       ),
                     ),
                     Padding(
                       padding:
                       const EdgeInsets.only(top: 15, right: 20, left: 20),
                       child: Container(
                         height: 40,
                         width: double.infinity,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(5.0),
                           border: Border.all(
                               color: Colors.grey,
                               style: BorderStyle.solid,
                               width: 0.80),
                         ),
                         child: DropdownButtonHideUnderline(
                           child: DropdownButton(
                             underline: const SizedBox(),
                             borderRadius: BorderRadius.circular(8),

                             // Initial Value
                             value: dropdownvalue1,
                             items: items1.map((String items1) {
                               return DropdownMenuItem(
                                 value: items1,
                                 child: Padding(
                                   padding: const EdgeInsets.only(left: 5),
                                   child: Text(items1),
                                 ),
                               );
                             }).toList(),
                             // After selecting the desired option,it will
                             // change button value to selected value
                             onChanged: (String? newValue) {
                               setState(() {
                                 dropdownvalue1 = newValue!;
                               });
                             },
                           ),
                         ),
                       ),
                     ),
                     Align(
                       alignment: Alignment.topLeft,
                       child: Padding(
                         padding: const EdgeInsets.only(left: 20.0,top: 10),
                         child: Text("SELECT LOCATION",style: GoogleFonts.poppins(
                             fontWeight: FontWeight.w400,
                             fontSize: 14,
                             color: Colors.black
                         )),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 20, right: 20,top: 10),
                       child: Container(
                         height: 40,
                         decoration: BoxDecoration(
                             borderRadius: const BorderRadius.all(Radius.circular(8)),
                             border: Border.all(color: Colors.grey, width: 0.9)),
                         child: Row(children: [

                           const Spacer(),
                           Align(
                             alignment: Alignment.topRight,
                             child: TextButton(onPressed: () {

                             }, child: Text("Edit",style: GoogleFonts.poppins(
                                 color: ColorsResources.registerScreen
                             )),),
                           )
                         ]),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(
                           top: 30, bottom: 30, right: 50, left: 50),
                       child: CommonElevatedButton(
                         onPressed: () => postYourAdViewModel!.submitButton(context: context),
                         borderRadius: 9,
                         buttonColor: ColorsResources.registerScreen,
                         textSize: 16,
                         text: 'Post Ad',
                         textColor: Colors.white,
                       ),
                     ),
                   ],
                 ),
               ),
             ),
           ),
           postYourAdViewModel!.status ? Center(child: CircularProgressIndicator(color: ColorsResources.registerScreen,)) : const SizedBox(),
         ],
        ),
      ),
    );
  }





}
