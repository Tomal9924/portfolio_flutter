import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:portfolio/model/experienceModel.dart';
import 'package:portfolio/resource/styles.dart';
import 'package:url_launcher/url_launcher.dart';

enum ScreenType { mobile, tab, web }

class AppClass {
  static final AppClass _mAppClass = AppClass._internal();
  static BuildContext? lastContext;
  ScrollController controller = ScrollController();

  /* URL */
  static final resumeDownloadURL =
      '''https://drive.google.com/file/d/197qIb1NtWg0rOc_ck_lSFujM5GKmNcTw/view?usp=sharing''';

  static final gitSafeC19 = '''https://github.com/jeeva-HBK/SafeC19''';

  // static final gitHermarts = '''https://github.com/jeeva-HBK/SafeC19''';
  static final gitWtIot = '''https://github.com/jeeva-HBK/AutoChem''';
  static final gitAutoStabilizer =
      '''https://github.com/jeeva-HBK/AutoStabilizer''';
  static final gitPAT = '''https://github.com/jeeva-HBK/PAT''';

  // static final gitAVM = '''https://github.com/jeeva-HBK/SafeC19''';

  List<WorkModel> projectList = [
    WorkModel(
        projectTitle: "iEatery",
        projectContent:
            "iEatery is a convenient food delivery app that connects users with a wide range of local restaurants.Browse diverse menus, place orders, and enjoy doorstep delivery with just a few taps.The app features real-time order tracking and secure payment options.Personalized recommendations make discovering new meals easy and fun.Perfect for food lovers seeking variety and speed in their daily dining experience.",
        tech1: "Flutter",
        tech2: "Clean architecture (BloC)",
        tech3: ""),
    WorkModel(
        projectTitle: "T-Score",
        projectContent:
            "T-Score Radio is users go-to app for live streaming cricket and football matches.Catch every moment with real-time commentary and high-quality streams.Stay updated with live scores, match schedules, and team stats.Enjoy smooth streaming and a user-friendly interface for an immersive experience.Perfect for sports fans who never want to miss a game on the go",
        tech1: "Flutter",
        tech2: "Live streaming using Agora.io"),
    WorkModel(
        projectTitle: "IEatery Restaurant App",
        projectContent:
            '''Discover and order from your favorite local restaurants with ease using iEatery.
Enjoy a smooth, responsive experience built with clean architecture and BLoC pattern.
Get real-time updates on order status, deals, and offers via push notifications.
Browse menus and reorder faster thanks to intelligent local data caching.
Whether dine-in or delivery, iEatery makes every meal just a tap away.''',
        tech1: "Flutter",
        tech2: "Local data caching",
        tech3: "BloC"),
    WorkModel(
        projectTitle: "JEAL D/O ",
        projectContent:
            '''Jamuna Electronics and Automobiles Ltd is one of the largest manufacturers and retailers of Electronics products such as Refrigerator, Freezer, Television, Air Conditioner, Small Appliances, and Motor Cycles. It was established in 2014 with a large factory area of 100 Acores land. Use of Modern Machinery, Superb Technology, Skilled Manpower, Reliable source of Raw Materials and Continuous R&D produce high-quality products. Jamuna Electronics is known for its quality and durability.''',
        tech1: "Flutter",
        tech2: "User Management"),
    WorkModel(
        projectTitle: "iCare",
        projectContent:
            '''Attendance Management App, your all-in-one solution for tracking and managing your work attendance! Easily check in and out daily to keep your attendance records up to date. With our intuitive interface, you can quickly view your salary details and apply for attendance adjustments when needed.''',
        tech1: "Flutter",
        tech2: "Attendance Tracking",
        tech3: ""),
    WorkModel(
        projectTitle: "Repose Fit",
        projectContent:
            '''Repose Fit is a Flutter-based fitness UI template designed for seamless user experience.''',
        tech1: "Flutter",
        tech2: "Progress tracking"),
  ];

  factory AppClass() {
    return _mAppClass;
  }

  AppClass._internal();

  getMqWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  getMqHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  showSnackBar(String msg, {BuildContext? context}) {
    ScaffoldMessenger.of(context ?? lastContext!)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  ScreenType getScreenType(BuildContext context) {
    double scrWidth = getMqWidth(context);
    if (scrWidth > 915) {
      return ScreenType.web;
    } else if (scrWidth < 650) {
      return ScreenType.mobile;
    }
    return ScreenType.tab;
  }

  downloadResume(context) async {
    await launchUrl(Uri.parse(AppClass.resumeDownloadURL));
  }

  alertDialog(context, title, msg) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
                title: Text(title, style: TxtStyle().boldWhite(context)),
                content: Text(msg),
                actions: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () => Navigator.pop(context),
                      child: Text('Okay'))
                ]));
  }

  Future<bool> sendEmail(name, contact, msg) async {
    var url = Uri.https('hbk-portfolio-mailer.web.app', '/sendMail');
    var response = await post(url,
            body: {"name": name, "contactInfo": contact, "message": msg})
        .timeout(Duration(seconds: 10));
    print(response.body);
    return response.statusCode == 200;
  }
}
