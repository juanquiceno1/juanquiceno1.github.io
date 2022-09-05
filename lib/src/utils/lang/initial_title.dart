class InitialTitle {
  // Permite sacar las iniciales de un texto
  // Mi ejecutico de cuenta ==>> MEC <<==
  String initial(String title) {
    int sucess = 0;
    List<String> splits = [];
    String result = '';
    splits = title.split(' ');
    for (var i = 0; i < splits.length; i++) {
      if (i == 0) {
        result += splits[i][0];
      } else if (splits[i].length > 3 && sucess < 1) {
        sucess++;
        result += splits[i][0];
      }
    }
    return result.toUpperCase();
  }
}
