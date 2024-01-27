// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DocumentModelImpl _$$DocumentModelImplFromJson(Map<String, dynamic> json) =>
    _$DocumentModelImpl(
      fileName: json['fileName'] as String,
      filePath: json['filePath'] as String,
      uploadDate: DateTime.parse(json['uploadDate'] as String),
      documentType: $enumDecode(_$DocumentTypeEnumMap, json['documentType']),
      fileLocation: $enumDecode(_$FileLocationEnumMap, json['fileLocation']),
    );

Map<String, dynamic> _$$DocumentModelImplToJson(_$DocumentModelImpl instance) =>
    <String, dynamic>{
      'fileName': instance.fileName,
      'filePath': instance.filePath,
      'uploadDate': instance.uploadDate.toIso8601String(),
      'documentType': _$DocumentTypeEnumMap[instance.documentType]!,
      'fileLocation': _$FileLocationEnumMap[instance.fileLocation]!,
    };

const _$DocumentTypeEnumMap = {
  DocumentType.resume: 'resume',
  DocumentType.coverLetter: 'coverLetter',
};

const _$FileLocationEnumMap = {
  FileLocation.network: 'network',
  FileLocation.local: 'local',
};
