import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff2F1155),
            size: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Text(
                "Settings",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 65),
              SizedBox(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SvgPicture.asset(
                                "icons/profileSettings.svg",
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "Profile",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Quicksand",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            "icons/ArrowRight.svg",
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SvgPicture.asset(
                                "icons/notificationSettings.svg",
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "Notifications",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Quicksand",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            "icons/ArrowRight.svg",
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SvgPicture.asset(
                                "icons/walletSettings.svg",
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "Your Wallet",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Quicksand",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            "icons/ArrowRight.svg",
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SvgPicture.asset(
                                "icons/keysquareSettings.svg",
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "Login Settings",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Quicksand",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            "icons/ArrowRight.svg",
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SvgPicture.asset(
                                "icons/callcallingSettings.svg",
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "Service Center",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Quicksand",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            "icons/ArrowRight.svg",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      "icons/logout.svg",
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Log Out",
                      style: TextStyle(
                        color: Color(0xffFB8500),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
