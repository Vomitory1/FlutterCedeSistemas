part of app.auth;

class ForgotPasswordView extends StatefulWidget {
  static String route = '${ForgotPasswordView.route}/signup';

  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<SignUpView> {
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
          'Register',
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
              Text(
                'Register Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionsScreenHeigth(28),
                ),
              ),
              Text(
                'Complete your details or continue\nwith social media',
                textAlign: TextAlign.center,
              ),
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
                label: 'Sing In',
                onPress: () {
                  authBLoC.add(RecoveryPassword(email: emailController.text));
                },
              ),
              SizedBox(
                height: getProportionsScreenHeigth(24),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SocialButton(
                    icon: 'assets/icons/google.svg',
                    onPress: () {
                      print('google');
                    },
                  ),
                  SocialButton(
                    icon: 'assets/icons/facebook.svg',
                    onPress: () {
                      print('facebook');
                    },
                  ),
                  SocialButton(
                    icon: 'assets/icons/twitter.svg',
                    onPress: () {
                      print('twitter');
                    },
                  ),
                ],
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
