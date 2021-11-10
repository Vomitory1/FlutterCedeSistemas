part of app.auth;

class ForgotPasswordView extends StatefulWidget {
  static String route = '${AuthView.route}/forgotpassword';

  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final NavigatorService navigator = locator<NavigatorService>();
  TextEditingController emailController = TextEditingController();

  String? emailError;

  void onValidateEmail(String email) {
    RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    bool isValid = regex.hasMatch(email.trim());
    setState(() {
      isValid ? emailError = null : emailError = 'invalid email';
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    AuthBLoC authBLoC = BlocProvider.of<AuthBLoC>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forgot Password',
          style: TextStyle(
              fontSize: getProportionsScreenHeigth(14), color: secondaryColor),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        // Bloquear el scroll superior
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                height: SizeConfig.screenHeight! * 0.05,
              ),
              Input(
                label: 'email',
                icon: Icons.email_outlined,
                controller: emailController,
                placeholder: 'add your email',
                onChange: onValidateEmail,
                error: emailError,
              ),
              SizedBox(
                height: getProportionsScreenHeigth(24),
              ),
              SizedBox(
                height: getProportionsScreenHeigth(24),
              ),
              SizedBox(
                height: getProportionsScreenHeigth(24),
              ),
              Button(
                label: 'Recovery Password',
                onPress: () {
                  authBLoC.add(RecoveryPassword(email: emailController.text));
                },
              ),
              SizedBox(
                height: getProportionsScreenHeigth(24),
              ),
              SizedBox(
                height: getProportionsScreenHeigth(24),
              ),
              Text(
                'By continuing your confirm that you agree \nwith our Term and Condition',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
