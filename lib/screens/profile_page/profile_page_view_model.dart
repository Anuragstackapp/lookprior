import 'package:lookprior/screens/profile_page/profile_page.dart';

import '../../app/shared_preference.dart';
import '../../service/rest_service.dart';
import 'model/get_ads_model.dart';

class ProfilePageViewModel {
  ProfilePageState profilePageState;
  dynamic tokan;
  GetAds? getAds;
  bool adsStatus = false;
  int i = 10;
  bool animatinloder = false;

  ProfilePageViewModel(this.profilePageState) {
    getUserAds();
  }

  Future<GetAds?> getUserAds() async {
    tokan = await SherdPref.getAccessTokan();

    dynamic userResponceAds = await RestService.postRestMethods(
        endPoint: '/api/v1/detail/getmyadds',
        headers: {'Authorization': 'Bearer $tokan'},
        bodyParam: {"pageNo": "1", "pageSize": "$i", "filterId": "1"});

    print("User Ads Tokan ==> $tokan");
    print('Rsponce Ads == > $userResponceAds');
    getAds = getAdsFromJson(userResponceAds);

    if (getAds!.success == true) {
      adsStatus = true;
      profilePageState.setState(() {});
    }
    return null;
  }
}
