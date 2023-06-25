import 'package:flutter/material.dart';
import 'package:stage_1/config/routes/routes.dart';
import 'package:stage_1/core/auth/screens/sign_in_screen.dart';
import 'package:stage_1/core/auth/screens/sign_up_screen.dart';
import 'package:stage_1/core/onboarding.dart';
import 'package:stage_1/models/placeholder.dart' as md;
import 'package:stage_1/models/farm.dart';
import 'package:stage_1/modules/agricultural_list/agricultural_listview_screen.dart';
import 'package:stage_1/modules/common_widget/components_screen.dart';
import 'package:stage_1/modules/common_widget/screens_list.dart';
import 'package:stage_1/modules/cultivation/create_cultivation_detail.dart';
import 'package:stage_1/modules/cultivation/create_cultivation_diseases_screen.dart';
import 'package:stage_1/modules/cultivation/create_cultivation_fertilizers_screen.dart';
import 'package:stage_1/modules/cultivation/create_cultivation_pesticide_screen.dart';
import 'package:stage_1/modules/cultivation/cultivation_detail_screen.dart';
import 'package:stage_1/modules/farm_management/screens/farm_support_screen.dart';
import 'package:stage_1/modules/harvest_management/screens/harvest_management_screen.dart';
import 'package:stage_1/modules/farm_management/create/create_farm_screen.dart';
import 'package:stage_1/modules/farm_management/details/farm_details_screen.dart';
import 'package:stage_1/modules/farm_management/management/farm_management_screen.dart';
import 'package:stage_1/modules/farm_management/update/update_farm_screen.dart';
import 'package:stage_1/modules/harvest_statistic/harvest_statistic_screen.dart';
import 'package:stage_1/modules/home/home_screen.dart';
import 'package:stage_1/modules/product_management/update/update_product_screen.dart';
import 'package:stage_1/modules/profile/profile_screen.dart';
import 'package:stage_1/modules/profile/show_profile_screen.dart';
import 'package:stage_1/modules/root/root_screen.dart';
import 'package:stage_1/modules/product_management/screens/create_aquatic_product_screen.dart';
import 'package:stage_1/modules/product_management/screens/create_farm_product_screen.dart';
import 'package:stage_1/modules/product_management/screens/create_forestry_product_screen.dart';
import 'package:stage_1/modules/product_management/screens/product_details_screen.dart';
import 'package:stage_1/modules/setting/setting_screen.dart';
import 'package:stage_1/modules/suggest/suggest_result_screen.dart';
import 'package:stage_1/modules/techdetail/techdetail_cultivation_screen.dart';

import '../../modules/suggest/advise_screen.dart';

class Router {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    settings.arguments;
    switch (settings.name) {
      case Routes.rootScreen:
        {
          return MaterialPageRoute(builder: (_) => const RootScreen());
        }
      case Routes.componentsScreen:
        {
          return MaterialPageRoute(builder: (_) => const ComponentsScreen());
        }
      case Routes.screensList:
        {
          return MaterialPageRoute(builder: (_) => const ScreensList());
        }
      case Routes.signInScreen:
        {
          return MaterialPageRoute(builder: (_) => const SignInScreen());
        }
      case Routes.signUpScreen:
        {
          return MaterialPageRoute(builder: (_) => const SignUpScreen());
        }
      case Routes.homeScreen:
        {
          return MaterialPageRoute(builder: (_) => const HomeScreen());
        }
      case Routes.profileScreen:
        {
          return MaterialPageRoute(builder: (_) => const ProfileScreen());
        }
      case Routes.showProfileScreen:
        {
          return MaterialPageRoute(builder: (_) => const ShowProfileScreen());
        }
      case Routes.settingsScreen:
        {
          return MaterialPageRoute(builder: (_) => const SettingScreen());
        }
      case Routes.harvestingScreen:
        {
          return MaterialPageRoute(
              builder: (_) => const HarvestStatisticScreen());
        }
      case Routes.onboardingScreen:
        {
          return MaterialPageRoute(builder: (_) => const OnboardingScreen());
        }
      case Routes.farmDetailsScreen:
        {
          return MaterialPageRoute(
              builder: (_) =>
                  FarmDetailsScreen(farm: settings.arguments! as Farm));
        }
      case Routes.updateFarmScreen:
        {
          return MaterialPageRoute(
              builder: (_) => UpdateFarmScreen(
                    farm: settings.arguments as Farm,
                  ));
        }
      case Routes.createFarmScreen:
        {
          return MaterialPageRoute(builder: (_) => const CreateFarmScreen());
        }
      case Routes.createFarmProductScreen:
        {
          return MaterialPageRoute(
              builder: (_) =>
                  CreateFarmProductScreen(farm: settings.arguments! as Farm));
        }
      case Routes.createAquaticProductScreen:
        {
          return MaterialPageRoute(
              builder: (_) => const CreateAquaticProductScreen());
        }
      case Routes.createForestryProductScreen:
        {
          return MaterialPageRoute(
              builder: (_) => const CreateForestryProductScreen());
        }
      case Routes.productDetailsScreen:
        {
          return MaterialPageRoute(
              builder: (_) => ProductDetailsScreen(
                  placeholder: settings.arguments! as md.Placeholder));
        }
      case Routes.farmManagementScreen:
        {
          return MaterialPageRoute(
              builder: (_) => const FarmManagementScreen());
        }
      case Routes.agriculturalListScreen:
        {
          return MaterialPageRoute(
              builder: (_) => const AgriculturalListView());
        }
      case Routes.farmSupportScreen:
        {
          return MaterialPageRoute(builder: (_) => const FarmSupportScreen());
        }
      case Routes.createCultivationDetailsScreen:
        {
          return MaterialPageRoute(
              builder: (_) => const CreateCultivationDetails());
        }
      case Routes.createCultivationFertilizerScreen:
        {
          return MaterialPageRoute(
              builder: (_) => const CreateCultivationFertilizerScreen());
        }
      case Routes.createCultivationPesticideScreen:
        {
          return MaterialPageRoute(
              builder: (_) => const CreateCultivationPesticideScreen());
        }
      case Routes.createCultivationDiseaseScreen:
        {
          return MaterialPageRoute(
              builder: (_) => const CreateCultivationDiseasesScreen());
        }
      case Routes.harvestManagementScreen:
        {
          return MaterialPageRoute(
              builder: (_) => const HarvestManagementScreen());
        }
      case Routes.cultivationDetailsScreen:
        {
          return MaterialPageRoute(
              builder: (_) => const CultivationDetailsScreen());
        }
      case Routes.updateFarmProductScreen:
        {
          return MaterialPageRoute(
              builder: (_) => UpdateFarmProductScreen(
                  placeholder: settings.arguments! as md.Placeholder));
        }
      case Routes.adviseScreen:
        {
          return MaterialPageRoute(builder: (_) => const AdviseScreen());
        }
      case Routes.suggestResultScreen:
        {
          return MaterialPageRoute(builder: (_) => const SuggestResultScreen());
        }
      case Routes.techDetailCultivationScreen:
        {
          return MaterialPageRoute(
              builder: (_) => TechDetailCultivationScreen(
                  productName: settings.arguments! as String));
        }
      default:
        {
          return MaterialPageRoute(
              builder: (_) => Scaffold(
                    body: Center(
                        child: Text('No route defined for ${settings.name}')),
                  ));
        }
    }
  }
}
