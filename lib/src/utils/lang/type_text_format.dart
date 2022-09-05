class TextFormart {
  
  String capitalize(String s) {
    try {
      return s[0].toUpperCase() + s.substring(1).toLowerCase();
    } catch (e) {
      return '';
    }
  } 
}