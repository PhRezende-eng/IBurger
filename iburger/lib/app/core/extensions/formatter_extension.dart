extension T on double {
  // install package intl
  // String get currencyPTBR {
  //   final currencyFormatter = NumberFormat.currency(
  //     localr: 'pt_BR',
  //     symbol: r'R$ ',
  //   );
  //   return currencyFormatter.format(this);
  // }

  String get currencyPTBR {
    String ptbrPrice = r'R$ ';
    ptbrPrice += toStringAsFixed(2);
    ptbrPrice = ptbrPrice.replaceFirst('.', ',');

    return ptbrPrice;
  }
}
