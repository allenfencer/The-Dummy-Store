import 'package:flutter/material.dart';

import '../../constants/app_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      bottom: true,
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(
                height: 15,
              ),
              Text(
                'Settings',
                style: AppTheme.f30wbold,
              )
            ],
          ),
        ),
      ),
    );
  }
}
