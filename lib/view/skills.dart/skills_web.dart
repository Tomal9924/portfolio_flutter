import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../resource/appClass.dart';
import '../../resource/colors.dart';

class SkillsWeb extends ConsumerStatefulWidget {
  const SkillsWeb({Key? key}) : super(key: key);

  @override
  ConsumerState<SkillsWeb> createState() => _AboutWebState();
}

class _AboutWebState extends ConsumerState<SkillsWeb> {
  final List<Map<String, List<String>>> skills = [
    {
      "Programming Languages": ["Dart", "Java (Android)"],
    },
    {
      "Platform": ["Flutter"],
    },
    {
      "Database": ["Hydrated Bloc", "Hive", "Firestore", "SQFLite"],
    },
    {
      "Version Control": ["Git", "SVN"],
    },
    {
      "Design Patterns": ["Cubit", "Bloc", "Provider", "Clean Architecture", "Riverpod"],
    },
    {
      "Services": [
        "RESTful APIs (http, dio, chopper)",
        "Firebase Auth / Push Notification",
        "Google ML Kit",
        "Agora.io",
        "Cart Service",
        "URL Deeplinking",
        "Data Caching (Hydrated Bloc)"
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppClass().getMqHeight(context) - 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
                text: "03.",
                style: TextStyle(color: AppColors().neonColor, fontSize: 20, fontFamily: 'sfmono'),
                children: <TextSpan>[
                  TextSpan(
                    text: ' My Skills',
                    style: GoogleFonts.roboto(color: AppColors().textColor, letterSpacing: 1, fontWeight: FontWeight.bold, fontSize: 25),
                  )
                ]),
          ),
          const SizedBox(height: 20),
          ...skills.map((category) {
            final title = category.keys.first;
            final items = category[title]!;
      
            return Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 10,
                    runSpacing: 8,
                    children: items
                        .map(
                          (skill) => Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.circle, color: Colors.white70, size: 18),
                              const SizedBox(width: 10),
                              Flexible(
                                child: Text(
                                  skill,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
