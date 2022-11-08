import 'package:flutter/material.dart';
import 'package:task/utils/resources/app_font.dart';

class TextInputField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextInputType type;
  final Widget? prefIcon;
  final double paddingH;
  final double paddingW;
  final double blurRaduis;
  final Function()? funSuffix;
  final TextEditingController textController;
  final String? Function(String?)? validator;
  final void Function(String?)? onSubmit;

  final isClickable;

  const TextInputField({
    Key? key,
    required this.hintText,
    required this.type,
    this.isClickable = true,
    this.obscureText = false,
    this.prefIcon,
    this.paddingH = 8,
    this.paddingW = 0.0,
    this.blurRaduis = 20,
    this.funSuffix,
    required this.textController,
    required this.validator,
    this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingW),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: blurRaduis,
                offset: const Offset(4, 8),
              ),
            ],
          ),
          child: TextFormField(
            onFieldSubmitted: onSubmit,
            enabled: isClickable,
            autocorrect: false,
            validator: validator,
            obscureText: obscureText,
            keyboardType: type,
            controller: textController,
            decoration: InputDecoration(
              suffixIcon: prefIcon != null
                  ? InkWell(
                      child: prefIcon,
                      onTap: funSuffix,
                    )
                  : null,
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: AppScreenUtil.f18,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
