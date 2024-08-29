import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/core/const/assets_paths_const.dart';
import 'package:movies_app/core/enums/sizes_enum.dart';
import 'package:movies_app/core/extensions/ui/sizes_extension.dart';
import 'package:movies_app/core/mixins/loading_error_mixin.dart';
import 'package:movies_app/core/mixins/navigation_mixin.dart';
import 'package:movies_app/core/mixins/snack_bar_mixin.dart';
import 'package:movies_app/core/validators/email_validator.dart';
import 'package:movies_app/core/validators/password_validator.dart';
import 'package:movies_app/core/widgets/buttons/button_widget.dart';
import 'package:movies_app/core/widgets/inputs/text_form_field_widget.dart';
import 'package:movies_app/core/widgets/sized_box/sized_box_widget.dart';
import 'package:movies_app/core/widgets/texts/text_widget.dart';
import 'package:movies_app/presentation/login/screens/mixins/login_focus_nodes_mixin.dart';
import 'package:movies_app/presentation/login/screens/mixins/login_text_editing_controllers.dart';
import 'package:movies_app/presentation/nav/screens/nav_screen.dart';
import 'package:movies_app/presentation/signup/screens/signup_sreen.dart';

import '../controllers/login_controller.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with
        LoginFocusNodesMixin,
        LoginTextEditingControllers,
        NavigationMixin,
        LoadingErrorMixin,
        SnackBarMixin {
  late LoginController loginCtrl;

  @override
  void initState() {
    loginCtrl = LoginController();
    setIsLoading(false);

    super.initState();
  }

  void onLogin() async {
    setIsLoading(true);

    final error = await loginCtrl.onLogin(emailTEC.text, passwordTEC.text);

    if (error != null && context.mounted) {
      setIsLoading(false);
      showSnackBBar(context, error, MessageType.error);
    } else {
      handleNavigation(context, NavScreen.routeName, clear: true);
    }
  }

  @override
  void dispose() {
    disposeLogginTECs();
    disposeFN();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: loginCtrl.loginFormKey,
        child: Padding(
          padding: EdgeInsets.all(SizesEnum.lg.getSize),
          child: SizedBox.expand(
            child: Column(
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Lottie.asset(AssetsPathsConst.animationLogin),
                ),
                const SizedBoxWidget.md(),
                TextWidget.title('Firebase Movies App'),
                const SizedBoxWidget.md(),
                TextFormFieldWidget(
                  inputLabel: 'Email',
                  controller: emailTEC,
                  focusNode: emailFN,
                  validator: EmailValidator.validate,
                  textInputType: TextInputType.emailAddress,
                  onFieldSubmited: (_) => passwordFN.requestFocus,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBoxWidget.md(),
                TextFormFieldWidget(
                  inputLabel: 'Senha',
                  controller: passwordTEC,
                  focusNode: passwordFN,
                  isPassword: true,
                  validator: PasswordValidator.validate,
                  onFieldSubmited: (_) => onLogin,
                  textInputAction: TextInputAction.go,
                ),
                const SizedBoxWidget.xxl(),
                ButtonWidget(
                  label: 'Login',
                  onPressed: onLogin,
                  isBlock: true,
                  isLoading: isLoading,
                ),
                const SizedBoxWidget.lg(),
                RichText(
                  textAlign: TextAlign.center,
                  text:
                      TextSpan(style: const TextStyle(fontSize: 16), children: [
                    const TextSpan(text: 'Ainda não possui uma conta? '),
                    TextSpan(
                      text: 'Registre aqui!',
                      style:
                          const TextStyle(decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () =>
                            handleNavigation(context, SignupSreen.routeName),
                    )
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
