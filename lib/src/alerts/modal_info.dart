// import 'package:flutter/material.dart';
// import '../../gbc_components.dart';

// final Color vSuccessColor = Color(0xff48BD69);
// final Color vDangerColor = Color(0xffE73D3C);
// final Color vWarningColor = Color(0xffFEA713);
// final Color vInfoColor = Color(0xff41D1FF);
// final Color vDefaultColor = Color(0xffF8F8FB);


// Future<String?> showDialogMsg(BuildContext context,{
//   final GestureTapCallback? okTap,
//   final GestureTapCallback? cancelTap,
//   double height=310,
//   bool dismissible=true,
//   IconData? icon,
//   DialogColorType dialogColorType = DialogColorType.DEFAULT,
//   required String okLabel,
//   String? cancelLabel,
//   required String title,
//   required String subtitle,
// }) async {
//     return showDialog(
//       context: context,
//       barrierDismissible: dismissible,
//       builder: (context) {
//         return AlertDialog(
//           backgroundColor: Colors.white,
//           surfaceTintColor: Colors.white,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
//           content: SizedBox(
//             width: 300,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const SizedBox(height: 10),
//                 if(DialogColorType.DANGER == dialogColorType)
//                   CircleAvatar(
//                     radius: 30,
//                     backgroundColor: vDangerColor,
//                     child: Icon(icon ?? FeatherIcons.alertTriangle, color: Colors.white, size: 30),
//                   ),

//                 if(DialogColorType.WARNING == dialogColorType)
//                   CircleAvatar(
//                     radius: 30,
//                     backgroundColor: vWarningColor,
//                     child: Icon(icon ?? FeatherIcons.alertTriangle, color: Colors.white, size: 30),
//                   ),

//                 if(DialogColorType.SUCESS == dialogColorType || DialogColorType.INFO == dialogColorType)
//                   CircleAvatar(
//                     radius: 30,
//                     backgroundColor: DialogColorType.INFO == dialogColorType ? vInfoColor : vSuccessColor,
//                     child: Icon(icon ?? FeatherIcons.check, size: 30, color: Colors.white,),
//                   ),
//                 const SizedBox(height: 20),
//                 Text(title,
//                   textAlign: TextAlign.center,
//                   style: GoogleFonts.inter(
//                     fontSize: 15,
//                     color: AppColorLight.text03Color
//                   )
//                 ),
//                 const SizedBox(height: 20),
//                 Text(subtitle,
//                   textAlign: TextAlign.center,
//                   style: GoogleFonts.inter(
//                     fontSize: 17
//                   )
//                 ),
//                 const SizedBox(height: 30),
//                 ButtonWidget(
//                   label: okLabel,
//                   isloading: false,
//                   size: SizeButton.md,
//                   type: TypeButton.primary,
//                   onTap: okTap
//                 ),
                
//                 if(cancelTap != null)
//                 const SizedBox(height: 20),
//                 if(cancelTap != null)
//                 ButtonWidget(
//                   label: cancelLabel ?? 'CANCELAR',
//                   size: SizeButton.md,
//                   type: TypeButton.secondary,
//                   onTap: cancelTap
//                 )
//               ]
//             ),
//           ),
//         );
//       }
//     );
//   }
