String cutString(String text, {int maxLength = 8}) {
  if (text.length <= maxLength) {
    return text;
  }

  return text.substring(0, maxLength);
}
