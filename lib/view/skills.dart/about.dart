import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/resource/responsive.dart';
import 'package:portfolio/view/about/abourWeb.dart';
import 'package:portfolio/view/about/aboutMobile.dart';
import 'package:portfolio/view/about/aboutTab.dart';

class Skills extends StatefulWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      webView: SkillsWeb(),
      tabView: AboutTab(),
      mobileView: AboutMobile(),
    );
  }
}
