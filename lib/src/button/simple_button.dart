
import 'package:flutter/material.dart';
import 'package:gbc_components/src/utils/colors.dart';
import 'package:gbc_components/src/utils/enums.dart';

class SimpleButton extends StatefulWidget {
  final GestureTapCallback? onTap;
  final bool isloading;
  final String label;
  final TypeButton? type;
  final SizeButton? size;
  final Color? color;
  final Color? hoverColor;
  const SimpleButton({super.key, this.hoverColor, this.color, this.isloading=false, this.onTap, this.type=TypeButton.primary, this.size=SizeButton.lg, required this.label});

  @override
  State<SimpleButton> createState() => _SimpleButtonState();
}

class _SimpleButtonState extends State<SimpleButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap(),
      onHover: (v){
        setState(() {
          isHover = v;
        });
      },
      child: Container(
        height: defineSize(widget.size),
        width: double.infinity,
        decoration: defineDecoration(context, type: widget.type, disabled: widget.onTap==null),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if(widget.isloading)
              const CircularProgressIndicator(),

            if(widget.isloading)
              Text(
                ' Carregando...',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: defineTextColor(context, type:widget.type, disabled: widget.onTap==null)
                )
              ),
              
            if(!widget.isloading)
              Text(
                widget.label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: defineTextColor(context, type:widget.type, disabled: widget.onTap==null)
                )
              )
          ]
        )
      ),
    );
  }

  GestureTapCallback? onTap() {
    return widget.isloading ? null : widget.onTap;
  }

  double defineSize(SizeButton? size){
    if(size == SizeButton.lg && widget.type == TypeButton.primary) return 56;
    if(size == SizeButton.lg && widget.type == TypeButton.secondary) return 54;
    if(size == SizeButton.lg && widget.type == TypeButton.cancel) return 54;
    
    if(size == SizeButton.lg && widget.type == TypeButton.primary) return 42;
    if(size == SizeButton.lg && widget.type == TypeButton.secondary) return 40;
    if(size == SizeButton.lg && widget.type == TypeButton.cancel) return 40;
    
    return 42;
  }

  Color defineTextColor(BuildContext context, {required TypeButton? type, required bool disabled}){
    // Desabilitar button
    if((type == TypeButton.secondary) && disabled)return AppDefaultColor.ti04Color;
    if((type == TypeButton.cancel) && disabled)return AppDefaultColor.ti04Color;
    if(type == TypeButton.primary && disabled)return AppDefaultColor.ti08Color;
    
    if(type == TypeButton.cancel)return AppDefaultColor.ti02Color;

    if(type == TypeButton.secondary && isHover) return widget.hoverColor ?? Theme.of(context).colorScheme.surface;
    if(type == TypeButton.secondary) return widget.color ?? Theme.of(context).primaryColor;
    
    return widget.hoverColor ?? Theme.of(context).colorScheme.surface;
  }

  BoxDecoration defineDecoration(BuildContext context, {required TypeButton? type, required bool disabled}){
    if((type == TypeButton.cancel)||(type == TypeButton.secondary) && disabled){
      return BoxDecoration(
        border: Border.all(width: 2, color: AppDefaultColor.ti04Color),
        borderRadius: BorderRadius.circular(10)
      );
    }

    if(type == TypeButton.primary && disabled){
      return BoxDecoration(
        color: AppDefaultColor.ti04Color,
        borderRadius: BorderRadius.circular(10)
      );
    }
    
    if(type == TypeButton.cancel){
      return BoxDecoration(
        border: Border.all(width: 2, color: AppDefaultColor.ti04Color),
        borderRadius: BorderRadius.circular(10)
      );
    }
    if(type == TypeButton.secondary){
      return BoxDecoration(
        border: Border.all(width: 2, color: widget.color ?? Theme.of(context).primaryColor),
        color: isHover ? widget.color ?? Theme.of(context).primaryColor : null,
        borderRadius: BorderRadius.circular(10)
      );
    }
    
    // Default is primary
    return BoxDecoration(
      color: isHover ? widget.color?.withOpacity(.8) ?? Theme.of(context).primaryColor.withOpacity(.8) : widget.color ?? Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10)
    );
  }
}