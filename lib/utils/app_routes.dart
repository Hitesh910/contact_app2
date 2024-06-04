
import 'package:contact_app/screen/contact/view/contact_screen.dart';
import 'package:contact_app/screen/home/view/home_screen.dart';
import 'package:flutter/material.dart';

Map<String,WidgetBuilder> app_routes = {
  "/":(context) => const HomeScreen(),
  "contact":(context) => const ContactScreen(),
};