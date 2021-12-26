import 'package:flutter/material.dart';
import 'package:vncovi/repository/user_declaration_repo.dart';

class DeclarationTest extends StatefulWidget {
  const DeclarationTest({Key? key}) : super(key: key);

  @override
  State<DeclarationTest> createState() => _DeclarationTestState();
}

class _DeclarationTestState extends State<DeclarationTest> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController cccdController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  int currentStep = 0;
  bool isComplete = false;

  String validateText(String? formText) {
    if (formText!.isEmpty) return 'Bắt buộc.';
    return '';
  }

  String validateEmail(String? formEmail) {
    if (formEmail!.isEmpty) return 'Email không để trống.';

    String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formEmail)) return 'Email không hợp lệ.';
    return '';
  }

  String validatePassword(String? formPassword) {
    if (formPassword!.isEmpty) return 'Chưa nhập mật khẩu.';
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formPassword))
      return '''
    Mật khẩu phải ít nhất 8 kí tự,
    bao gồm kí tự in hoa, số và kí tự đặc biệt.
    ''';
    return '';
  }

  List<Step> getSteps() => [
        Step(
            title: const Text('Thong tin chung'),
            content: Form(
              key: _key,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Họ tên',
                    ),
                    // validator: validateText,
                    controller: nameController,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Giới tính',
                    ),
                    controller: genderController,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Ngày sinh',
                    ),
                    controller: dobController,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'CCCD',
                    ),
                    controller: cccdController,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Số điện thoại',
                    ),
                    controller: phoneController,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    controller: emailController,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Địa chỉ',
                    ),
                    controller: addressController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            isActive: currentStep >= 0,
            state: currentStep > 0 ? StepState.complete : StepState.indexed),
        Step(
            title: const Text('Thong tin them'),
            content: Container(
              color: Colors.green,
            ),
            isActive: currentStep >= 1,
            state: currentStep > 1 ? StepState.complete : StepState.indexed),
      ];

  @override
  Widget build(BuildContext context) {
    final isLastStep = currentStep == getSteps().length - 1;
    return isComplete
        ? Container(
            child: ElevatedButton(
              onPressed: () async {

                // isComplete = false;
                // currentStep = 0;
              },
              child: Text('Reset'),
            ),
          )
        : Stepper(
            steps: getSteps(),
            type: StepperType.vertical,
            currentStep: currentStep,
            onStepContinue: () async{
              if (isLastStep) {
                if (_key.currentState!.validate()){

                }
                // setState(() {
                //   isComplete = true;
                // });
                String name = nameController.text;
                String gender = genderController.text;
                String dob = dobController.text;
                String cccd = cccdController.text;
                String phone = phoneController.text;
                String email = emailController.text;
                String address = addressController.text;
                await UserDeclarationPost().postData(name,gender,dob,cccd,phone,email,address).then((value) => print(value));
                //send data to server
              } else {
                setState(() {
                  currentStep += 1;
                });
              }
            },
            onStepCancel: () {
              currentStep == 0
                  ? null
                  : setState(() {
                      currentStep -= 1;
                    });
            },
            onStepTapped: (step) => setState(
              () {
                currentStep = step;
              },
            ),
            controlsBuilder: (context, details) {
              return SizedBox(
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: Text(isLastStep ? 'Xác nhận' : 'Tiếp'),
                        onPressed: details.onStepContinue,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    if (currentStep != 0)
                      Expanded(
                        child: ElevatedButton(
                          child: Text('Quay lại'),
                          onPressed: details.onStepCancel,
                        ),
                      ),
                  ],
                ),
              );
            },
          );
  }
}
