class DataSheet {
  final int date;
  final String monthName;
  final String subjectName;
  final String dayName;
  final String time;

  DataSheet(
      this.date, this.monthName, this.subjectName, this.dayName, this.time);
}

List<DataSheet> dateSheet = [
  DataSheet(11, 'JAN', 'Bilgisayar Bilimi', 'Pazartesi', '9:00'),
  DataSheet(12, 'JAN', 'Biyoloji', 'Salı', '10:00'),
  DataSheet(13, 'JAN', 'Kimya', 'Çarşamba', '9:30'),
  DataSheet(14, 'JAN', 'Fizik', 'Perşembe', '11:00'),
  DataSheet(15, 'JAN', 'Matematik', 'Cuma', '9:00'),
  DataSheet(16, 'JAN', 'Resim', 'Cumartesi', '11:00'),
];
