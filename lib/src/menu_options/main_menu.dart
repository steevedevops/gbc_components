import 'package:flutter/material.dart';
import 'package:gbc_components/src/utils/colors.dart';

class MenuOptionsWidget extends StatefulWidget {
  final List<Widget> menuChildren;
  final Offset? offset;
  final IconData? icon;
  final Widget? customComponent;
  const MenuOptionsWidget({super.key, this.customComponent, this.offset, this.icon, required this.menuChildren});

  @override
  State<MenuOptionsWidget> createState() => _MenuOptionsWidgetState();
}

class _MenuOptionsWidgetState extends State<MenuOptionsWidget> {
  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      alignmentOffset: widget.offset ?? const Offset(-160, -30),
      style: MenuStyle(
        elevation: const WidgetStatePropertyAll<double>(0),
        shadowColor: WidgetStatePropertyAll<Color>(AppDefaultColor.ti02Color),
        padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 7, vertical: 15)),
        backgroundColor: const WidgetStatePropertyAll<Color>(Colors.white),
        side: WidgetStatePropertyAll<BorderSide>(BorderSide(
          width: 1,
          color: AppDefaultColor.ti04Color
        )),
        shape: const WidgetStatePropertyAll<OutlinedBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        )),
      ),
      menuChildren: widget.menuChildren,
      builder: (ctx, controller, child){
        return InkWell(
          onTap: (){
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          child: widget.customComponent ?? Icon(widget.icon, color: AppDefaultColor.ti03Color),
        );
      }
    );
  }
}