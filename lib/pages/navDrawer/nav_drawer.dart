import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxidex_driver/functions/functions.dart';
import 'package:taxidex_driver/pages/NavigatorPages/about.dart';
import 'package:taxidex_driver/pages/NavigatorPages/bankdetails.dart';
import 'package:taxidex_driver/pages/NavigatorPages/driverdetails.dart';
import 'package:taxidex_driver/pages/NavigatorPages/driverearnings.dart';
import 'package:taxidex_driver/pages/NavigatorPages/editprofile.dart';
import 'package:taxidex_driver/pages/NavigatorPages/faq.dart';
import 'package:taxidex_driver/pages/NavigatorPages/history.dart';
import 'package:taxidex_driver/pages/NavigatorPages/makecomplaint.dart';
import 'package:taxidex_driver/pages/NavigatorPages/referral.dart';
import 'package:taxidex_driver/pages/NavigatorPages/selectlanguage.dart';
import 'package:taxidex_driver/pages/NavigatorPages/sos.dart';
import 'package:taxidex_driver/pages/NavigatorPages/updatevehicle.dart';
import 'package:taxidex_driver/pages/NavigatorPages/walletpage.dart';
import 'package:taxidex_driver/pages/onTripPage/map_page.dart';
import 'package:taxidex_driver/pages/vehicleInformations/upload_docs.dart';
import 'package:taxidex_driver/styles/styles.dart';
import 'package:taxidex_driver/translation/translation.dart';

