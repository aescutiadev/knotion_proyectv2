import 'package:get/get.dart';
import 'package:test_project2/ui/getx/detail/detail_binding.dart';
import 'package:test_project2/ui/getx/home/home_binding.dart';
import 'package:test_project2/ui/getx/web_view/web_view_binding.dart';
import 'package:test_project2/ui/pages/detail_page.dart';
import 'package:test_project2/ui/pages/home_page.dart';
import 'package:test_project2/ui/pages/web_view_page.dart';

List<GetPage<dynamic>>? routes() => [
      GetPage(
        name: '/',
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
        binding: WebViewBinding(),
      )
    ];
