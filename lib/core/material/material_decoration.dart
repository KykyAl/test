import 'package:brief_project/core/material/color_material.dart';
import 'package:brief_project/core/material/resolution_size.dart';
import 'package:brief_project/core/material/text_style_material.dart';
import 'package:flutter/material.dart';

class MaterialDecoration {
//TEXTFORMFIELD DECORATION
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: colorPrimary, width: 1));
  OutlineInputBorder outlineInputBorderSecondary = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: colorGray, width: 1));
  InputDecoration inputDecoration(
      {String? hintText,
      String? label,
      bool? enable,
      IconData? icons,
      TextStyle? labelStyle,
      Color? iconColor,
      bool? show,
      double? labelWidth}) {
    return InputDecoration(
      hintText: hintText,
      border: outlineInputBorderSecondary,
      hintStyle: materialTextStyle.hintTextTextStyle,
      prefixIcon: label == null && icons != null
          ? Icon(
              icons,
              color: iconColor,
            )
          : null,
      label: label != null
          ? SizedBox(
              width: labelWidth ?? 110,
              child: Row(
                children: [
                  Icon(
                    icons,
                    color: iconColor != null
                        ? iconColor
                        : enable == false
                            ? colorGray
                            : colorPrimary,
                  ),
                  resolutionSize.normalResolutionSpaceWidth,
                  Expanded(
                    child: Text(
                      label,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            )
          : null,
      enabled: enable ?? true,
      floatingLabelStyle: labelStyle != null
          ? labelStyle
          : enable == false
              ? materialTextStyle.formTitleTextStyleGrey
              : materialTextStyle.formTitleTextStylePrimary,
      labelStyle: labelStyle != null
          ? labelStyle
          : enable == false
              ? materialTextStyle.formTitleTextStyleGrey
              : materialTextStyle.formTitleTextStylePrimary,
      disabledBorder: outlineInputBorderSecondary,
      enabledBorder: outlineInputBorderSecondary,
      focusedBorder: outlineInputBorder,
    );
  }

//BUTTON DECORATION
  ButtonStyle buttonStylePrimary = ButtonStyle(
    textStyle:
        MaterialStateProperty.all(materialTextStyle.normalTextStyleWhite),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    backgroundColor: MaterialStateProperty.all(colorPrimary),
  );
  ButtonStyle buttonStyleDisabled = ButtonStyle(
    textStyle:
        MaterialStateProperty.all(materialTextStyle.normalTextStyleWhite),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    backgroundColor: MaterialStateProperty.all(colorGray),
  );

  ButtonStyle buttonStyleTransparan = ButtonStyle(
    elevation: MaterialStateProperty.all(0.0),
    textStyle:
        MaterialStateProperty.all(materialTextStyle.normalTextStylePrimaryW500),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    backgroundColor: MaterialStateProperty.all(colorTransparant),
  );
  ButtonStyle buttonStyleWhite = ButtonStyle(
    elevation: MaterialStateProperty.all(0.0),
    textStyle:
        MaterialStateProperty.all(materialTextStyle.normalTextStylePrimaryW500),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    backgroundColor: MaterialStateProperty.all(colorWhite),
  );
}

MaterialDecoration materialDecoration = MaterialDecoration();
