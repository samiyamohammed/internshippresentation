// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_marketplace/models/chat_listing_model.dart';
import 'package:real_estate_marketplace/pages/add%20property/add_property_page_10.dart';
import 'package:real_estate_marketplace/pages/add%20property/add_property_page_11.dart';
import 'package:real_estate_marketplace/pages/add%20property/add_property_page_8.dart';
import 'package:real_estate_marketplace/pages/aboutus_page.dart';
import 'package:real_estate_marketplace/pages/add%20property/add_property_page_1.dart';
import 'package:real_estate_marketplace/pages/add%20property/add_property_page_2_commercial.dart';
import 'package:real_estate_marketplace/pages/add%20property/add_property_page_2_lease.dart';
import 'package:real_estate_marketplace/pages/add%20property/add_property_page_2_residential.dart';
import 'package:real_estate_marketplace/pages/add%20property/add_property_page_3.dart';
import 'package:real_estate_marketplace/pages/add%20property/add_property_page_4.dart';
import 'package:real_estate_marketplace/pages/add%20property/add_property_page_5.dart';
import 'package:real_estate_marketplace/pages/add%20property/add_property_page_6.dart';
import 'package:real_estate_marketplace/pages/add%20property/add_property_page_7.dart';
import 'package:real_estate_marketplace/pages/add%20property/add_property_page_9.dart';
import 'package:real_estate_marketplace/pages/chat_listing_page.dart';
import 'package:real_estate_marketplace/pages/chat_page.dart';
import 'package:real_estate_marketplace/pages/draft_properties_page.dart';
import 'package:real_estate_marketplace/pages/faq_page.dart';
import 'package:real_estate_marketplace/pages/Home%20page/featured_properties.dart';
import 'package:real_estate_marketplace/pages/Home%20page/for_investment_properties.dart';
import 'package:real_estate_marketplace/pages/Home%20page/for_rent_properties.dart';
import 'package:real_estate_marketplace/pages/Home%20page/for_sale_properties.dart';
import 'package:real_estate_marketplace/pages/Home%20page/home_page.dart';
import 'package:real_estate_marketplace/pages/posted_properties_page.dart';
import 'package:real_estate_marketplace/pages/profile_pages.dart';
import 'package:real_estate_marketplace/pages/search_filter_page.dart';
import 'package:real_estate_marketplace/pages/settings_page.dart';
import 'package:real_estate_marketplace/pages/side_bar_menu.dart';
import 'package:real_estate_marketplace/pages/splashpage.dart';
import 'package:real_estate_marketplace/pages/unsighned_notification_page.dart';
import 'package:real_estate_marketplace/pages/unsignedin_favorites_page.dart';
import 'package:real_estate_marketplace/pages/unsighned_message_page.dart';
import 'package:real_estate_marketplace/pages/agent_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchAndFilterPage(),
    ),
    GoRoute(
      path: '/faq',
      builder: (context, state) => const FaqPage(),
    ),
    GoRoute(
      path: '/aboutus',
      builder: (context, state) => const AboutUsPage(),
    ),
    GoRoute(
      path: '/notifications',
      builder: (context, state) => const NotificationPage(),
    ),
    GoRoute(
      path: '/chat',
      builder: (context, state) => const ChatListPage(),
    ),
    GoRoute(
      path: '/favorite',
      builder: (context, state) => const FavoritePage(),
    ),
    GoRoute(
      path: '/posted-properties',
      builder: (context, state) => const PostedPropertiesPage(),
    ),
    GoRoute(
      path: '/searchandfilter',
      builder: (context, state) => const SearchAndFilterPage(),
    ),
    GoRoute(
      path: '/draft-properties',
      builder: (context, state) => const DraftPropertiesPage(),
    ),
    GoRoute(
      path: '/sidebar',
      builder: (context, state) => const CustomDrawer(),
    ),
    GoRoute(
      path: '/featuredProperties',
      builder: (context, state) => const FeaturedPropertiesPage(),
    ),
    GoRoute(
      path: '/rentProperties',
      builder: (context, state) => const ForRentPropertiesPage(),
    ),
    GoRoute(
      path: '/saleProperties',
      builder: (context, state) => const ForSalePropertiesPage(),
    ),
    GoRoute(
      path: '/investmentProperties',
      builder: (context, state) => const ForInvestmentPropertiesPage(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => ProfilePage(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => SettingsScreen(),
    ),
    GoRoute(
      path: '/addproperty',
      builder: (context, state) => const AddPropertyPage(),
    ),
    GoRoute(
      path: '/addpropertyres',
      builder: (context, state) => const AddPropertyPageres(),
    ),
    GoRoute(
      path: '/addpropertycom',
      builder: (context, state) => const AddPropertyPagecom(),
    ),
    GoRoute(
      path: '/addpropertylease',
      builder: (context, state) => const AddPropertyPagelease(),
    ),
    GoRoute(
      path: '/addproperty3',
      builder: (context, state) => AddPropertyPage3(),
    ),
    GoRoute(
      path: '/addproperty4',
      builder: (context, state) => AddPropertyPage4(),
    ),
    GoRoute(
      path: '/addproperty5',
      builder: (context, state) => AddPropertyPage5(),
    ),
    GoRoute(
      path: '/addproperty6',
      builder: (context, state) => AddPropertyPage6(),
    ),
    GoRoute(
      path: '/addproperty7',
      builder: (context, state) => AddPropertyPage7(),
    ),
    GoRoute(
      path: '/addproperty8',
      builder: (context, state) => AddPropertyPage8(),
    ),

    GoRoute(
      path: '/addproperty9',
      builder: (context, state) => AddPropertyPage9(),
    ),

    GoRoute(
      path: '/addproperty10',
      builder: (context, state) => const AddPropertyPage10(),
    ),

    GoRoute(
      path: '/addproperty11',
      builder: (context, state) => const AddPropertyPage11(),
    ),
    //AddPropertyPage4
  ],
);
