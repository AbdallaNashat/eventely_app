import 'package:eventely/core/theme/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final bool? isPassword;
  final String? hintText;
  final String? label;
  final bool? enabled;
  final TextStyle? textStyle;
  final int? maxLines, minLines, maxLength;
  final String? obscuringCharacter, value;
  final String? Function(String?)? onValidate;
  final void Function(String?)? onChanged, onFieldSubmitted, onSaved;
  final void Function()? onEditingComplete, onTab;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixWidget, prefixIcon;
  final IconData? icon;
  final TextInputAction? action;
  final FocusNode? focusNode;
  final Color? hintColor;
  final TextDirection? textDirection;
  final EdgeInsets? edgeInsets;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.isPassword,
    this.hintText,
    this.label,
    this.enabled,
    this.textStyle,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.obscuringCharacter,
    this.value,
    this.onValidate,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSaved,
    this.onEditingComplete,
    this.onTab,
    this.keyboardType,
    this.inputFormatters,
    this.suffixWidget,
    this.prefixIcon,
    this.icon,
    this.action,
    this.focusNode,
    this.hintColor = ColorPalette.white,
    this.textDirection,
    this.edgeInsets = const EdgeInsets.only(
      top: 14,
      bottom: 14,
      left: 16,
      right: 16,
    ),
  });
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}
class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      textDirection: widget.textDirection,
      controller: widget.controller,
      textAlignVertical: TextAlignVertical.center,
      initialValue: widget.value,
      validator: widget.onValidate,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
      onTap: widget.onTab,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      obscureText: widget.isPassword ?? false ? obscureText : false,
      obscuringCharacter: "*",
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      style: widget.textStyle ??
          theme.textTheme.bodyMedium?.copyWith(
            color: const Color(0XFF222222),
            fontWeight: FontWeight.w500,
          ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: widget.action ?? TextInputAction.done,
      focusNode: widget.focusNode,
      cursorColor: theme.primaryColor,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: theme.textTheme.bodyMedium?.copyWith(
          color: const Color(0XFF777777),
          fontWeight: FontWeight.w500,
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 56),
        suffixIcon: widget.isPassword ?? false
            ? InkWell(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: Icon(
                  obscureText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Colors.grey,
                ),
              )
            : widget.suffixWidget,
        prefixIcon: widget.prefixIcon,

          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 16,
            color: widget.hintColor,
            fontWeight: FontWeight.w500,
          ),

          counterText: "",
          //fillColor: Colors.white,
          //filled: true,
          contentPadding: widget.edgeInsets,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: ColorPalette.primaryColor,
          )
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: ColorPalette.primaryColor,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: ColorPalette.primaryColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: ColorPalette.primaryColor,
            width: 1,
          ),
        ),

        errorStyle: const TextStyle(
          color: Color(0XFFCC0000),
          fontSize: 12,
        ),
        errorMaxLines: 6,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color(0XFFCC0000),
            width: 1,

          )
        )
      ),
    );
  }
}
