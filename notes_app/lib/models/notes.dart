class Notes {
  final String id;
  final String title;
  final String? notes;
  final DateTime modified_at;
  final bool isArchived;
  final bool isDeleted;

  Notes({
    required this.id,
    required this.title,
    required this.notes,
    required this.modified_at,
    this.isArchived = false,
    this.isDeleted = false,
  });
}
