import 'dart:async';
import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:taxidex_driver/pages/language/languages.dart';
import 'package:taxidex_driver/pages/loadingPage/loading.dart';
import 'package:taxidex_driver/pages/login/login.dart';
import 'package:taxidex_driver/pages/onTripPage/map_page.dart';
import 'package:taxidex_driver/pages/noInternet/nointernet.dart';
import 'package:taxidex_driver/pages/vehicleInformations/docs_onprocess.dart';
import 'package:taxidex_driver/pages/vehicleInformations/upload_docs.dart';
import 'package:taxidex_driver/widgets/widgets.dart';
import '../../styles/styles.dart';
import '../../functions/functions.dart';
import 'package:http/http.dart' as http;

import '../login/signupmethod.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  String dot = '.';
  bool updateAvailable = false;
  dynamic _package;
  dynamic _version;
  bool _isLoading = false;

  var demopage = TextEditingController();

  //navigate
  navigate() {
    if (userDetails['uploaded_document'] == false) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Docs()));
    } else if (userDetails['uploaded_document'] == true && userDetails['approve'] == false) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DocsProcess(),
          ));
    } else if (userDetails['uploaded_document'] == true && userDetails['approve'] == true) {
      //status approved
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Maps()), (route) => false);
    }
  }

  @override
  void initState() {
    getLanguageDone();

    super.initState();
  }

//get language json and data saved in local (bearer token , choosen language) and find users current status
  getLanguageDone() async {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) async {
      if (!isAllowed) {
        // This is just a basic example. For real apps, you must show some
        // friendly dialog box before call the request method.
        // This is very important to not harm the user experience
        await AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    _package = await PackageInfo.fromPlatform();
    if (platform == TargetPlatform.android) {
      _version = await FirebaseDatabase.instance.ref().child('driver_android_version').get();
    } else {
      _version = await FirebaseDatabase.instance.ref().child('driver_ios_version').get();
    }
    if (_version.value != null) {
      var version = _version.value.toString().split('.');
      var package = _package.version.toString().split('.');

      for (var i = 0; i < version.length || i < package.length; i++) {
        if (i < version.length && i < package.length) {
          if (int.parse(package[i]) < int.parse(version[i])) {
            setState(() {
              updateAvailable = true;
            });
            break;
          } else if (int.parse(package[i]) > int.parse(version[i])) {
            setState(() {
              updateAvailable = false;
            });
            break;
          }
        } else if (i >= version.length && i < package.length) {
          setState(() {
            updateAvailable = false;
          });
          break;
        } else if (i < version.length && i >= package.length) {
          setState(() {
            updateAvailable = true;
          });
          break;
        }
      }
    }

    if (updateAvailable == false) {
      await getDetailsOfDevice();
      if (internet == true) {
        var val = await getLocalData();

        //if user is login and check waiting for approval status and send accordingly
        if (val == '3') {
          navigate();
        }
        //if user is not login in this device
        else if (val == '2') {
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
          });
        } else {
          //user installing first time and didnt yet choosen language
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Languages()));
          });
        }
      } else {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Material(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: media.height * 1,
              width: media.width * 1,
              decoration: BoxDecoration(
                color: page,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: media.height * 0.16,
                  ),
                  SizedBox(
                    height: media.height * 0.15,
                  ),
                  Container(
                    padding: EdgeInsets.all(media.width * 0.01),
                    width: media.width * 0.9,
                    height: media.width * 0.9,
                    decoration: const BoxDecoration(
                        image:
                            DecorationImage(image: AssetImage('assets/images/splash_image.png'), fit: BoxFit.contain)),
                  ),
                  SizedBox(
                    height: media.height * 0.04,
                  ),
                ],
              ),
            ),

            //internet is not connected
            (internet == false)
                ? Positioned(
                    top: 0,
                    child: NoInternet(
                      onTap: () {
                        //try again
                        setState(() {
                          internetTrue();
                          getLanguageDone();
                        });
                      },
                    ))
                : Container(),
          ],
        ),
      ),
    );
  }
}
