import 'package:flutter/material.dart';
import 'package:gbc_components/src/utils/colors.dart';
import 'enums.dart';


/// Classe: InputUtils
/// Métodos estáticos úteis para manipulação de estilos e tamanhos em campos de entrada.
/// 
/// Exemplo de uso
/// ```dart
/// // Obter cor do texto
/// Color textColor = InputUtils.getColorText(typInputText: TypInputText.STYLE_MOBILE, enabled: false);
///
/// // Obter cor da borda
/// Color borderColor = InputUtils.getColorBorder(statusValided: StatusTextField.valided, typInputText: TypInputText.STYLE_MOBILE, enabled: true);
///
/// // Definir tamanho
/// double inputSize = InputUtils.defineSize(SizeInput.lg);
/// 
/// ```

class InputUtils {
  /// Método: getColorText
  /// Descrição: Retorna a cor do texto com base no tipo de entrada e na habilitação do campo.
  /// Parâmetros:
  ///   - `typInputText` (opcional): Tipo de entrada de texto (por exemplo, STYLE_MOBILE).
  ///   - `enabled` (opcional, padrão: false): Indica se o campo está habilitado.
  /// Retorno: Cor do texto.
  static Color getColorText({required TypeSimpleInput? typInputText, bool? enabled = false}) {
    if (enabled == false) {
    // if (typInputText == TypeSimpleInput.STYLE_MOBILE && enabled == false) {
      return AppDefaultColor.ti03Color;
    }
    return AppDefaultColor.ti00Color;
  }

  /// Método: getColorBorder
  /// Descrição: Retorna a cor da borda com base no status de validação, no tipo de entrada e na habilitação do campo.
  /// Parâmetros:
  ///   - `statusValided` (obrigatório): Status de validação do campo (por exemplo, validado).
  ///   - `typInputText` (opcional): Tipo de entrada de texto (por exemplo, STYLE_MOBILE).
  ///   - `enabled` (opcional, padrão: false): Indica se o campo está habilitado.
  /// Retorno: Cor da borda.
  static Color getColorBorder({required StatusTextField statusValided, TypeSimpleInput? typInputText, bool? enabled = false}) {
    if (statusValided != StatusTextField.valided) return AppDefaultColor.erroColor;

    if (enabled == false) {
      return AppDefaultColor.ti04Color;
    }
    if (enabled == true) {
      return AppDefaultColor.ti04Color;
    }
    return AppDefaultColor.ti05Color;
  }

  /// Método: defineSize
  /// Descrição: Define o tamanho com base no tipo de entrada.
  /// Parâmetros:
  ///   - `size` (opcional): Tamanho da entrada (por exemplo, lg para grande).
  /// Retorno: Tamanho definido.
  static double defineSize(SizeInput? size) {
    if (size == SizeInput.lg) return 52;
    return 42;
  }

  /// Método: getTextMessageError
  /// Descrição: Retorna a mensagem de erro correspondente ao status do campo de texto.
  /// Parâmetros:
  ///   - `textFieldStatus` (obrigatório): Status do campo de texto.
  /// Retorno: Mensagem de erro correspondente ao status do campo de texto.
  static String getTextMessageError(StatusTextField textFieldStatus) {
    switch (textFieldStatus) {
      case StatusTextField.stateDef:
        return '';
      case StatusTextField.valided:
        return '';
      case StatusTextField.desabilitado:
        return '';
      case StatusTextField.errorFieldRequired:
        return 'Campo não pode estar vazio!';
      case StatusTextField.error:
        return 'Entrada inválida';
      case StatusTextField.nameAndSobrename:
        return 'Digite o nome completo';
      case StatusTextField.cpfIsInvalid:
        return 'CPF inválido';
      case StatusTextField.nameIsEmpty:
        return 'Nome está vazio';
      case StatusTextField.cpfIsEmpty:
        return 'CPF está vazio';
      case StatusTextField.dataNascimentoIsInvalid:
        return 'Data inválida';
      case StatusTextField.emailIsInvalid:
        return 'Email inválido';
      case StatusTextField.celularIsInvalid:
        return 'Celular inválido';
      case StatusTextField.cnpjIsInvalid:
        return 'CNPJ inválido';
      case StatusTextField.peloMenosTresDigitos:
        return 'Digite pelo menos 3 dígitos';
    }
  }


  /// Método: isPhoneNumberValid
  /// Descrição: Verifica se um número de telefone é válido.
  /// Parâmetros:
  ///   - `phone` (obrigatório): Número de telefone a ser verificado.
  /// Retorno: true se o número de telefone for válido, false caso contrário.
  static bool isPhoneNumberValid(String phone) {
    // Verifica se o número de telefone tem pelo menos 11 dígitos
    var phoneNumber = phone.replaceAll(RegExp(r'[^0-9]'), '');
    if (phoneNumber.length < 11) {
      return false;
    }

    // Remove caracteres não numéricos do número de telefone
    final cleanPhoneNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');

    // Verifica se o número de telefone limpo tem exatamente 11 dígitos (padrão para números de telefone no Brasil)
    if (cleanPhoneNumber.length != 11) {
      return false;
    }
    return true;
  }



