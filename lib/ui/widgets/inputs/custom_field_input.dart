import '../../index.dart';

class CustomFieldInput extends StatefulWidget {
  final double? width;
  final ValueChanged<String>? onChange;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final Widget? leading;
  final bool showPassword;
  final GestureTapCallback? callback;
  final Widget? iconSuffix;
  final TextEditingController? controller;
  final bool isLoad;
  final bool isEnabled;
  final double padding;
  final double? heightHint;
  final double borderRadius;
  final int? maxLines;
  final bool expands;
  final GestureTapCallback? onTap;
  final bool isErrorValid;
  final bool readOnly;
  final ValueChanged<String>? onSubmitDone;
  final Color colorBg;

  // ignore: use_key_in_widget_constructors
  const CustomFieldInput({
    this.onChange,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.width,
    this.leading,
    this.showPassword = true,
    this.isLoad = false,
    this.callback,
    this.iconSuffix,
    this.controller,
    this.isEnabled = true,
    this.padding = 8,
    this.heightHint,
    this.borderRadius = 16,
    this.maxLines = 1,
    this.expands = false,
    this.onTap,
    this.isErrorValid = false,
    this.readOnly = false,
    this.onSubmitDone,
    this.colorBg = kcBackgroundColor,
  });

  @override
  State<CustomFieldInput> createState() => _CustomFieldInputState();
}

class _CustomFieldInputState extends State<CustomFieldInput> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = !widget.showPassword;
  }

  void _toggleObscure() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    var lang = localizationDelegate.currentLocale.languageCode;
    final theme = Theme.of(context);

    final isPasswordField = !widget.showPassword;
    Widget? suffixIcon = widget.iconSuffix;
    if (isPasswordField) {
      suffixIcon = IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
          color: kcMediumGrey,
        ),
        onPressed: _toggleObscure,
      );
    }

    return GestureDetector(
      child: Container(
        width: widget.width,
        decoration: BoxDecoration(
            color: widget.colorBg,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border.all(
                color: widget.isErrorValid ? kcRedColor : kcBorderColor)),
        child: TextFormField(
          scrollPadding: EdgeInsets.zero,
          controller: widget.controller,
          keyboardType: widget.keyboardType == TextInputType.number
              ? TextInputType.text
              : widget.keyboardType,
          inputFormatters: widget.keyboardType == TextInputType.number
              ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
              : [],
          onChanged: widget.onChange,
          readOnly: widget.readOnly,
          onTap: widget.onTap,
          obscureText: _obscureText,
          style: TextStyle(
              color: !widget.isEnabled ? Colors.grey : kcSecondaryColor),
          maxLines: widget.maxLines,
          expands: widget.expands,
          onFieldSubmitted: widget.onSubmitDone,
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: InputBorder.none,
            icon: widget.leading,
            contentPadding: EdgeInsets.all(widget.padding),
            hintMaxLines: 1,
            isDense: true,
            enabled: widget.isEnabled,
            suffixIcon: suffixIcon,
            errorStyle: const TextStyle(fontSize: 11),
            // ignore: deprecated_member_use
            hintStyle: theme.textTheme.bodyMedium!.copyWith(
                fontSize: AppFontSize.font14,
                fontWeight: FontWeight.w500,
                height: widget.heightHint,
                color: widget.isErrorValid ? kcRedColor : kcMediumGrey),
          ),
        ),
      ),
    );
  }
}
