class ValidatorText {
  static final RegExp emailvalidator = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  static final RegExp phonevalidator =
      RegExp(r'^(?:[+0]9)?[0-9]{5,10}$'); //r'(^(?:[+0]9)?[0-9]{10,12}$
  static final RegExp numbervalidator = RegExp(r'\B(?=(\d{3})+(?!\d))');

  String numberFormatDecimal(double x) {
    List<String> parts = x.toString().split('.');

    parts[0] = parts[0].replaceAll(numbervalidator, '.');
    if (parts.length == 1) {
      parts.add('00');
    } else {
      parts[1] = parts[1].padRight(2, '0').substring(0, 2);
    }
    return parts.join(',');
  }

  String numberFormat(double x) {
    List<String> parts = x.toString().split('.');
    parts[0] = parts[0].replaceAll(numbervalidator, '.');
    return '\$${parts[0].toString()}';
  }
}
