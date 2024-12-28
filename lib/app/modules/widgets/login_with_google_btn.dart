import 'package:flutter/material.dart';
import 'package:mobility/app/assets/assets.gen.dart';
import 'package:mobility/app/repositories/authRepositiry/auth_repository_impl.dart';

import '../../constants/app colors/app_colors.dart';
import '../../constants/typography/typography.dart';
import '../../repositories/authRepositiry/i_auth_repository.dart';

class LoginWithGoogleButton extends StatelessWidget {
  const LoginWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    IAuthRepository iAuthRepository = AuthRepositoryImpl();
    ValueNotifier<bool> loarding = ValueNotifier(false);
    return TextButton(
      onPressed: () async {
        await iAuthRepository.login(loarding: loarding);
      },
      child: Container(
          width: 372,
          height: 60,
          decoration: ShapeDecoration(
            color: AppColor.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: ValueListenableBuilder(
            valueListenable: loarding,
            builder: (_, loardingValue, child) {
              return loardingValue
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(
                            color: AppColor.white,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Assets.googoleIcon.svg(),
                        // SvgPicture.asset(AppString.googleSvg),
                        const SizedBox(
                          width: 20,
                        ),
                        AppTypography().medium16(
                            text: "Se Connecter avec google",
                            color: AppColor.white),
                      ],
                    );
            },
          )),
    );
  }
}
