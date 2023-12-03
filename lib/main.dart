import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quick Actions Button Flutter Template',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.green, foregroundColor: Colors.white),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const QuickActionScreen(),
    );
  }
}
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

class QuickActionScreen extends StatefulWidget {
  const QuickActionScreen({super.key});

  @override
  State<QuickActionScreen> createState() => _QuickActionScreenState();
}

class _QuickActionScreenState extends State<QuickActionScreen> {
  String shortcut = 'no action set';

  @override
  void initState() {
    super.initState();
    QuickActions quickActions = const QuickActions();
    quickActions.initialize((String shortcutType) {
      setState(() {
        shortcut = shortcutType;
      });
    });

    quickActions.setShortcutItems(<ShortcutItem>[
      // NOTE: This first action icon will only work on iOS.
      // In a real world project keep the same file name for both platforms.
      const ShortcutItem(
        type: 'action_one', //Type of action button
        localizedTitle: 'Geeks For Geeks', //Title to be shown to customer
        icon: 'image1', //Name of Icon that you need to show in quick actions
      ),
      // NOTE: This second action icon will only work on Android.
      // In a real world project keep the same file name for both platforms.
      const ShortcutItem(
          type: 'action_two', //Type of action button
          localizedTitle: 'GFG', //Name of Icon that you need to show in quick
          icon:
              'image2' //Name of Icon that you need to show in quick actions
          ),
    ]).then((void _) {
      //Setstate the shortcut variable to show that shortcut is added successfully
      setState(() {
        if (shortcut == 'no action set') {
          shortcut = 'Actions Ready';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Quick Actions Template"),
      ),
      body: Center(
        child: Text(
          'Current Action Type: $shortcut',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
