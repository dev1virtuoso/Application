String convertToMorseCode(String text) {
  Map<String, String> morseCodeMap = {
    'A': '.-',
    'B': '-...',
    'C': '-.-.',
    'D': '-..',
    'E': '.',
    'F': '..-.',
    'G': '--.',
    'H': '....',
    'I': '..',
    'J': '.---',
    'K': '-.-',
    'L': '.-..',
    'M': '--',
    'N': '-.',
    'O': '---',
    'P': '.--.',
    'Q': '--.-',
    'R': '.-.',
    'S': '...',
    'T': '-',
    'U': '..-',
    'V': '...-',
    'W': '.--',
    'X': '-..-',
    'Y': '-.--',
    'Z': '--..'
  };

  String uppercasedText = text.toUpperCase();
  String result = '';

  for (int i = 0; i < uppercasedText.length; i++) {
    String char = uppercasedText[i];
    if (morseCodeMap.containsKey(char)) {
      result += '${morseCodeMap[char]!} ';
    } else {
      result += ' ';
    }
  }

  return result;
}