  /// Método: isDateValid
  /// Descrição: Verifica se uma data é válida.
  /// Parâmetros:
  ///   - `date` (obrigatório): Data a ser verificada no formato "dd/mm/yyyy".
  /// Retorno: true se a data for válida, false caso contrário.
  static bool isDateValid(String date) {
    // Verificar se a data tem o formato correto
    final datePattern = RegExp(r'^\d{2}/\d{2}/\d{4}$');
    if (!datePattern.hasMatch(date)) {
      return false; // A data não corresponde ao formato "dd/mm/yyyy"
    }

    // Separar a data em dia, mês e ano
    List<String> dateParts = date.split('/');
    int? day = int.tryParse(dateParts[0]);
    int? month = int.tryParse(dateParts[1]);
    int? year = int.tryParse(dateParts[2]);

    if (day == null || month == null || year == null) {
      return false; // Não é possível converter os componentes da data em números
    }

    // Verificar se a data é no passado
    final now = DateTime.now();
    final inputDate = DateTime(year, month, day);
    if (inputDate.isAfter(now)) {
      return false; // A data está no futuro
    }

    // Verificar se o mês está dentro do intervalo 1-12
    if (month < 1 || month > 12) {
      return false;
    }

    // Verificar se o dia está dentro do intervalo apropriado para o mês
    if (day < 1 || day > 31) {
      return false;
    }

    // Verificar anos bissextos (fevereiro)
    if (month == 2) {
      if (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) {
        return day <= 29;
      } else {
        return day <= 28;
      }
    }

    // Verificar meses com 30 dias
    if ([4, 6, 9, 11].contains(month)) {
      return day <= 30;
    }

    return true;
  }

  /// Método: limparCNPJ
  /// Descrição: Remove todos os caracteres que não sejam números e Verifica se o CNPJ tem pelo menos 14 dígitos, incluindo os zeros à esquerda.
  /// Parâmetros:
  ///   - `cnpj` (obrigatório): é o cnpj a ser verificado".
  /// Retorno: cnpj sem a formatação.
  static String limparCNPJ(String cnpj) {
    // Remove todos os caracteres que não sejam números
    cnpj = cnpj.replaceAll(RegExp(r'[^0-9]'), '');

    while (cnpj.length < 14) {
      cnpj = '0$cnpj';
    }

    return cnpj;
  }

  String formatCnpj(String cnpj) {
    if (cnpj.length != 14) {
      throw ArgumentError("O CNPJ deve conter 14 dígitos.");
    }

    return "${cnpj.substring(0, 2)}.${cnpj.substring(2, 5)}.${cnpj.substring(5, 8)}/${cnpj.substring(8, 12)}-${cnpj.substring(12)}";
  }

  /// Método: limparCPFeDeixarApenasNumeros
  /// Descrição: Remove todos os caracteres que não sejam números.
  /// Parâmetros:
  ///   - `cpfComFormatacao` (obrigatório): é o cpfComFormatacao a ser verificado".
  /// Retorno: cpf sem a formatação.
  static String limparCPFeDeixarApenasNumeros(String cpfComFormatacao) {
    return cpfComFormatacao.replaceAll(RegExp(r'\D'), '');
  }

  /// Método: getLastNames
  /// Descrição: Pegar o sobrenome de uma string contendo o nome completo.
  /// Parâmetros:
  ///   - `fullName` (obrigatório): é o nomeCompleto a ser verificado".
  /// Retorno: sobrenome.
  static String getLastNames(String fullName){
    var dividir = fullName.split(" ");
    dividir.remove(dividir.first);
    return dividir.join(" ");
  }

  /// Método: formatarDataSendToServer
  /// Descrição: Trocar a formatação da data para enviar para o servidor.
  /// Parâmetros:
  ///   - `dataNoFormatoBR` (obrigatório): é o data a se a ser trocada de formato".
  /// Retorno: data.
  static String formatarDataSendToServer(String dataNoFormatoBR) {
    List<String> partes = dataNoFormatoBR.split("/");

    if (partes.length != 3) {
      return "Data inválida";
    }

    String dia = partes[0];
    String mes = partes[1];
    String ano = partes[2];

    // Certifique-se de que o dia e o mês tenham dois dígitos
    if (dia.length == 1) {
      dia = "0$dia";
    }

    if (mes.length == 1) {
      mes = "0$mes";
    }

    // Reordena as partes da data
    String dataNoFormatoISO = "$ano-$mes-$dia";

    return dataNoFormatoISO;
  }




}
