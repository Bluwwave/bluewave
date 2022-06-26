import 'package:bluewave/presentation/profile_changing_page_screen/profile_changing_page_screen.dart';
import 'package:bluewave/presentation/profile_changing_page_screen/binding/profile_changing_page_binding.dart';
import 'package:bluewave/presentation/mandatory_info_page_screen/mandatory_info_page_screen.dart';
import 'package:bluewave/presentation/mandatory_info_page_screen/binding/mandatory_info_page_binding.dart';
import 'package:bluewave/presentation/login_page_screen/login_page_screen.dart';
import 'package:bluewave/presentation/login_page_screen/binding/login_page_binding.dart';
import 'package:bluewave/presentation/main_matches_page_screen/main_matches_page_screen.dart';
import 'package:bluewave/presentation/main_matches_page_screen/binding/main_matches_page_binding.dart';
import 'package:bluewave/presentation/match_profile_page_screen/match_profile_page_screen.dart';
import 'package:bluewave/presentation/match_profile_page_screen/binding/match_profile_page_binding.dart';
import 'package:bluewave/presentation/chat_with_match_screen/chat_with_match_screen.dart';
import 'package:bluewave/presentation/chat_with_match_screen/binding/chat_with_match_binding.dart';
import 'package:bluewave/presentation/all_chats_screen/all_chats_screen.dart';
import 'package:bluewave/presentation/all_chats_screen/binding/all_chats_binding.dart';
import 'package:bluewave/presentation/personal_profile_screen/personal_profile_screen.dart';
import 'package:bluewave/presentation/personal_profile_screen/binding/personal_profile_binding.dart';
import 'package:bluewave/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:bluewave/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String profileChangingPageScreen = '/profile_changing_page_screen';

  static String mandatoryInfoPageScreen = '/mandatory_info_page_screen';

  static String loginPageScreen = '/login_page_screen';

  static String mainMatchesPageScreen = '/main_matches_page_screen';

  static String matchProfilePageScreen = '/match_profile_page_screen';

  static String chatWithMatchScreen = '/chat_with_match_screen';

  static String allChatsScreen = '/all_chats_screen';

  static String personalProfileScreen = '/personal_profile_screen';

  static String appNavigationScreen = '/app_navigation_screen';

  static String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: profileChangingPageScreen,
      page: () => ProfileChangingPageScreen(),
      bindings: [
        ProfileChangingPageBinding(),
      ],
    ),
    GetPage(
      name: mandatoryInfoPageScreen,
      page: () => MandatoryInfoPageScreen(),
      bindings: [
        MandatoryInfoPageBinding(),
      ],
    ),
    GetPage(
      name: loginPageScreen,
      page: () => LoginPageScreen(),
      bindings: [
        LoginPageBinding(),
      ],
    ),
    GetPage(
      name: mainMatchesPageScreen,
      page: () => MainMatchesPageScreen(),
      bindings: [
        MainMatchesPageBinding(),
      ],
    ),
    GetPage(
      name: matchProfilePageScreen,
      page: () => MatchProfilePageScreen(),
      bindings: [
        MatchProfilePageBinding(),
      ],
    ),
    GetPage(
      name: chatWithMatchScreen,
      page: () => ChatWithMatchScreen(),
      bindings: [
        ChatWithMatchBinding(),
      ],
    ),
    GetPage(
      name: allChatsScreen,
      page: () => AllChatsScreen(),
      bindings: [
        AllChatsBinding(),
      ],
    ),
    GetPage(
      name: personalProfileScreen,
      page: () => PersonalProfileScreen(),
      bindings: [
        PersonalProfileBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => LoginPageScreen(),
      bindings: [
        LoginPageBinding(),
      ],
    )
  ];
}