import '../NavigatorPages/fleetdetails.dart';
import '../NavigatorPages/managevehicles.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? key}) : super(key: key);
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      color: page,
      width: media.width,
      child: Directionality(
        textDirection: (languageDirection == 'rtl') ? TextDirection.rtl : TextDirection.ltr,
        child: Drawer(
          backgroundColor: page,
          child: SizedBox(
            width: media.width * 1,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: media.width * 0.03 + MediaQuery.of(context).padding.top,
                  ),
                  SizedBox(
                    width: media.width * 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.chevron_left,
                              size: 32,
                              color: textColor,
                            ),
                          ),
                        ),
                        Container(
                          height: media.width * 0.28,
                          width: media.width * 0.28,
                          margin: EdgeInsets.symmetric(vertical: media.height * 0.015),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                  image: NetworkImage(userDetails['profile_picture']), fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: media.width * 0.59,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: media.width * 0.041,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: media.width * 0.5,
                                child: Text(
                                  userDetails['name'],
                                  style: GoogleFonts.roboto(
                                      fontSize: media.width * eighteen, color: textColor, fontWeight: FontWeight.w600),
                                  maxLines: 1,
                                ),
                              ),
                              //edit profile
                              InkWell(
                                onTap: () async {
                                  var val = await Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => const EditProfile()));
                                  if (val) {
                                    setState(() {});
                                  }
                                },
                                child: Icon(
                                  Icons.edit,
                                  size: media.width * eighteen,
                                  color: textColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: media.width * 0.01,
                        ),
                        Container(
                          width: media.width * 0.55,
                          alignment: Alignment.center,
                          child: Text(
                            userDetails['email'],
                            style: GoogleFonts.roboto(fontSize: media.width * fourteen, color: textColor),
                            maxLines: 1,
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: media.width * 0.7,
                      height: 0.7,
                      margin: EdgeInsets.symmetric(vertical: media.width * 0.1),
                      color: Colors.black12,
                    ),
                  ),
                  Container(
                    width: media.width * 1,
                    child: Column(
                      children: [
                        //history
                        // SizedBox(
                        //   height: media.height * 0.065,
                        //   child: ListTile(
                        //     minLeadingWidth: 25,
                        //     onTap: () {
                        //       Navigator.push(context, MaterialPageRoute(builder: (context) => const History()));
                        //     },
                        //     leading: Image.asset(
                        //       'assets/images/history.png',
                        //       fit: BoxFit.contain,
                        //       width: media.width * 0.055,
                        //       color: primary,
                        //     ),
                        //     title: SizedBox(
                        //       width: media.width * 0.55,
                        //       child: Text(
                        //         languages[choosenLanguage]['text_enable_history'],
                        //         overflow: TextOverflow.ellipsis,
                        //         style: GoogleFonts.roboto(fontSize: media.width * sixteen, color: textColor),
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        //wallet
                        // SizedBox(
                        //   height: media.height * 0.055,
                        //   child: ListTile(
                        //     minLeadingWidth: 25,
                        //     onTap: () {
                        //       Navigator.push(context, MaterialPageRoute(builder: (context) => const WalletPage()));
                        //     },
                        //     leading: Image.asset(
                        //       'assets/images/walletImage.png',
                        //       fit: BoxFit.contain,
                        //       width: media.width * 0.055,
                        //       color: primary,
                        //     ),
                        //     title: SizedBox(
                        //       width: media.width * 0.55,
                        //       child: Text(
                        //         languages[choosenLanguage]['text_enable_wallet'],
                        //         overflow: TextOverflow.ellipsis,
                        //         style: GoogleFonts.roboto(fontSize: media.width * sixteen, color: textColor),
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        //referral
                        SizedBox(
                          height: media.height * 0.065,
                          child: ListTile(
                            minLeadingWidth: 25,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const ReferralPage()));
                            },
                            leading: Image.asset(
                              'assets/images/referral.png',
                              fit: BoxFit.contain,
                              width: media.width * 0.068,
                              color: primary,
                            ),
                            title: SizedBox(
                              width: media.width * 0.55,
                              child: Text(
                                languages[choosenLanguage]['text_enable_referal'],
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(fontSize: media.width * sixteen, color: textColor),
                              ),
                            ),
                          ),
                        ),

                        //vehicle
                        SizedBox(
                          height: media.height * 0.065,
                          child: ListTile(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const UpdateVehicle()));
                            },
                            minLeadingWidth: 25,
                            leading: Image.asset(
                              'assets/images/updateVehicleInfo.png',
                              fit: BoxFit.contain,
                              width: media.width * 0.068,
                              color: primary,
                            ),
                            title: SizedBox(
                              width: media.width * 0.55,
                              child: Text(
                                languages[choosenLanguage]['text_updateVehicle'],
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(fontSize: media.width * sixteen, color: textColor),
                              ),
                            ),
                          ),
                        ),

                        //earnings
                        // SizedBox(
                        //   height: media.height * 0.055,
                        //   child: ListTile(
                        //     onTap: () {
                        //       Navigator.push(context, MaterialPageRoute(builder: (context) => const DriverEarnings()));
                        //     },
                        //     minLeadingWidth: 25,
                        //     leading: Image.asset(
                        //       'assets/images/Earnings.png',
                        //       fit: BoxFit.contain,
                        //       width: media.width * 0.068,
                        //       color: primary,
                        //     ),
                        //     title: SizedBox(
                        //       width: media.width * 0.55,
                        //       child: Text(
                        //         languages[choosenLanguage]['text_earnings'],
                        //         overflow: TextOverflow.ellipsis,
                        //         style: GoogleFonts.roboto(fontSize: media.width * sixteen, color: textColor),
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        //documents
                        SizedBox(
                          height: media.height * 0.065,
                          child: ListTile(
                            onTap: () async {
                              var nav = await Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => Docs(fromPage: '2')));
                              if (nav) {
                                setState(() {});
                              }
                            },
                            minLeadingWidth: 25,
                            leading: Image.asset(
                              'assets/images/manageDocuments.png',
                              fit: BoxFit.contain,
                              width: media.width * 0.046,
                              color: primary,
                            ),
                            title: SizedBox(
                              width: media.width * 0.55,
                              child: Text(
                                languages[choosenLanguage]['text_manage_docs'],
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(fontSize: media.width * sixteen, color: textColor),
                              ),
                            ),
                          ),
                        ),

                        // faq
                        SizedBox(
                          height: media.height * 0.065,
                          child: ListTile(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Faq()));
                            },
                            minLeadingWidth: 25,
                            leading: Image.asset(
                              'assets/images/faq.png',
                              fit: BoxFit.contain,
                              width: media.width * 0.065,
                              color: primary,
                            ),
                            title: SizedBox(
                              width: media.width * 0.55,
                              child: Text(
                                languages[choosenLanguage]['text_faq'],
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(fontSize: media.width * sixteen, color: textColor),
                              ),
                            ),
                          ),
                        ),

                        //sos
                        // SizedBox(
                        //   height: media.height * 0.055,
                        //   child: ListTile(
                        //     onTap: () async {
                        //       var nav =
                        //           await Navigator.push(context, MaterialPageRoute(builder: (context) => const Sos()));
                        //       if (nav) {
                        //         setState(() {});
                        //       }
                        //     },
                        //     minLeadingWidth: 25,
                        //     leading: Image.asset(
                        //       'assets/images/sos.png',
                        //       fit: BoxFit.contain,
                        //       width: media.width * 0.065,color: primary,
                        //     ),
                        //     title: SizedBox(
                        //       width: media.width * 0.55,
                        //       child: Text(
                        //         languages[choosenLanguage]['text_sos'],
                        //         overflow: TextOverflow.ellipsis,
                        //         style: GoogleFonts.roboto(fontSize: media.width * sixteen, color: textColor),
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        //language
                        SizedBox(
                          height: media.height * 0.065,
                          child: ListTile(
                            onTap: () async {
                              var nav = await Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => const SelectLanguage()));
                              if (nav) {
                                setState(() {});
                              }
                            },
                            minLeadingWidth: 25,
                            leading: Image.asset(
                              'assets/images/changeLanguage.png',
                              fit: BoxFit.contain,
                              width: media.width * 0.063,
                              color: primary,
                            ),
                            title: SizedBox(
                              width: media.width * 0.55,
                              child: Text(
                                languages[choosenLanguage]['text_change_language'],
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(fontSize: media.width * sixteen, color: textColor),
                              ),
                            ),
                          ),
                        ),

                        //bank details
                        // SizedBox(
                        //   height: media.height * 0.055,
                        //   child: ListTile(
                        //     onTap: () {
                        //       Navigator.push(context, MaterialPageRoute(builder: (context) => const BankDetails()));
                        //     },
                        //     minLeadingWidth: 25,
                        //     leading: Image.asset(
                        //       'assets/images/updateBank.png',
                        //       fit: BoxFit.contain,
                        //       width: media.width * 0.063,color: primary,
                        //     ),
                        //     title: SizedBox(
                        //       width: media.width * 0.55,
                        //       child: Text(
                        //         languages[choosenLanguage]['text_updateBank'],
                        //         overflow: TextOverflow.ellipsis,
                        //         style: GoogleFonts.roboto(fontSize: media.width * sixteen, color: textColor),
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        //make complaints
                        // SizedBox(
                        //   height: media.height * 0.055,
                        //   child: ListTile(
                        //     onTap: () async {
                        //       var nav = await Navigator.push(
                        //           context, MaterialPageRoute(builder: (context) => MakeComplaint(fromPage: 0)));
                        //       if (nav) {
                        //         setState(() {});
                        //       }
                        //     },
                        //     minLeadingWidth: 25,
                        //     leading: Image.asset(
                        //       'assets/images/makecomplaint.png',
                        //       fit: BoxFit.contain,
                        //       width: media.width * 0.063,
                        //     ),
                        //     title: SizedBox(
                        //       width: media.width * 0.55,
                        //       child: Text(
                        //         languages[choosenLanguage]['text_make_complaints'],
                        //         overflow: TextOverflow.ellipsis,
                        //         style: GoogleFonts.roboto(fontSize: media.width * sixteen, color: textColor),
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        //about
                        // SizedBox(
                        //   height: media.height * 0.055,
                        //   child: ListTile(
                        //     onTap: () async {
                        //       Navigator.push(context, MaterialPageRoute(builder: (context) => const About()));
                        //     },
                        //     minLeadingWidth: 25,
                        //     leading: Image.asset(
                        //       'assets/images/aboutIcon.png',
                        //       fit: BoxFit.contain,
                        //       width: media.width * 0.063,color: primary,
                        //     ),
                        //     title: SizedBox(
                        //       width: media.width * 0.55,
                        //       child: Text(
                        //         languages[choosenLanguage]['text_about'],
                        //         overflow: TextOverflow.ellipsis,
                        //         style: GoogleFonts.roboto(fontSize: media.width * sixteen, color: textColor),
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        //logout
                        SizedBox(
                          height: media.height * 0.065,
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                logout = true;
                              });
                              valueNotifierHome.incrementNotifier();
                              Navigator.pop(context);
                            },
                            minLeadingWidth: 25,
                            leading: Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: Image.asset(
                                'assets/images/logout.png',
                                fit: BoxFit.contain,
                                width: media.width * 0.052,
                                color: primary,
                              ),
                            ),
                            title: SizedBox(
                              width: media.width * 0.55,
                              child: Text(
                                languages[choosenLanguage]['text_logout'],
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(fontSize: media.width * sixteen, color: textColor),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: media.height * 0.044,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
