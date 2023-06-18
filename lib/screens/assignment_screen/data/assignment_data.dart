class AssignmentData {
  final String subjectName;
  final String topicName;
  final String assignDate;
  final String lastDate;
  final String status;

  AssignmentData(this.subjectName, this.topicName, this.assignDate,
      this.lastDate, this.status);
}

List<AssignmentData> assignment = [
  AssignmentData(
      'Bitoloj,', 'Kırmızı Kan Hücreleri', '17 Nov 2021', '20 Nov 2021', 'Bekleniyor'),
  AssignmentData('Fizik', 'Bohr Teorisi', '11 Nov 2021', '20 Nov 2021', 'Gönderildi'),
  AssignmentData('Kimya', 'Organik Kimya', '21 Oct 2021', '27 Oct 2021', 'Gönderilmedi'),
  AssignmentData('Matematik', 'Cebir', '17 Sep 2021', '30 Sep 2021', 'Bekleniyor'),
];
