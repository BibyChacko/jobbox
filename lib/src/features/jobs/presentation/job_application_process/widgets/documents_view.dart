import 'dart:io';

import 'package:flutter/material.dart';
import 'package:job_box/src/core/common/models/document_model.dart';
import 'package:job_box/src/core/constants/strings.dart';
import 'package:job_box/src/core/helpers/dialog_helper.dart';
import 'package:job_box/src/core/helpers/resource_helper.dart';

import 'add_document_header_view.dart';
import 'document_list_item_view.dart';

class DocumentsView extends StatefulWidget {
  final DocumentType documentType;
  final List<DocumentModel> documents;
  final Function(DocumentModel) onFileAdded;
  final Function(DocumentModel) onDocumentSelected;
  final DocumentModel selectedDocument;

  const DocumentsView({
    Key? key,
    required this.documentType,
    required this.documents,
    required this.onFileAdded,
    required this.onDocumentSelected,
    required this.selectedDocument,
  }) : super(key: key);

  @override
  State<DocumentsView> createState() => _DocumentsViewState();
}

class _DocumentsViewState extends State<DocumentsView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddDocumentHeaderView(
            title: widget.documentType == DocumentType.resume
                ? Strings.resume
                : Strings.coverLetter,
            subTitle: widget.documentType == DocumentType.resume
                ? Strings.resumeSubText
                : Strings.coverLetterSubText,
            onDocumentAddAction: () async {
              DocumentModel? document = await _addDocument(context);
              if (document == null) {
                return;
              }
              widget.onFileAdded(document);
            }),
        Column(
          children: widget.documents
              .map((document) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: DocumentListItemView(
                      documentModel: document,
                      isSelected: document == widget.selectedDocument,
                      onSelected: () {
                        widget.onDocumentSelected(document);
                      },
                    ),
                  ))
              .toList(),
        )
      ],
    );
  }

  Future<DocumentModel?> _addDocument(BuildContext context) async {
    File? file = await ResourceHelper.pickFile();
    if (file == null) {
      DialogHelper.showToast(Strings.errorReadingFile);
      return null;
    }
    String filePath = file.path;
    return DocumentModel(
        fileName: filePath.split("/").last,
        filePath: filePath,
        uploadDate: DateTime.now(),
        documentType: widget.documentType,
        fileLocation: FileLocation.local);
  }
}
