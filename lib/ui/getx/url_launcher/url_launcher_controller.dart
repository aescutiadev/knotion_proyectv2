import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project2/common/errors/failure.dart';
import 'package:test_project2/src/url_launcher/aplication/get_all_urls_usecase.dart';
import 'package:test_project2/src/url_launcher/aplication/save_url_usecase.dart';
import 'package:test_project2/src/url_launcher/domain/url_class.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherController extends GetxController with StateMixin {
  UrlLauncherController({
    required this.registerUseCase,
    required this.getAllUrlsUseCase,
  });
  final UrlSaveUseCase registerUseCase;
  final GetAllUrlsUseCase getAllUrlsUseCase;

  final urls = <Url>[].obs;

  final textFieldUrl = ''.obs;

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.loading());
    await _getAllUrls();
  }

  void validateForm() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    await _saveUrl();
    await _getAllUrls();
  }

  Future<void> _saveUrl() async {
    change(null, status: RxStatus.empty());
    final url = Url(
      url: textFieldUrl.value,
    );
    final result = await registerUseCase(url);

    result.fold((Failure l) {
      change(null, status: RxStatus.error());
    }, (Url r) {
      formKey.currentState!.reset();
      change(null, status: RxStatus.success());
    });
  }

  Future<void> _getAllUrls() async {
    change(null, status: RxStatus.empty());

    final result = await getAllUrlsUseCase();

    result.fold((Failure l) {
      print(l.message);
      change(null, status: RxStatus.error());
    }, (List<Url> r) {
      urls.value = r;
      print(urls);
      change(null, status: RxStatus.success());
    });
  }

  Future<void> launch({required String url}) async {
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      throw Exception('Could not launch $url');
    }
  }
}
