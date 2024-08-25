import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gbc_components/gbc_components.dart';
import 'package:gbc_components/src/formatters/br_telefone_input_formatter.dart';
import 'package:gbc_components/src/formatters/cep_input_formatter.dart';
import 'package:gbc_components/src/formatters/cnpj_input_formatter.dart';
import 'package:gbc_components/src/formatters/cpf_input_formatter.dart';
import 'package:gbc_components/src/formatters/credit_card_formatter.dart';
import 'package:gbc_components/src/formatters/currency_input_formatter.dart';
import 'package:gbc_components/src/formatters/date_formatter.dart';
import 'package:gbc_components/src/formatters/mmyy_formatter.dart';
import 'package:gbc_components/src/formatters/mmyyyy_formatter.dart';
import 'package:gbc_components/src/formatters/time_formatter.dart';
import 'package:gbc_components/src/inputs/theme/input_theme.dart';
import 'package:gbc_components/src/texts/text_error.dart';
import 'package:gbc_components/src/utils/colors.dart';
import 'package:gbc_components/src/utils/input_utils.dart';




class SimpleInput extends StatefulWidget {
  final TextEditingController? controller;
  final Widget? prefix;
  final String? title;
  final bool? enabled;
  final bool? autofocus;
  final bool? validator;
  final TypeSimpleInput? typeInput;
  final String? hintText;
  final VoidCallback? onTap;
  final ValueChanged<String>? onFieldSubmitted;
  final SizeInput? size;

  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
final ValueChanged<String>? onChange;
  const SimpleInput({
    super.key, 
    this.hintText,
    this.prefix, 
    this.inputFormatters,
    this.onTap,
    this.size=SizeInput.lg, 
    this.onFieldSubmitted, 
    this.typeInput=TypeSimpleInput.DEFAULT,
    this.textCapitalization = TextCapitalization.none,
    this.onChange,
    this.keyboardType,
    this.validator, 
    this.title, 
    this.enabled=true, 
    this.autofocus=false, 
    
    this.controller
  });

  @override
  State<SimpleInput> createState() => _SimpleInputState();
}

class _SimpleInputState extends State<SimpleInput> {

  StatusTextField statusValided = StatusTextField.valided;

  bool isEmail(String input) => EmailValidator.validate(input);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: InputUtils.defineSize(widget.size),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.5,
              color: InputUtils.getColorBorder(statusValided: statusValided, enabled: widget.enabled!)
            ),
            color: widget.enabled == false ? AppDefaultColor.ti05Color : null,
            borderRadius: BorderRadius.circular(10)
          ),
          child: TextFormField(
            controller: widget.controller,
            autofocus: widget.autofocus ?? false,
            enabled: widget.enabled,
            validator: (value) {
              setState(() => statusValided = StatusTextField.valided);
              if(widget.validator == false)return null;
              
              if (value!.isEmpty) {
                setState(() => statusValided = StatusTextField.errorFieldRequired);
                return '';
              }
              if (!isEmail(value.trim()) && widget.typeInput==TypeSimpleInput.EMAIL) {
                setState(() => statusValided = StatusTextField.emailIsInvalid);
                return '';
              }
              return null;
            },
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              height: 1.9,
              color: InputUtils.getColorText(enabled: widget.enabled!, typInputText: null)
            ),
            cursorHeight: AppDefaultFontSize.cursorHeight,
            onChanged: (value) {
              if(widget.onChange != null){
                widget.onChange!(value);
              }
              if (!isEmail(value.trim()) && widget.typeInput==TypeSimpleInput.EMAIL) {
                setState(() => statusValided = StatusTextField.emailIsInvalid);
              }else{
                setState(() => statusValided = StatusTextField.valided);
              }
            },
            onFieldSubmitted: widget.onFieldSubmitted,
            inputFormatters: defineTypeformatters(widget.typeInput),
            keyboardType: defineTypeInput(widget.typeInput),
            textCapitalization: widget.textCapitalization,
            textInputAction: kIsWeb ? TextInputAction.none : TextInputAction.done,
            decoration: inputThemeDecoration(
              context,
              statusTextField: statusValided,
              hintText: widget.hintText,
              title: widget.title,
              prefix: widget.prefix
            )
          )
        ),
        if(statusValided != StatusTextField.valided)
          TextErrorMessageWidget(statusTextField: statusValided)
      ]
    );
  }
  
  TextInputType? defineTypeInput(TypeSimpleInput? typeInput){
    if(typeInput == null)return widget.keyboardType;
    if(typeInput == TypeSimpleInput.EMAIL)return TextInputType.emailAddress;
    if(typeInput == TypeSimpleInput.DEFAULT)return TextInputType.text;
    return TextInputType.number;
  }
  List<TextInputFormatter>? defineTypeformatters(TypeSimpleInput? typeInput){
    if(typeInput == TypeSimpleInput.CPF){
      return [
        FilteringTextInputFormatter.digitsOnly,
        CpfInputFormatter()
      ];
    }
    else if(typeInput == TypeSimpleInput.CNPJ){
      return [
        FilteringTextInputFormatter.digitsOnly,
        CnpjInputFormatter()
      ];
    }
    else if(typeInput == TypeSimpleInput.CPFCNPJ){
      return [
        FilteringTextInputFormatter.digitsOnly,
        // CpfCnpjInputFormatter()
      ];
    }
    else if(typeInput == TypeSimpleInput.CEP){
      return [
        FilteringTextInputFormatter.digitsOnly,
        CepInputFormatter()
      ];
    }
    else if(typeInput == TypeSimpleInput.BR_TEL){
      return [
        FilteringTextInputFormatter.digitsOnly,
        BrtelefoneInputFormatter()
      ];
    }
    else if(typeInput == TypeSimpleInput.CREDIT_CARD){
      return [
        FilteringTextInputFormatter.digitsOnly,
        CreditCardFormatter()
      ];
    }
    else if(typeInput == TypeSimpleInput.MMYY){
      return [
        FilteringTextInputFormatter.digitsOnly,
        MMYYFormatter()
      ];
    }else if(typeInput == TypeSimpleInput.MMYYYY){
      return [
        FilteringTextInputFormatter.digitsOnly,
        MMYYYYFormatter()
      ];
    }else if(typeInput == TypeSimpleInput.DATE){
      return [
        FilteringTextInputFormatter.digitsOnly,
        DATEFormatter()
      ];
    }else if(typeInput == TypeSimpleInput.TIME){
      return [
        FilteringTextInputFormatter.digitsOnly,
        TIMEFormatter()
      ];
    }
    else if(typeInput == TypeSimpleInput.CURRENCY){
      return [
        FilteringTextInputFormatter.digitsOnly,
        CurrencyInputFormatter(showprefix: true)
      ];
    }
    else if(typeInput == TypeSimpleInput.DOUBLE){
      return [
        FilteringTextInputFormatter.digitsOnly,
        CurrencyInputFormatter(showprefix: false)
      ];
    }
    else if(typeInput == TypeSimpleInput.CVV){
      return [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(3),
      ];
    }else {
      return widget.inputFormatters;
    }
  }
}

