import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project2/ui/getx/url_launcher/url_launcher_controller.dart';

class UrlLauncherPage extends GetWidget<UrlLauncherController> {
  const UrlLauncherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Url Launcher'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: size.width,
            height: size.height,
            color: Theme.of(context).cardColor,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (!value!.isURL || value.isEmpty) {
                          return 'Url no valida';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        controller.textFieldUrl.value = newValue!;
                      },
                      decoration: const InputDecoration(hintText: 'Url'),
                    ),
                    const SizedBox(height: 10),
                    OutlinedButton(
                      onPressed: () {
                        controller.validateForm();
                      },
                      child: const Text('Guardar'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            child: controller.obx(
              (state) => Container(
                margin: const EdgeInsets.only(top: 150),
                child: ListView.builder(
                  itemCount: controller.urls.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        controller.launch(url: controller.urls[index].url);
                      },
                      title: Text(controller.urls[index].url),
                      leading: Text('${index + 1}'),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
