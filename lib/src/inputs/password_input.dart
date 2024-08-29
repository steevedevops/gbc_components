// import 'package:flutter/material.dart';
// import 'package:gbc_components/src/texts/text_error.dart';
// import 'package:gbc_components/src/utils/colors.dart';
// import 'package:gbc_components/src/utils/enums.dart';
// import 'package:gbc_components/src/utils/input_utils.dart';
// import 'theme/input_theme.dart';



// class PasswordInput extends StatefulWidget {
//   final TextEditingController? controller;
//   final String? title;
//   final bool? validator;
//   final String? hintText;
//   final ValueChanged<String>? onFieldSubmitted;
//   final SizeInput? size;

//   const PasswordInput({
//     super.key, 
//     this.hintText, 
//     this.onFieldSubmitted, 
//     this.size=SizeInput.lg,
//     this.validator=false, 
//     this.title, this.controller
//   });

//   @override
//   State<PasswordInput> createState() => _PasswordInputState();
// }

// class _PasswordInputState extends State<PasswordInput> {
//   StatusTextField statusValided = StatusTextField.valided;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           height: InputUtils.defineSize(widget.size),
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//           decoration: BoxDecoration(
//             border: Border.all(
//               width: 1.5,
//               color: InputUtils.getColorBorder(statusValided: statusValided, enabled: true)
//             ),
//             borderRadius: BorderRadius.circular(10)
//           ),
//           child: TextFormField(
//             controller: widget.controller,
//             onChanged: (value) {
//               if (value.length < 3) {
//                 setState(() => statusValided = StatusTextField.peloMenosTresDigitos);
//               }else{
//                 setState(() => statusValided = StatusTextField.valided);
//               }
//             },
//             validator: (value){
//               setState(() => statusValided = StatusTextField.valided);
//               if(widget.validator == false)return null;

//               if (value!.isEmpty) {
//                 setState(() => statusValided = StatusTextField.errorFieldRequired);
//                 return '';
//               }

//               if (value.length < 3) {
//                 setState(() => statusValided = StatusTextField.peloMenosTresDigitos);
//                 return '';
//               }

//               return null;
//             },
//             cursorHeight: AppDefaultFontSize.cursorHeight,
//             style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//               height: 1.9,
//               color: AppDefaultColor.ti00Color
//             ),
//             obscureText: true,
//             onFieldSubmitted: widget.onFieldSubmitted,
//             decoration: inputThemeDecoration(
//               context,
//               statusTextField: statusValided,
//               title: widget.title,
//               hintText: widget.hintText
//             )
//           ),
//         ),
//         if(statusValided != StatusTextField.valided)
//           TextErrorMessageWidget(statusTextField: statusValided)
//       ],
//     );
//   }
// }