import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:woofwallet/add_card_screen.dart';
import 'package:woofwallet/notification_screen.dart';
import 'package:woofwallet/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Wallet",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Active",
                          style: TextStyle(
                            color: Color(0xff828282),
                            fontFamily: "Poppins",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(
                        "images/Profile Picture.png",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 36),
                SizedBox(
                  width: 335,
                  height: 140,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40.0),
                    child: Stack(
                      children: [
                        Container(
                          width: 335,
                          height: 140,
                          decoration: BoxDecoration(
                            color: const Color(0xffEA7C00),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Balance",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "£ 1.234",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      fontFamily: "Quicksand",
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Card",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                  Text(
                                    "Mabank",
                                    style: TextStyle(
                                      fontFamily: "Quicksand",
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: -48,
                          top: 55,
                          child: Container(
                            width: 155,
                            height: 143,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 3.5,
                                color: const Color(0xffFBBC05),
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 10,
                          top: -27,
                          child: Container(
                            width: 58,
                            height: 54,
                            decoration: BoxDecoration(
                              color: const Color(0xffFBBC05),
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: 340,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          children: [
                            SvgPicture.asset(
                              "icons/vuesax_linear_convert.svg",
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Transfer",
                              style: TextStyle(
                                fontFamily: "Quicksand",
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddCardScreen(),
                              )),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                "icons/vuesax_linear_export.svg",
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "Payment",
                                style: TextStyle(
                                  fontFamily: "Quicksand",
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            SvgPicture.asset(
                              "icons/vuesax_linear_money-send.svg",
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Payout",
                              style: TextStyle(
                                fontFamily: "Quicksand",
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SvgPicture.asset(
                              "icons/vuesax_linear_add-circle.svg",
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Top up",
                              style: TextStyle(
                                fontFamily: "Quicksand",
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const ListTile(
                  title: Text(
                    "Last Transaction",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Text(
                    "View All",
                    style: TextStyle(
                      color: Color(0xffFB8500),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Quicksand",
                    ),
                  ),
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    "icons/netflix.svg",
                    height: 44,
                    width: 44,
                  ),
                  title: const Text(
                    "Netflix",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: const Text(
                    "Month subscription",
                    style: TextStyle(
                      fontFamily: "Quicksand",
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff828282),
                    ),
                  ),
                  trailing: const Text(
                    "£12",
                    style: TextStyle(
                        fontFamily: "£12",
                        fontSize: 16,
                        color: Color(0xff363853)),
                  ),
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    "icons/paypal.svg",
                    height: 44,
                    width: 44,
                  ),
                  title: const Text(
                    "Paypal",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: const Text(
                    "Tax",
                    style: TextStyle(
                      fontFamily: "Quicksand",
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff828282),
                    ),
                  ),
                  trailing: const Text(
                    "£10",
                    style: TextStyle(
                        fontFamily: "Rubik",
                        fontSize: 16,
                        color: Color(0xff363853)),
                  ),
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    "icons/paylater.svg",
                    height: 44,
                    width: 44,
                  ),
                  title: const Text(
                    "Paylater",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: const Text(
                    "Buy item",
                    style: TextStyle(
                      fontFamily: "Quicksand",
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff828282),
                    ),
                  ),
                  trailing: const Text(
                    "£2",
                    style: TextStyle(
                        fontFamily: "Rubik",
                        fontSize: 16,
                        color: Color(0xff363853)),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 330,
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xffFB8500),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        "icons/wallet2.svg",
                        width: 28,
                      ),
                      SvgPicture.asset(
                        "icons/chart.svg",
                        width: 28,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationScreen(),
                          ),
                        ),
                        child: SvgPicture.asset(
                          "icons/notification.svg",
                          width: 28,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsScreen(),
                          ),
                        ),
                        child: SvgPicture.asset(
                          "icons/setting.svg",
                          width: 28,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
