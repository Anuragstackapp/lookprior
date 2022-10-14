import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookprior/common/widget/text_form_field.dart';
import 'package:lookprior/common/widget/widget.dart';
import 'package:lookprior/screens/register_screens/register_screens_view_model.dart';
import 'package:lookprior/screens/register_screens/widget.dart';

import '../../common/constant/color_const.dart';
import '../../common/constant/image_const.dart';
import '../../common/constant/string_const.dart';
import '../../common/widget/elevated_button.dart';

class RegisterScreens extends StatefulWidget {
  const RegisterScreens({Key? key}) : super(key: key);

  @override
  State<RegisterScreens> createState() => RegisterScreensState();
}

class RegisterScreensState extends State<RegisterScreens> {
  Country _selectedDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode('91');
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    RegisterPageViewModel? registerPageViewModel;
    registerPageViewModel =
        (registerPageViewModel ?? RegisterPageViewModel(this));

    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: formKey,
      body: SafeArea(
          child: Container(
        height: size.height,
        width: size.width,
        color: ColorsResources.registerScreen,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 44),
                  child:Image.asset(ImageResources.registerLogo),
                )),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 107),
                child: Text(
                  StringResources.registerTitle,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 26,
                  ),
                ),
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
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        name(),
                        email(),
                        conteryCode(context),
                        password(),
                        conformPassword(),
                        registerButton(context),
                        divderrow(),
                        facbookButton(),
                        appleButton(),
                        information(),

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

  void submit() {
    final isValid = formKey.currentState?.validate();
    if (isValid!) {
      isValid == true ? Text("Ok"): const Text("");
    }
    formKey.currentState?.save();
  }
  conteryCode(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
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
                    height: 45,
                decoration:
                    BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey,
                      ),

                    ),
                child: Center(
                  child: ListTile(
                    onTap: _openCountryPickerDialog,
                    title: _buildDialogItem(_selectedDialogCountry),
                  ),
                ),
              )),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 11,right: 25),
                  child: AppTextField(
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

  Widget _buildDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          Flexible(
              child: Text(
            "(${country.name})+${country.phoneCode}",
            overflow: TextOverflow.ellipsis,
          )),
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
