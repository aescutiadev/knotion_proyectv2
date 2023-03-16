import 'package:get/get.dart';
import 'package:test_project2/ui/getx/detail/detail_binding.dart';
import 'package:test_project2/ui/getx/home/home_binding.dart';
import 'package:test_project2/ui/getx/login/login_binding.dart';
import 'package:test_project2/ui/getx/login_register/login_register_binding.dart';
import 'package:test_project2/ui/getx/url_launcher/url_launcher_binding.dart';
import 'package:test_project2/ui/getx/web_view/web_view_binding.dart';
import 'package:test_project2/ui/pages/clima_page.dart';
import 'package:test_project2/ui/pages/detail_page.dart';
import 'package:test_project2/ui/pages/home_page.dart';
import 'package:test_project2/ui/pages/login_page.dart';
import 'package:test_project2/ui/pages/login_register.dart';
import 'package:test_project2/ui/pages/menu_page.dart';
import 'package:test_project2/ui/pages/url_launcher_page.dart';
import 'package:test_project2/ui/pages/web_view_page.dart';

List<GetPage<dynamic>>? routes() => [
      GetPage(
        name: '/',
        page: () => const LoginPage(),
        binding: LoginBindings(),
      ),
      GetPage(
        name: '/register',
        page: () => const LoginRegister(),
        binding: LoginRegisterBinding(),
      ),
      GetPage(
        name: '/menu',
        page: () => const MenuPage(),
      ),
      GetPage(
        name: '/clima',
        page: () => const ClimaPage(),
      ),
      GetPage(
        name: '/urllancher',
        page: () => const UrlLauncherPage(),
        binding: UrlLauncherBinding(),
      ),
      GetPage(
        name: '/home',
        page: () => const HomePage(),
        binding: HomeBindings(),
      ),
      GetPage(
        name: '/detail',
        page: () => const DetailPage(),
        binding: DetailBinding(),
      ),
      GetPage(
        name: '/detail/serie',
        page: () => const WebViewPage(),
        binding: WebBinding(),
      )
    ];
