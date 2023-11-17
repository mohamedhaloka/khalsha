class LaboratoryData {
  final int id;
  final String title, testReport, factoryAudit, notes, certificates;

  final List<String> certificate,
      itemServiceId,
      customsCode,
      factoryName,
      photoCard,
      photoItem,
      nameAr,
      nameEn;

  const LaboratoryData({
    required this.id,
    required this.notes,
    required this.photoItem,
    required this.photoCard,
    required this.customsCode,
    required this.nameEn,
    required this.nameAr,
    required this.itemServiceId,
    required this.title,
    required this.certificate,
    required this.factoryName,
    required this.certificates,
    required this.factoryAudit,
    required this.testReport,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'test_report': testReport.isEmpty ? 'no' : 'yes',
        'factory_audit': factoryAudit.isEmpty ? 'no' : 'yes',
        'notes': notes,
        'certificates': certificates,
      };
}
