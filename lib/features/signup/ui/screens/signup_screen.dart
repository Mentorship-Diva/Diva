import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mentorship/core/theming/assets.dart';
import 'package:mentorship/features/signup/data/repos/signup_repo.dart';
import 'package:mentorship/features/signup/logic/cubits/signup_cubit.dart';
import 'package:mentorship/features/signup/ui/widgets/signup_form.dart';
import '../../../../core/theming/colors.dart';
import '../widgets/already_have_an_account.dart';
import '../widgets/auth_title_and_image.dart';
import '../widgets/or.dart';
import '../widgets/signup_button.dart';
import '../widgets/social_accounts.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignupRepo signupRepo = SignupRepo();
    return BlocProvider(
      create: (context) => SignupCubit(signupRepo),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
            child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      const AuthTitleAndImage(
                        title: 'Sign Up',
                        image: AppAssets.signupIll,
                      ),
                      const SignupForm(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 24.h),
                        child: const SignupButton(),
                      ),
                      const Or(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 24.h),
                        child: SocialAccounts(
                          onGoogleTapped: () async {

                            User? user = await signUpWithGoogle();
                            if (user != null) {
                              debugPrint('Signed in with Google: ${user.displayName}');
                            } else {
                              debugPrint('Google sign-in failed');
                            }
                          },
                          onFacebookTapped: () {},
                          onAppleTapped: () {},
                        ),
                      ),
                      const AlreadyHaveAnAccount(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }

  Future<User?> signUpWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      return userCredential.user;
    }

    return null;
  }
}
