import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_model.freezed.dart';
part 'document_model.g.dart';

@freezed
class DocumentModel with _$DocumentModel {

  const factory DocumentModel({
    required String fileName,
    required String filePath,
    required DateTime uploadDate,
    required DocumentType documentType,
    required FileLocation fileLocation,
}) = _DocumentModel;

  factory DocumentModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentModelFromJson(json);
}

enum DocumentType {resume,coverLetter}
enum FileLocation {network,local}