import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: const Center(
          child: Text(
            "Notifications              ",
            style: TextStyle(color: Colors.black),
          ),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff2F1155),
            size: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const NotifcationCard(showUnreadedDot: true),
              const NotifcationCard(
                showUnreadedDot: true,
                title: "Amount Credit",
                subtitle: "You Credit £100.000 to lorem ipsum....",
              ),
              const NotifcationCard(showUnreadedDot: true),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 20, bottom: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Readed",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Container(
                          width: 40,
                          height: 2,
                          decoration: BoxDecoration(
                            color: const Color(0xffFF8F00),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const NotifcationCard(
                showUnreadedDot: true,
                title: "Amount Credit",
                subtitle: "You Credit £100.000 to lorem ipsum....",
              ),
              const NotifcationCard(),
              const NotifcationCard(
                showUnreadedDot: true,
                title: "Amount Credit",
                subtitle: "You Credit £100.000 to lorem ipsum....",
              ),
              const NotifcationCard(
                showUnreadedDot: true,
                title: "Amount Credit",
                subtitle: "You Credit £100.000 to lorem ipsum....",
              ),
              const NotifcationCard(),
              const NotifcationCard(),
              const NotifcationCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class NotifcationCard extends StatelessWidget {
  const NotifcationCard({
    Key? key,
    this.showUnreadedDot = false,
    this.title,
    this.subtitle,
  }) : super(key: key);
  final bool showUnreadedDot;
  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        children: [
          Container(
            width: 338,
            height: 65,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff4D7179).withOpacity(0.16),
                    spreadRadius: 0,
                    blurRadius: 12,
                    offset: const Offset(2, 4), //
                  ),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 12),
                Container(
                  width: 43,
                  height: 43,
                  // margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xffFF9206),
                        width: .5,
                      )),
                  child: Center(
                    child: Image.asset(
                      "icons/logo.png",
                      color: const Color(0xffFF9206),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title ?? "Debit amout",
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: "Quicksand",
                        color: Color(0xff363853),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 150,
                      child: Text(
                        subtitle ?? "You received £100.000 froa...",
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 10,
                          fontFamily: "Quicksand",
                          color: Color.fromARGB(255, 148, 148, 148),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // ListTile(
            //   leading: Image.asset(
            //     "images/notificationIcon.png",
            //   ),

            //   // leading: const Icon(Icons.abc_outlined),
            //   title: const Text(
            //     "Debit amout",
            //     style: TextStyle(
            //       fontSize: 14,
            //       fontFamily: "Quicksand",
            //       color: Color(0xff363853),
            //       fontWeight: FontWeight.w600,
            //     ),
            //   ),
            //   subtitle: const SizedBox(
            //     width: 150,
            //     child: Text(
            //       "You received £100.000 from Alexandra Gibson Jogja...",
            //       style: TextStyle(
            //         fontSize: 10,
            //         fontFamily: "Quicksand",
            //         fontWeight: FontWeight.w500,
            //       ),
            //     ),
            //   ),
            //   trailing: Column(
            //     children: const [
            //       SizedBox(
            //         height: 12,
            //       ),
            //       Text(
            //         "17m ago",
            //         style: TextStyle(
            //           color: Color(0xff828282),
            //           fontSize: 9,
            //           fontFamily: "Quicksand",
            //         ),
            //       )
            //     ],
            //   ),
            // ),
          ),
          const Positioned(
            right: 10,
            top: 12,
            child: Text(
              "17m ago",
              style: TextStyle(
                color: Color(0xff828282),
                fontSize: 9,
                fontFamily: "Quicksand",
              ),
            ),
          ),
          showUnreadedDot
              ? Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 9,
                    height: 9,
                    decoration: BoxDecoration(
                      color: const Color(0xffFF9100),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
