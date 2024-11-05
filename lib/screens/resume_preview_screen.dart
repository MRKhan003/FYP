import 'package:ai_resume_reach/authentications/signin_screen.dart';
import 'package:ai_resume_reach/global_lists/education_list.dart';
import 'package:ai_resume_reach/global_lists/experience_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ResumePreviewScreen extends StatefulWidget {
  String name,
      title,
      email,
      descrition,
      experience,
      education,
      number,
      certifications,
      portfolio;
  ResumePreviewScreen({
    required this.name,
    required this.title,
    required this.descrition,
    required this.experience,
    required this.education,
    required this.number,
    required this.certifications,
    required this.portfolio,
    required this.email,
  });

  @override
  State<ResumePreviewScreen> createState() => _ResumePreviewScreenState();
}

class _ResumePreviewScreenState extends State<ResumePreviewScreen> {
  Future<pw.Document> _createPdf() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Text(
                widget.name,
                style: pw.TextStyle(
                  fontSize: 24,
                  fontBold: pw.Font.timesBold(),
                ),
              ),
              pw.Text(
                widget.title,
                style: pw.TextStyle(
                  fontSize: 18,
                ),
              ),
              pw.Text(
                '${widget.email} | ${widget.number}',
                style: pw.TextStyle(),
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
                  widget.descrition,
                  style: pw.TextStyle(),
                  maxLines: 4,
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
              pw.Container(
                alignment: pw.Alignment.topLeft,
                padding: pw.EdgeInsets.only(
                  left: 20,
                  bottom: 10,
                ),
                child: pw.Text(
                  widget.certifications,
                  style: pw.TextStyle(),
                  maxLines: 10,
                ),
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
                  widget.portfolio,
                  style: pw.TextStyle(),
                  maxLines: 1,
                ),
              ),
              pw.SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
    return pdf;
  }

  // Method to show PDF preview and download
  void _downloadResume(BuildContext context) async {
    final pdf = await _createPdf();
    await Printing.layoutPdf(
      name: 'Resume',
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text("Preview Resume"),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.name,
              style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              widget.title,
              style: GoogleFonts.poppins(fontSize: 18, color: Colors.black),
            ),
            Text(
              '${widget.email} | ${widget.number}',
              style: GoogleFonts.poppins(color: Colors.black),
            ),
            SizedBox(height: 30),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(
                10,
              ),
              child: Text(
                'Introduction',
                style:
                    GoogleFonts.poppins(fontSize: 18, color: Color(0xff325372)),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                left: 20,
                bottom: 10,
              ),
              child: Text(
                widget.descrition,
                style: GoogleFonts.poppins(color: Colors.black),
                maxLines: 4,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(
                10,
              ),
              child: Text(
                'Past and Present Experience',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Color(0xff325372),
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: ExperienceList.companyName.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      bottom: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ExperienceList.jobTitle[index],
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          ExperienceList.companyName[index],
                          style: GoogleFonts.poppins(color: Colors.black),
                        ),
                        Text(
                          ExperienceList.location[index],
                          style: GoogleFonts.poppins(color: Colors.black),
                        ),
                        Text(
                          ExperienceList.timePeriod[index],
                          style: GoogleFonts.poppins(color: Colors.black),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(
                10,
              ),
              child: Text(
                'Certification',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Color(0xff325372),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                left: 20,
                bottom: 10,
              ),
              child: Text(
                widget.certifications,
                style: GoogleFonts.poppins(color: Colors.black),
                maxLines: 10,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(
                10,
              ),
              child: Text(
                'Education',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Color(0xff325372),
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: EducationList.institute.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      bottom: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          EducationList.level[index],
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          EducationList.institute[index],
                          style: GoogleFonts.poppins(color: Colors.black),
                        ),
                        Text(
                          EducationList.grade[index],
                          style: GoogleFonts.poppins(color: Colors.black),
                        ),
                        Text(
                          EducationList.time[index],
                          style: GoogleFonts.poppins(color: Colors.black),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(
                10,
              ),
              child: Text(
                'Portfolio',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Color(0xff325372),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 20, bottom: 10),
              child: Text(
                widget.portfolio,
                style: GoogleFonts.poppins(color: Colors.black),
                maxLines: 1,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary),
              onPressed: () {
                _downloadResume(context);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SigninScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text(
                "Download Resume",
                style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
