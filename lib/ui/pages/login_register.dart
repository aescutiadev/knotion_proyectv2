import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project2/ui/getx/login_register/login_register_controller.dart';

class LoginRegister extends GetWidget<RegisterUserController> {
  const LoginRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller.textFieldName,
                decoration: const InputDecoration(
                  hintText: 'Nombre',
                ),
              ),
              TextField(
                controller: controller.textFieldEmail,
                decoration: const InputDecoration(
                  hintText: 'Correo',
                ),
              ),
              TextField(
                controller: controller.textFieldPass,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Contraseña',
                ),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                  onPressed: () {
                    controller.registerUser();
                  },
                  child: const Text('Registrar'))
            ],
          ),
        ),
      ),
    );
  }
}
