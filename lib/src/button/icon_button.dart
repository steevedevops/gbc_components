
import 'package:flutter/material.dart';
import 'package:gbc_components/src/utils/button_utils.dart';
import 'package:gbc_components/src/utils/enums.dart';

class IconButton extends StatefulWidget {
  final GestureTapCallback? onTap;
  final bool isloading;
  final IconData icon;
  final String label;
  final TypeButton? type;
  final SizeButton? size;
  final Color? color;
  final Color? hoverColor;
  const IconButton({super.key, required this.icon, this.hoverColor, this.color, this.isloading=false, this.onTap, this.type=TypeButton.primary, this.size=SizeButton.lg, required this.label});

  @override
  State<IconButton> createState() => _IconButtonState();
}

class _IconButtonState extends State<IconButton> {
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
        height: ButtonUtils.defineSize(size: widget.size, type: widget.type),
        width: double.infinity,
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

            Icon(
              widget.icon, 
              color: ButtonUtils.defineTextColor(
              context, 
              isHover: isHover,
              color: widget.color,
              hoverColor: widget.hoverColor,
              type: widget.type, 
              disabled: widget.onTap==null
            )),
            const SizedBox(width: 5),

            if(widget.isloading)
              const CircularProgressIndicator(),

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