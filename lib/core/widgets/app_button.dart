import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roqqu/core/widgets/app_textstyle.dart';
import 'package:roqqu/resources/colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    this.onPressed,
    this.onDisabledPressed,
    this.icon,
    this.loading = false,
    this.enabled = true,
    this.enabledColor = AppColors.primaryColor,
    this.disabledColor = AppColors.lightGreen,
    this.textColor = AppColors.white,
    this.disabledTextColor = AppColors.white,
    this.borderColor = AppColors.white,
  });

  final VoidCallback? onPressed;
  final VoidCallback? onDisabledPressed;
  final String title;
  final Widget? icon;
  final bool loading;
  final bool enabled;
  final Color enabledColor;
  final Color disabledColor;
  final Color textColor;
  final Color disabledTextColor;
  final Color borderColor;

  factory AppButton.buy({
    required String title,
    VoidCallback? onPressed,
    VoidCallback? onDisabledPressed,
    bool loading = false,
    bool enabled = true,
    Widget? icon,
  }) =>
      AppButton(
        title: title,
        onPressed: onPressed,
        onDisabledPressed: onDisabledPressed,
        loading: loading,
        enabled: enabled,
        enabledColor: AppColors.lightGreen,
        disabledColor: AppColors.lightGreen,
        textColor: AppColors.white,
        icon: icon,
      );

  factory AppButton.sell({
    required String title,
    VoidCallback? onPressed,
    VoidCallback? onDisabledPressed,
    bool loading = false,
    bool enabled = true,
    Widget? icon,
  }) =>
      AppButton(
        title: title,
        onPressed: onPressed,
        onDisabledPressed: onDisabledPressed,
        loading: loading,
        enabled: enabled,
        enabledColor: AppColors.sell,
        borderColor: AppColors.sell,
        disabledColor: AppColors.sell,
        textColor: AppColors.white,
        icon: icon,
      );

  @override
  Widget build(BuildContext context) {
    final isButtonEnabled = enabled && onPressed != null;
    final loadingForegroundColor =
        loading ? textColor.withOpacity(.5) : textColor;

    final borderColor = enabled ? this.borderColor : Colors.transparent;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: ElevatedButton(
        onPressed: loading
            ? null
            : isButtonEnabled
                ? onPressed
                : onDisabledPressed,
        style: ButtonStyle(
          maximumSize: WidgetStateProperty.all(const Size(double.infinity, 40)),
          elevation: WidgetStateProperty.all(0),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
          ),
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if ((!isButtonEnabled || onPressed == null) && !loading) {
                return disabledColor;
              }
              return enabledColor;
            },
          ),
          foregroundColor: WidgetStateProperty.all(
            isButtonEnabled ? loadingForegroundColor : disabledTextColor,
          ),
          overlayColor: WidgetStateProperty.all(enabledColor),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: borderColor,
                width: 1,
              ),
            ),
          ),
          fixedSize: WidgetStateProperty.all(
            const Size.fromHeight(56),
          ),
          // textStyle: WidgetStatePropertyAll(
          //   AppTextStyles.body3Bold,
          // ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon == null) ...[
                Expanded(
                  child: Visibility(
                    visible: loading,
                    replacement: Text(title, textAlign: TextAlign.center),
                    child: CupertinoActivityIndicator(
                      color: textColor,
                    ),
                  ),
                ),
              ] else ...[
                Visibility(
                  visible: loading,
                  replacement: SizedBox.square(dimension: 24, child: icon),
                  child: CupertinoActivityIndicator(color: textColor),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(title),
                ),
                const SizedBox.square(dimension: 24),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    required this.title,
    required this.onPressed,
    required this.color,
    this.height,
    this.width,
    super.key,
  });

  final String title;
  final VoidCallback onPressed;
  final Color color;

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        color: color,
        elevation: 0,
        padding: const EdgeInsets.all(8),
        onPressed: onPressed,
        child: SecondaryText(
          text: title,
          foreground: AppColors.white,
          textSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class DefaultGradientButton extends StatelessWidget {
  const DefaultGradientButton({
    required this.title,
    required this.onPressed,
    this.height,
    this.width,
    super.key,
  });

  final String title;
  final VoidCallback onPressed;

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        gradient: const LinearGradient(
          colors: [
            Color(0xff483BEB),
            Color(0xff7847E1),
            Color(0xffDD568D),
          ],
        ),
      ),
      child: MaterialButton(
        color: Colors.transparent,
        elevation: 0,
        padding: const EdgeInsets.all(8),
        onPressed: onPressed,
        child: SecondaryText(
          text: title,
          foreground: AppColors.white,
          textSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class DefaultImageButton extends StatelessWidget {
  const DefaultImageButton({
    required this.image,
    required this.onPressed,
    this.isSvg = false,
    this.size = 32,
    super.key,
  });

  final String image;
  final VoidCallback onPressed;
  final bool isSvg;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: InkWell(
        onTap: onPressed,
        child: isSvg
            ? SvgPicture.asset(
                image,
              )
            : Image.asset(
                image,
              ),
      ),
    );
  }
}
