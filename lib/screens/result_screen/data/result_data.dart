class ResultData {
  final String subjectName;
  final int totalMarks;
  final int obtainedMarks;
  final String grade;
  
  ResultData(
      this.subjectName,
      this.totalMarks,
      this.obtainedMarks,
      this.grade
      );
}

List<ResultData> result = [
  ResultData(
      'İngilizce',
      100,
      98,
      'A'
  ),
  ResultData(
      'Bilgisayar Bilimi',
      100,
      50,
      'D'
  ),
  ResultData(
      'Fizik',
      100,
      89,
      'B'
  ),
  ResultData(
      'Kimya',
      100,
      79,
      'B'
  ),
  ResultData(
      'Matematik',
      100,
      89,
      'B'
  ),
  ResultData(
      'Resim',
      100,
      69,
      'B'
  ),
  ResultData(
      'Veri Bilimi',
      100,
      100,
      'A'
  )
  
];