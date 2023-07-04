import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    this.title,
     this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.submit,
    this.onChange,
    this.initialValue,
    this.hint,
    this.hint2,
    this.readOnly = false,
    this.autoFocus = false,
    this.horizontalPadding = 10,
    this.isPassword = false,
    this.maxLines = 1,
    this.maxLength = 500,
    this.onTap,
    this.icon,
    this.endIcon,
    this.label,
    this.style = const TextStyle(
      fontFamily: 'arFont',
      fontSize: 17,
      color: Color(0xff292929),
      letterSpacing: -0.4,
      fontWeight: FontWeight.w500,
    ),
    Key? key,
    this.isFilled = false,
    this.verticalPadding = 10,
    this.errorText,
    this.withClearIcon = true,
    this.height = 0.0,
    this.borderRadius = 8,
    this.borderColor = Colors.black87,
    this.borderFocusColor = Colors.black87,
    this.filledColor = Colors.white,
    this.hintStyle = const TextStyle(
      fontFamily: 'Almarai',
      fontSize: 13,
      color: Color(0xff797985),
    ),
    this.textAlign = TextAlign.start,
    this.borderWidth = 1,this.inputFormatters,
  })  :
        super(key: key);
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChange;
  final Function? submit;
  final String? initialValue;
  final String? title;
  final String? hint;
  final String? hint2;
  final bool readOnly;
  final bool autoFocus;
  final bool isPassword;
  final bool isFilled;
  final double horizontalPadding;
  final double verticalPadding;
  final double height;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final Color borderFocusColor;
  final Color filledColor;
  final int? maxLines;
  final int? maxLength;
  final Function()? onTap;
  final Widget? icon;
  final Widget? endIcon;
  final Widget? label;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextAlign textAlign;

  final String? errorText;

  final bool withClearIcon;
  final List<TextInputFormatter>? inputFormatters;

  @override
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isVisible = false;

  void _onListen() => setState(() {});

  final node1 = FocusNode();

  @override
  void initState() {
    widget.controller?.addListener(_onListen);
    super.initState();
    node1.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    debugPrint("Focus: ${node1.hasFocus}");
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.submit == null &&
        widget.textInputAction == TextInputAction.done) {
      throw 'Error: onSubmit == null && inputAction == TextInputAction.done. Provide an onSubmit function.';
    }

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: widget.horizontalPadding,
          vertical: widget.verticalPadding),

      child: Center(
        child: TextFormField(
            scrollPadding: const EdgeInsets.only(bottom:150),
            style: widget.keyboardType == TextInputType.phone
                ? widget.style!.copyWith(
                    letterSpacing: 1,
                    fontSize: 22,
                    color: const Color(0xff343434),
                    fontWeight: FontWeight.w300)
                : widget.style,
            onTap: widget.onTap,
            initialValue: widget.initialValue,
            controller: widget.controller,
            readOnly: widget.readOnly,
            keyboardType: widget.keyboardType,
            autofocus: widget.autoFocus,
            textInputAction: widget.textInputAction,
            maxLines: widget.maxLines,
            textAlign: widget.textAlign,
            maxLength: widget.keyboardType == TextInputType.phone
                ? 11
                : widget.maxLength!,
            focusNode: node1,

            obscureText: (widget.isPassword == true)
                ? (isVisible == true)
                    ? !isVisible
                    : !isVisible
                : false,
            validator: widget.validator != null
                ? (String? value) => widget.validator!(value)
                : null,
            onChanged: widget.onChange != null
                ? (String? value) => widget.onChange!(value)
                : null,
            onFieldSubmitted: (_) {
              if (widget.textInputAction != TextInputAction.done &&
                  widget.textInputAction != TextInputAction.search) return;
              widget.submit!();
            },
            inputFormatters:widget.inputFormatters ?? ((widget.keyboardType == TextInputType.number)
                ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
                : (widget.keyboardType ==
                const TextInputType.numberWithOptions()) ||(widget.keyboardType ==
                            const TextInputType.numberWithOptions(decimal: true) ||
                        widget.keyboardType ==
                            const TextInputType.numberWithOptions(
                                signed: true, decimal: true) ||
                        widget.keyboardType == TextInputType.phone)
                    ? <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,3}'))
                      ]
                    : <TextInputFormatter>[
                        FilteringTextInputFormatter.deny('\n')
                      ]),
            decoration: InputDecoration(
              counterText: '',
              counterStyle: const TextStyle(fontSize: 0),
              contentPadding: widget.textAlign == TextAlign.center
                  ? EdgeInsets.only(
                  top: widget.maxLines! > 1 ? 15 : widget.height,
                  bottom: widget.maxLines! > 1 ? 10 : widget.height)
                  : EdgeInsets.only(
                      right: widget.icon != null ? 8 : 20,
                      left: 10,
                      top: widget.maxLines! > 1 ? 15 : widget.height,
                      bottom: widget.maxLines! > 1 ? 10 : widget.height),
              labelText: widget.title,
              labelStyle: widget.hintStyle!,
              errorText: widget.errorText,
              hintText: widget.hint,
              label: widget.label,
              hintStyle: widget.hintStyle,
              prefixIcon: widget.icon,
              // to make label in the start of field if it large
              alignLabelWithHint: true,
              //to show lable in top of field
              floatingLabelBehavior: FloatingLabelBehavior.never,
              suffixIconColor: Colors.red,
              suffixIcon: widget.endIcon != null
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          const SizedBox(
                            width: 2,
                          ),
                          widget.endIcon ?? const SizedBox(),
                          const SizedBox(
                            width: 2,
                          ),
                          clearButton(context) ?? const SizedBox(),
                          const SizedBox(
                            width: 2,
                          )
                        ])
                  : ((widget.isPassword) ? passIcon() : clearButton(context)),
              filled: widget.isFilled,
              fillColor: widget.filledColor,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide(
                    color: widget.borderColor,
                    width: widget.borderWidth,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide(
                    color: widget.borderFocusColor,
                    width: widget.borderWidth,
                  )),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide(
                    color: widget.borderColor,
                    width: widget.borderWidth,
                  )),
            ),
            onEditingComplete: () =>
                widget.textInputAction == TextInputAction.done ||
                        widget.textInputAction == TextInputAction.search
                    ? node1.unfocus()
                    : FocusScope.of(context).nextFocus()
            ),
      ),
    );
  }

  IconButton passIcon() {
    return (isVisible == false)
        ? IconButton(
            onPressed: () => setState(() => isVisible = true),
            icon: const Icon(
              CupertinoIcons.eye,
              color: AppColors.primaryColor,
            ),
          )
        : IconButton(
            onPressed: () => setState(() => isVisible = false),
            icon: const Icon(CupertinoIcons.eye_slash,
                color: AppColors.primaryColor),
          );
  }

  Widget? clearButton(BuildContext context) {
    return ((widget.controller??TextEditingController()).text.isEmpty)
        ? widget.icon == null
            ? null
            : const SizedBox(
                width: 0.0,
              ) //to center hint
        : widget.withClearIcon
            ? GestureDetector(
                onTap: () {
                  widget.controller?.clear();
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.grey.withOpacity(0.3),
                      child: Icon(
                        Icons.clear,
                        size: 13,
                        color: widget.borderColor == Colors.transparent
                            ? AppColors.primaryColor
                            : AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    )
                  ],
                ),
              )
            : null;
  }
}
