import 'package:flutter/material.dart';
import 'package:job_box/src/core/common/models/document_model.dart';
import 'package:job_box/src/features/jobs/presentation/job_application_process/widgets/documents_view.dart';

class UploadDocumentView extends StatefulWidget {
  const UploadDocumentView({
    Key? key,
  }) : super(key: key);

  @override
  State<UploadDocumentView> createState() => _UploadDocumentViewState();
}

class _UploadDocumentViewState extends State<UploadDocumentView> {
  List<DocumentModel> resumes = [];
  List<DocumentModel> coverLetters = [];

  DocumentModel? selectedResume;
  DocumentModel? selectedCoverLetter;

  @override
  void initState() {
    resumes.add(DocumentModel(
        fileName: "My Resume.pdf",
        filePath: "filePath",
        uploadDate: DateTime(21023, 12, 14),
        documentType: DocumentType.resume,
        fileLocation: FileLocation.network));
    coverLetters.add(DocumentModel(
        fileName: "My CoverLetter.pdf",
        filePath: "filePath",
        uploadDate: DateTime(21023, 12, 14),
        documentType: DocumentType.coverLetter,
        fileLocation: FileLocation.network));

    selectedResume = resumes.first;
    selectedCoverLetter = coverLetters.first;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        DocumentsView(
          documentType: DocumentType.resume,
          documents: resumes,
          onFileAdded: (document) {
            resumes.insert(0, document);
            selectedResume = resumes.first;
            setState(() {});
          },
          onDocumentSelected: (document) {
            selectedResume = document;
            setState(() {

            });
          },
          selectedDocument: selectedResume!,
        ),
        const SizedBox(
          height: 24,
        ),
        DocumentsView(
          documentType: DocumentType.coverLetter,
          documents: coverLetters,
          onFileAdded: (document) {
            coverLetters.insert(0, document);
            selectedCoverLetter = coverLetters.first;
            setState(() {});
          },
          onDocumentSelected: (document) {
            selectedCoverLetter = document;
            setState(() {

            });
          },
          selectedDocument: selectedCoverLetter!,
        ),
      ],
    );
  }
}
