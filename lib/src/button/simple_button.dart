
import 'package:flutter/material.dart';
import 'package:gbc_components/src/utils/button_utils.dart';
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
        width: double.infinity,
        height: ButtonUtils.defineSize(size: widget.size, type: widget.type),
        decoration: ButtonUtils.defineDecoration(
          context, 
          type: widget.type, 
          disabled: widget.onTap==null,
          color: widget.color,
          hoverColor: widget.hoverColor,
          isHover: isHover
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if(widget.isloading)
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: ButtonUtils.defineTextColor(
                      context, 
                      type: widget.type, 
                      disabled: widget.onTap==null,
                      isHover: isHover,
                      color: widget.color,
                      hoverColor: widget.hoverColor,
                    ),
                ),
              ),

            if(widget.isloading)
              const SizedBox(width: 10),
            if(widget.isloading)
              Text(
                ' Carregando...',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ButtonUtils.defineTextColor(
                    context, 
                    type: widget.type, 
                    disabled: widget.onTap==null,
                    isHover: isHover,
                    color: widget.color,
                    hoverColor: widget.hoverColor,
                  )
                )
              ),
              
            if(!widget.isloading)
              Text(
                widget.label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ButtonUtils.defineTextColor(
                    context, 
                    type: widget.type, 
                    disabled: widget.onTap==null,
                    isHover: isHover,
                    color: widget.color,
                    hoverColor: widget.hoverColor,
                  )
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
}