import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookprior/common/widget/widget.dart';
import 'package:lookprior/screens/register_screens/register_screens_view_model.dart';

import '../../common/constant/color_const.dart';
import '../../common/constant/image_const.dart';
import '../../common/constant/string_const.dart';

class RegisterScreens extends StatefulWidget {
  const RegisterScreens({Key? key}) : super(key: key);

  @override
  State<RegisterScreens> createState() => RegisterScreensState();
}

class RegisterScreensState extends State<RegisterScreens> {
  Country _selectedDialogCountry =
  CountryPickerUtils.getCountryByPhoneCode('91');
  @override
  Widget build(BuildContext context) {
    RegisterPageViewModel? registerPageViewModel;
    registerPageViewModel = (registerPageViewModel??RegisterPageViewModel(this));

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body:  SafeArea(
          child: Container(
            height: size.height,
            width: size.width,
            color: ColorsResources.registerScreen,
            child: Stack(
              children: [
                Align(alignment: Alignment.topCenter,child: Padding(
                  padding: const EdgeInsets.only(top: 44),
                  child: Image.asset(ImageResources.registerLogo),
                )),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 107),
                    child: Text(StringResources.registerTitle,style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 26,
                    ),),
                  ),
                ),
                Align(

                  child: Padding(
                    padding: const EdgeInsets.only(top: 162),
                    child: Container(
                      height: double.infinity,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),

                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            name(),
                            email(),
                            conteryCode(context),

                            // conteryCode(context),
                          ],
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



  conteryCode(BuildContext context ) {
    return   Padding(
      padding: const EdgeInsets.only(left: 25,right: 200,top: 15),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
             color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            ListTile(
              onTap: _openCountryPickerDialog,
              title: _buildDialogItem(_selectedDialogCountry),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildDialogItem(Country country) => Row(
    children: <Widget>[
      CountryPickerUtils.getDefaultFlagImage(country),
      Flexible(child: Text("(${country.name})+${country.phoneCode}",overflow: TextOverflow.ellipsis,)),

    ],
  );
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
