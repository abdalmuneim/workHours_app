import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:workhours/common/resources/app_color.dart';
import 'package:workhours/common/utils/extension.dart';
import 'package:workhours/common/widgets/custom_text.dart';
import 'package:workhours/features/auth/presentations/providers/sign_in_provider.dart';
import 'package:workhours/features/auth/presentations/providers/verify_email_provider.dart';
import 'package:workhours/generated/assets/assets.dart';
import 'package:workhours/generated/l10n.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  late VerifyEmailProvider read = context.read<VerifyEmailProvider>();

  @override
  void initState() {
    read.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size(100.w, 3.h), child: AppBar()),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Assets.assetsImagesLogo,
              width: 50.w,
              height: 10.w,
            ),
            2.h.sh,
            Image.asset(
              Assets.assetsImagesMailbox,
              width: 100.w,
            ),
            5.h.sh,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CustomText(
                  text: S.of(context).checkUEmail,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                3.h.sh,
                CustomText(
                  text: S.of(context).weSendEmailForVerifyUEmail(
                          "${Provider.of<SignInProvider>(
                        context,
                        listen: false,
                      ).emailTEXT.text}"),
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                S.of(context).resentLink,
                style: TextStyle(
                    color: AppColors.black,
                    decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
