class FeeData {
  final String receiptNo;
  final String month;
  final String date;
  final String paymentStatus;
  final String totalAmount;
  final String btnStatus;

  FeeData(this.receiptNo, this.month, this.date, this.paymentStatus,
      this.totalAmount, this.btnStatus);
}

List<FeeData> fee = [
  FeeData('90871', 'Ekim', '8 Nov 2020', 'Beklemede', '980\$', 'Şimdi Öde'),
  FeeData('90870', 'Eylül', '8 Sep 2020', 'Ödendi', '1080\$', 'Dekont'),
  FeeData('908869', 'Ağustos', '8 Aug 2020', 'Ödendi', '950\$', 'Dekont'),
];
