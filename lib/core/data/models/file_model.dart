import 'dart:io';

class FileModel {
  final File file;
  final String type;
  final int? id;
  FileModel({
    required this.file,
    this.id,
    this.type = 'image',
  });
}
