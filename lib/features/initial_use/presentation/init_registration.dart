import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/config/palette.dart';
import 'package:p12_basic_widgets/features/initial_use/applicatiopn/init_use_provider.dart';
import 'package:p12_basic_widgets/features/initial_use/applicatiopn/registration_validation.dart';
import 'package:p12_basic_widgets/features/initial_use/data/firebase_auth_repo.dart';
import 'package:p12_basic_widgets/features/initial_use/presentation/init_registration_fail.dart';
import 'package:p12_basic_widgets/features/initial_use/presentation/init_registration_success.dart';
import 'package:provider/provider.dart';

class InitRegistrationScreen extends StatefulWidget {
  const InitRegistrationScreen({super.key});

  @override
  State<InitRegistrationScreen> createState() => _InitRegistrationScreenState();
}

class _InitRegistrationScreenState extends State<InitRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final RegistrationValidation validation = RegistrationValidation();

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
                    "Registration",
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
                        if (result) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const RegistrationSuccessScreen(),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const RegistrationFailScreen(),
                            ),
                          );
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
                      "safe",
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
