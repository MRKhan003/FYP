import 'package:ai_resume_reach/global_lists/certification_list.dart';
import 'package:ai_resume_reach/global_lists/education_list.dart';
import 'package:ai_resume_reach/global_lists/experience_list.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfDownload {
  Future<pw.Document> _createPdf(
    String name,
    String title,
    String email,
    String description,
    String experience,
    String education,
    String number,
    String certifications,
    String portfolio,
  ) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        build: (pw.Context context) => [
          pw.Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              pw.Center(
                child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Text(
                      name,
                      style: pw.TextStyle(
                        fontSize: 24,
                        fontBold: pw.Font.timesBold(),
                      ),
                    ),
                    pw.Text(
                      title,
                      style: pw.TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    pw.Text(
                      '${email} | ${number}',
                      style: pw.TextStyle(),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 30),
              pw.Container(
                alignment: pw.Alignment.topLeft,
                padding: pw.EdgeInsets.all(
                  10,
                ),
                child: pw.Text(
                  'Introduction',
                  style: pw.TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              pw.Container(
                alignment: pw.Alignment.topLeft,
                padding: pw.EdgeInsets.only(
                  left: 20,
                  bottom: 10,
                ),
                child: pw.Text(
                  description,
                  style: pw.TextStyle(),
                  maxLines: 6,
                ),
              ),
              pw.Container(
                alignment: pw.Alignment.topLeft,
                padding: pw.EdgeInsets.all(
                  10,
                ),
                child: pw.Text(
                  'Past and Present Experience',
                  style: pw.TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              pw.ListView.builder(
                itemCount: ExperienceList.companyName.length,
                itemBuilder: (context, index) {
                  return pw.Padding(
                    padding: pw.EdgeInsets.only(
                      bottom: 20,
                      //right: 100,
                    ),
                    child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Container(
                          alignment: pw.Alignment.centerLeft,
                          padding: pw.EdgeInsets.only(
                            left: 20,
                          ),
                          child: pw.Text(
                            ExperienceList.jobTitle[index],
                            textAlign: pw.TextAlign.left,
                            style: pw.TextStyle(
                              fontSize: 16,
                              fontBold: pw.Font.times(),
                            ),
                          ),
                        ),
                        pw.Container(
                          alignment: pw.Alignment.centerLeft,
                          padding: pw.EdgeInsets.only(
                            left: 20,
                          ),
                          child: pw.Text(
                            ExperienceList.companyName[index],
                          ),
                        ),
                        pw.Container(
                          alignment: pw.Alignment.centerLeft,
                          padding: pw.EdgeInsets.only(
                            left: 20,
                          ),
                          child: pw.Text(
                            ExperienceList.location[index],
                          ),
                        ),
                        pw.Container(
                          alignment: pw.Alignment.centerLeft,
                          padding: pw.EdgeInsets.only(
                            left: 20,
                          ),
                          child: pw.Text(
                            ExperienceList.timePeriod[index],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              pw.Container(
                alignment: pw.Alignment.topLeft,
                padding: pw.EdgeInsets.all(
                  10,
                ),
                child: pw.Text(
                  'Certification',
                  style: pw.TextStyle(fontSize: 18),
                ),
              ),
              pw.ListView.builder(
                itemCount: CertificationList.instituteName.length,
                itemBuilder: (context, index) {
                  return pw.Padding(
                    padding: pw.EdgeInsets.only(
                      bottom: 20,
                      //right: 100,
                    ),
                    child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Container(
                          alignment: pw.Alignment.centerLeft,
                          padding: pw.EdgeInsets.only(
                            left: 20,
                          ),
                          child: pw.Text(
                            CertificationList.titles[index],
                            textAlign: pw.TextAlign.left,
                            style: pw.TextStyle(
                              fontSize: 16,
                              fontBold: pw.Font.times(),
                            ),
                          ),
                        ),
                        pw.Container(
                          alignment: pw.Alignment.centerLeft,
                          padding: pw.EdgeInsets.only(
                            left: 20,
                          ),
                          child: pw.Text(
                            CertificationList.instituteName[index],
                          ),
                        ),
                        pw.Container(
                          alignment: pw.Alignment.centerLeft,
                          padding: pw.EdgeInsets.only(
                            left: 20,
                          ),
                          child: pw.Text(
                            CertificationList.dates[index],
                          ),
                        ),
                        pw.Container(
                          alignment: pw.Alignment.centerLeft,
                          padding: pw.EdgeInsets.only(
                            left: 20,
                          ),
                          child: pw.Text(
                            CertificationList.credentials[index],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              pw.Container(
                alignment: pw.Alignment.topLeft,
                padding: pw.EdgeInsets.all(
                  10,
                ),
                child: pw.Text(
                  'Education',
                  style: pw.TextStyle(fontSize: 18),
                ),
              ),
              pw.ListView.builder(
                itemCount: EducationList.institute.length,
                itemBuilder: (context, index) {
                  return pw.Padding(
                    padding: pw.EdgeInsets.only(
                      bottom: 20,
                      //right: 100,
                    ),
                    child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Container(
                          alignment: pw.Alignment.centerLeft,
                          padding: pw.EdgeInsets.only(
                            left: 20,
                          ),
                          child: pw.Text(
                            EducationList.level[index],
                            textAlign: pw.TextAlign.left,
                            style: pw.TextStyle(
                              fontSize: 16,
                              fontBold: pw.Font.times(),
                            ),
                          ),
                        ),
                        pw.Container(
                          alignment: pw.Alignment.centerLeft,
                          padding: pw.EdgeInsets.only(
                            left: 20,
                          ),
                          child: pw.Text(
                            EducationList.institute[index],
                          ),
                        ),
                        pw.Container(
                          alignment: pw.Alignment.centerLeft,
                          padding: pw.EdgeInsets.only(
                            left: 20,
                          ),
                          child: pw.Text(
                            EducationList.grade[index],
                          ),
                        ),
                        pw.Container(
                          alignment: pw.Alignment.centerLeft,
                          padding: pw.EdgeInsets.only(
                            left: 20,
                          ),
                          child: pw.Text(
                            EducationList.time[index],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              pw.Container(
                alignment: pw.Alignment.topLeft,
                padding: pw.EdgeInsets.all(
                  10,
                ),
                child: pw.Text(
                  'Portfolio',
                  style: pw.TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              pw.Container(
                alignment: pw.Alignment.topLeft,
                padding: pw.EdgeInsets.only(left: 20, bottom: 10),
                child: pw.Text(
                  portfolio,
                  style: pw.TextStyle(),
                  maxLines: 1,
                ),
              ),
              pw.SizedBox(
                height: 30,
              ),
            ],
          ),
        ],
      ),
    );

    return pdf;
  }

  // Method to show PDF preview and download
  void downloadResume(
    BuildContext context,
    String name,
    String title,
    String email,
    String description,
    String experience,
    String education,
    String number,
    String certifications,
    String portfolio,
  ) async {
    final pdf = await _createPdf(
      name,
      title,
      email,
      description,
      experience,
      education,
      number,
      certifications,
      portfolio,
    );
    await Printing.layoutPdf(
      name: 'Resume',
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}
