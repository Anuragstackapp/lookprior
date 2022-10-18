
import 'package:flutter/material.dart';
import 'package:lookprior/common/constant/color_const.dart';

import '../../common/constant/image_const.dart';
import '../../common/constant/string_const.dart';
import '../../common/widget/commaneText.dart';


class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {


  List<String> notificationName = [
    (StringResources.notifitext),
    (StringResources.notifitext1),
    (StringResources.notifitext2),
    (StringResources.notifitext3),
    (StringResources.notifitext4)
  ];

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
                    text: StringResources.notifications,
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
            child: ListView(children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CommonText(
                  text: StringResources.timenotifi,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              ListTile(
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration:  BoxDecoration(
                      color: ColorsResources.registerScreen,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(ImageResources.looklogo),
                          scale: 1.8)),
                ),
                title: const CommonText(
                    text: StringResources.notifitext,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                subtitle: const CommonText(
                    text: StringResources.messtime,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
                trailing: const Padding(
                  padding: EdgeInsets.only(bottom: 35),
                  child: Icon(
                    Icons.more_horiz,
                    color: Colors.grey,
                    size: 30,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CommonText(
                  text: StringResources.timenotifi1,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height:MediaQuery.of(context).size.height * 0.70,
                child: ListView.builder(itemCount: notificationName.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                        height: 50,
                        width: 50,
                        decoration:  BoxDecoration(
                            color: ColorsResources.registerScreen,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(ImageResources.looklogo),
                                scale: 1.8)),
                      ),
                      title:  CommonText(
                          text: notificationName[index],
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      subtitle: const CommonText(
                          text: StringResources.messtime,
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                      trailing: const Padding(
                        padding: EdgeInsets.only(bottom: 35),
                        child: Icon(
                          Icons.more_horiz,
                          color: Colors.grey,
                          size: 30,
                        ),
                      ),
                    );
                  },
                ),
              )
            ]),
          ),
        ),
      ]),
    );
  }
}
