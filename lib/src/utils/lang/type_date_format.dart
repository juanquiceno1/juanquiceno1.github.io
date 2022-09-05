class DateFormat {
  String month(DateTime date) {
    String namemonth = '';
    switch (date.month) {
      case 1:
        namemonth = 'Enero';
        break;
      case 2:
        namemonth = 'Febrero';
        break;
      case 3:
        namemonth = 'Marzo';
        break;
      case 4:
        namemonth = 'Abril';
        break;
      case 5:
        namemonth = 'Mayo';
        break;
      case 6:
        namemonth = 'Junio';
        break;
      case 7:
        namemonth = 'Julio';
        break;
      case 8:
        namemonth = 'Agosto';
        break;
      case 9:
        namemonth = 'Septiembre';
        break;
      case 10:
        namemonth = 'Octubre';
        break;
      case 11:
        namemonth = 'Noviembre';
        break;
      case 12:
        namemonth = 'Diciembre';
        break;
    }
    return '${namemonth.substring(0, 3)} ${date.year}';
  }
}
