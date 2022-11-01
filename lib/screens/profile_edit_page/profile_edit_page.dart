import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookprior/common/widget/commane_scroll_behavior.dart';
import 'package:lookprior/screens/profile_edit_page/profile_edit_page_view_mode.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

import '../../common/constant/color_const.dart';
import '../../common/constant/image_const.dart';
import '../../common/widget/text_form_field.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditPage> createState() => ProfileEditPageState();
}

class ProfileEditPageState extends State<ProfileEditPage> {
  final controller = ScrollController();
  bool isSwitched = false;
  bool isSwitchedemail = false;
  Country _selectedDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode('91');
  ProfileEditPageViewModel? profileEditPageViewModel;
  String? abc;
  String dropdownvalue = 'Owner';

  // List of items in our dropdown menu
  var items = ['Owner', 'Business'];

  void toggleSwitch(bool value) {

    if(isSwitched == false)
    {
      setState(() {
        isSwitched = true;

      });
      print('Switch Button is ON');
    }
    else
    {
      setState(() {
        isSwitched = false;
      });
      print('Switch Button is OFF');
    }
  }
  void toggleSwitchEmail(bool value1) {

    if(isSwitchedemail == false)
    {
      setState(() {
        isSwitchedemail = true;

      });
      print('Switch Button is ON');
    }
    else
    {
      setState(() {
        isSwitchedemail = false;
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    profileEditPageViewModel =
        (profileEditPageViewModel ?? ProfileEditPageViewModel(this));

    return Scaffold(
      backgroundColor: ColorsResources.registerScreen,
      appBar: ScrollAppBar(
        elevation: 0,
        controller: controller,
        backgroundColor: ColorsResources.registerScreen,
        title: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Text(
                "Edit Profile",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 16),
              ),
            )),
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView(
          controller: controller,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 45,
                          ),
                          child: Row(children: [
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                "First name",
                                style: GoogleFonts.poppins(
                                  color: Colors.grey,
                                ),
                              ),
                            )),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                "Last name",
                                style: GoogleFonts.poppins(
                                  color: Colors.grey,
                                ),
                              ),
                            ))
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(children: [
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: SizedBox(
                                height: 40,
                                child: TextField(
                                    cursorColor: ColorsResources.registerScreen,
                                    decoration: InputDecoration(
                                        hintText: 'Enter first name',
                                        hintStyle: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300),
                                        contentPadding:
                                            const EdgeInsets.only(left: 5),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  ColorsResources.registerScreen),
                                        )),
                                    style: const TextStyle(fontSize: 15)),
                              ),
                            )),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              child: SizedBox(
                                height: 40,
                                child: TextField(
                                    cursorColor: ColorsResources.registerScreen,
                                    decoration: InputDecoration(
                                        hintText: 'Enter last name',
                                        hintStyle: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300),
                                        contentPadding:
                                            const EdgeInsets.only(left: 5),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  ColorsResources.registerScreen),
                                        )),
                                    style: const TextStyle(fontSize: 15)),
                              ),
                            )),
                          ]),
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
                            child: DropdownButton(
                              underline: SizedBox(),
                              borderRadius: BorderRadius.circular(8),
                              icon: SizedBox.shrink(),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 15),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Address",
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20, top: 10, right: 20),
                          child: SizedBox(
                            height: 40,
                            child: TextField(
                                cursorColor: ColorsResources.registerScreen,
                                decoration: InputDecoration(
                                    hintText: 'Address',
                                    hintStyle: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300),
                                    contentPadding:
                                        const EdgeInsets.only(left: 5),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorsResources.registerScreen),
                                    )),
                                style: const TextStyle(fontSize: 15)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 15),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Email",
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20, top: 10, right: 20),
                          child: SizedBox(
                            height: 40,
                            child: TextField(
                                cursorColor: ColorsResources.registerScreen,
                                decoration: InputDecoration(
                                    hintText: 'Email',
                                    hintStyle: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300),
                                    contentPadding:
                                        const EdgeInsets.only(left: 5),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorsResources.registerScreen),
                                    )),
                                style: const TextStyle(fontSize: 15)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 15),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Send people directly to your website for only\n\$0.99. Go for it",
                              style: GoogleFonts.poppins(
                                  color: Colors.grey, fontSize: 12),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: SizedBox(
                            height: 30,
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Pay & Active",
                                      style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          color: ColorsResources.registerScreen),
                                    ))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 5),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Website",
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20, top: 10, right: 20),
                          child: SizedBox(
                            height: 40,
                            child: TextField(
                                cursorColor: ColorsResources.registerScreen,
                                decoration: InputDecoration(
                                    hintText: 'Wesbite Url (optional)',
                                    hintStyle: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300),
                                    contentPadding:
                                        const EdgeInsets.only(left: 5),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorsResources.registerScreen),
                                    )),
                                style: const TextStyle(fontSize: 15)),
                          ),
                        ),
                        conteryCode(
                            context: context,
                            textEditingController:
                                profileEditPageViewModel!.phone),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Row(children: [
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Public Profile",
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15
                                    ),
                                  ),
                                )),
                            Spacer(),
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 28),
                                  child:Switch(
                                    onChanged: toggleSwitch,
                                    value: isSwitched,
                                    activeColor: ColorsResources.registerScreen,
                                    activeTrackColor: Colors.green.shade100,
                                    inactiveThumbColor: Colors.grey.shade300,
                                    inactiveTrackColor: Colors.grey.shade300,
                                  )
                                ))
                          ]),
                        ),
                        Row(children: [
                          Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  "Public Email",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15
                                  ),
                                ),
                              )),
                          Spacer(),
                          Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.only(left: 28),
                                  child:Switch(
                                    onChanged: toggleSwitchEmail,
                                    value: isSwitchedemail,
                                    activeColor: ColorsResources.registerScreen,
                                    activeTrackColor: Colors.green.shade100,
                                    inactiveThumbColor: Colors.grey.shade300,
                                    inactiveTrackColor: Colors.grey.shade300,
                                  )
                              ))
                        ]),

                        Padding(
                          padding: const EdgeInsets.only(
                            top: 30,bottom: 20
                          ),
                          child: Row(children: [
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20,right: 10),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.grey.shade400
                                      ),
                                      onPressed: () {

                                  }, child: Text("Cancel"))
                                )),
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 20),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: ColorsResources.registerScreen
                                      ),
                                      onPressed: () {

                                  }, child: Text("Save")),
                                ))
                          ]),

                        ),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                      ImageResources.profileuser,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  conteryCode(
      {BuildContext? context, TextEditingController? textEditingController}) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        top: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: ListTile(
                      onTap: _openCountryPickerDialog,
                      title: _buildDialogItem(_selectedDialogCountry),
                    ),
                  )),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 11, right: 20),
                  child: AppTextField(
                    textEditingController: profileEditPageViewModel!.phone,
                    textInputType: TextInputType.phone,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFFEAFAF1),
                              borderRadius: BorderRadius.circular(3)),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SvgPicture.asset(ImageResources.phoneIcon),
                          )),
                    ),
                    hintText: 'Phone number (opt)',
                    lable: 'Phone number (opt)',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDialogItem(Country country) {
    abc = country.phoneCode;
    return Padding(
      padding: const EdgeInsets.only(bottom: 18, right: 7),
      child: Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          Flexible(
              child: Text(
            "(${country.name})+${country.phoneCode}",
            overflow: TextOverflow.ellipsis,
          )),
        ],
      ),
    );
  }

  void _openCountryPickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.pink),
          child: CountryPickerDialog(
            titlePadding: EdgeInsets.all(8.0),
            searchCursorColor: Colors.pinkAccent,
            searchInputDecoration: InputDecoration(hintText: 'Search...'),
            isSearchable: true,
            title: Text('Select your phone code'),
            onValuePicked: (Country country) =>
                setState(() => _selectedDialogCountry = country),
            itemBuilder: _buildDialogItem,
            priorityList: [
              CountryPickerUtils.getCountryByIsoCode('TR'),
              CountryPickerUtils.getCountryByIsoCode('US'),
            ],
          ),
        ),
      );
}
