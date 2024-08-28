// Buttons
// ignore_for_file: constant_identifier_names

enum TypeButton {primary, secondary, cancel}
enum SizeButton {lg, md}

// Input
enum SizeInput {lg, md}


enum StatusTextField {
  stateDef,
  valided,
  errorFieldRequired,
  error,
  nameAndSobrename,
  nameIsEmpty,
  cpfIsEmpty,
  cpfIsInvalid,
  cnpjIsInvalid,
  dataNascimentoIsInvalid,
  emailIsInvalid,
  celularIsInvalid,
  desabilitado,
  peloMenosTresDigitos
}

enum TypeSimpleInput {
  DEFAULT,
  PASSWORD,
  EMAIL,
  NUMBER,
  CURRENCY,
  DOUBLE,

  // brasil
  CPF,
  CNPJ,
  CPFCNPJ,
  CEP,
  BR_TEL,
  CREDIT_CARD,
  MMYY,
  MMYYYY,
  DATE,
  CVV,
  TIME
}

enum DialogColorType {
  DEFAULT,
  DANGER,
  SUCESS,
  INFO,
  WARNING
}

enum DialogPosition {
  TOP,
  BOTTOM
}