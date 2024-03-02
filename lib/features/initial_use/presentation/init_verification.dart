import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/config/palette.dart';
import 'package:p12_basic_widgets/features/initial_use/applicatiopn/init_use_provider.dart';
import 'package:p12_basic_widgets/features/initial_use/applicatiopn/registration_validation.dart';
import 'package:p12_basic_widgets/features/initial_use/data/firebase_auth_repo.dart';
import 'package:provider/provider.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final RegistrationValidation validation = RegistrationValidation();
  // bool isBtnEnabled = false;
  // bool isEmailFilled = false;
  // bool isPasswordFilled = false;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final initUseProvider = Provider.of<InitialUseProvider>(context);
    final firebaseAuthRepo =
        FirebaseAuthRepository(authInstance: FirebaseAuth.instance);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        child: Center(
          child: Form(
            key: _formKey,
            //     _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                const FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Text(
                    "Verify your Account",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const Spacer(),
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: TextFormField(
                      controller: emailController,
                      // initialValue: "raphael.birkl@gmail.com",
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                      validator: validation.emailErrorText,
                      onChanged: (value) => setState(() {
                            initUseProvider.fillEmailField();
                          })),
                ),
                const SizedBox(height: 30),
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: TextFormField(
                      controller: passwordController,
                      // initialValue: "123456",
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                      validator: validation.passwordErrorText,
                      onChanged: (value) => setState(() {
                            initUseProvider.fillPasswordField();
                          })),
                ),
                const Spacer(),
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: ElevatedButton(
                    onPressed: () async {
                      initUseProvider.isRegisterBtnEnabled;
                      if (_formKey.currentState?.validate() ?? false) {
                        final email = emailController.text;
                        final password = passwordController.text;
                        //    context.read<FirebaseAuthRepository>().firebaseAuthRepo

                        final result =
                            await firebaseAuthRepo.verifyUser(email, password);
                        // await Future.delayed(const Duration(seconds: 2));
                        if (result) {
                          Navigator.of(context)
                              .pushReplacementNamed("/verification_success");
                        } else {
                          Navigator.of(context)
                              .pushReplacementNamed("/verification_fail");
                        }
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (initUseProvider.isRegisterBtnEnabled) {
                          return dutyBlue;
                        }
                        return dutyDisabledGrey;
                      }),
                    ),
                    child: const Text(
                      "verify",
                      style: TextStyle(color: dutyWhite),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
