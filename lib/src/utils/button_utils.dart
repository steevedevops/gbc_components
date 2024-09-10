import 'package:flutter/material.dart';
import 'package:gbc_components/gbc_components.dart';

class ButtonUtils {

  static double defineSize({SizeButton? size, final TypeButton? type}){
    if(size == SizeButton.lg && type == TypeButton.primary) return 56;
    if(size == SizeButton.lg && type == TypeButton.secondary) return 54;
    if(size == SizeButton.lg && type == TypeButton.cancel) return 54;
    
    if(size == SizeButton.lg && type == TypeButton.primary) return 42;
    if(size == SizeButton.lg && type == TypeButton.secondary) return 40;
    if(size == SizeButton.lg && type == TypeButton.cancel) return 40;
    
    return 42;
  }


  static Color defineTextColor(BuildContext context, {
    required TypeButton? type, 
    required bool disabled,
    Color? color,
    Color? hoverColor,
    required bool isHover,
  }){
    // Desabilitar button
    if((type == TypeButton.secondary) && disabled)return AppDefaultColor.ti04Color;
    if((type == TypeButton.cancel) && disabled)return AppDefaultColor.ti04Color;
    if(type == TypeButton.primary && disabled)return AppDefaultColor.ti08Color;
    
    if(type == TypeButton.cancel)return AppDefaultColor.ti02Color;

    if(type == TypeButton.secondary && isHover) return hoverColor ?? Theme.of(context).colorScheme.surface;
    if(type == TypeButton.secondary) return color ?? Theme.of(context).primaryColor;
    
    return hoverColor ?? Theme.of(context).colorScheme.surface;
  }

  static BoxDecoration defineDecoration(BuildContext context, {
    required TypeButton? type, 
    required bool disabled,
    Color? color,
    Color? hoverColor,
    required bool isHover,
  }){
    if((type == TypeButton.cancel)||(type == TypeButton.secondary) && disabled){
      return BoxDecoration(
        border: Border.all(width: 2, color: AppDefaultColor.ti04Color),
        borderRadius: BorderRadius.circular(5)
      );
    }

    if(type == TypeButton.primary && disabled){
      return BoxDecoration(
        color: AppDefaultColor.ti04Color,
        borderRadius: BorderRadius.circular(5)
      );
    }
    
    if(type == TypeButton.cancel){
      return BoxDecoration(
        border: Border.all(width: 2, color: AppDefaultColor.ti04Color),
        borderRadius: BorderRadius.circular(5)
      );
    }
    if(type == TypeButton.secondary){
      return BoxDecoration(
        border: Border.all(width: 2, color: color ?? Theme.of(context).primaryColor),
        color: isHover ? color ?? Theme.of(context).primaryColor : null,
        borderRadius: BorderRadius.circular(5)
      );
    }
    
    // Default is primary
    return BoxDecoration(
      color: isHover ? color?.withOpacity(.8) ?? Theme.of(context).primaryColor.withOpacity(.8) : color ?? Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(5)
    );
  }

}