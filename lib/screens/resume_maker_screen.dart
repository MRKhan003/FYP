import 'package:ai_resume_reach/controllers/resume_controller.dart';
import 'package:ai_resume_reach/database/firebase_storage_functions.dart';
import 'package:ai_resume_reach/global_lists/certification_list.dart';
import 'package:ai_resume_reach/global_lists/education_list.dart';
import 'package:ai_resume_reach/global_lists/experience_list.dart';
import 'package:ai_resume_reach/pdf_functions/pdf_download.dart';
import 'package:ai_resume_reach/screens/home_screen.dart';
import 'package:ai_resume_reach/widgets/certificate_section_widget.dart';
import 'package:ai_resume_reach/widgets/education_section_widget.dart';
import 'package:ai_resume_reach/widgets/experience_section_widget.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResumeMakerScreen extends StatefulWidget {
  const ResumeMakerScreen({super.key});

  @override
  State<ResumeMakerScreen> createState() => _ResumeMakerScreenState();
}

class _ResumeMakerScreenState extends State<ResumeMakerScreen> {
  ResumeController resumeController = ResumeController();
  List<String> companyName = [];
  List<String> workingTime = [];
  List<String> location = [];
  List<String> jobType = [];
  int index = 1, index1 = 1, index2 = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Image.asset(
          'assets/appLogo.png',
          height: 50,
          width: 50,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Theme.of(context).colorScheme.surface,
      ),
      body: SingleChildScrollView(
        child: DoubleBackToCloseApp(
          snackBar: SnackBar(
            content: Text(
              'Back again to close app',
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                child: Text(
                  'Please fill all fields',
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'General Info Section',
                    style: GoogleFonts.poppins(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  controller: resumeController.nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: GoogleFonts.poppins(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  controller: resumeController.titleController,
                  keyboardType: TextInputType.name,
                  maxLength: 30,
                  decoration: InputDecoration(
                    labelText: 'Job title',
                    labelStyle: GoogleFonts.poppins(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  controller: resumeController.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: GoogleFonts.poppins(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  controller: resumeController.phoneNumberController,
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: GoogleFonts.poppins(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  controller: resumeController.descriptionController,
                  keyboardType: TextInputType.multiline,

                  maxLines: 3,

                  // maxLength: 100,
                  decoration: InputDecoration(
                    labelText: 'Introduction',
                    labelStyle: GoogleFonts.poppins(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Experience Section',
                    style: GoogleFonts.poppins(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: index,
                  itemBuilder: (context, index) => ExperienceSectionWidget(
                    index: index,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    index++;
                  });
                },
                child: Text(
                  'Add more',
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                iconAlignment: IconAlignment.end,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Education Section',
                    style: GoogleFonts.poppins(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: index1,
                  itemBuilder: (context, index) => EducationSectionWidget(
                    index: index,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    index1++;
                  });
                },
                child: Text(
                  'Add more',
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                iconAlignment: IconAlignment.end,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Certification Section',
                    style: GoogleFonts.poppins(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: index2,
                  itemBuilder: (context, index) => CertificateSectionWidget(),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    index2++;
                  });
                },
                child: Text(
                  'Add more',
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                iconAlignment: IconAlignment.end,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Links Section',
                    style: GoogleFonts.poppins(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  controller: resumeController.portfolioController,
                  keyboardType: TextInputType.text,

                  maxLines: 1,

                  // maxLength: 100,
                  decoration: InputDecoration(
                    labelText: 'Portfolio',
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () {
                          PdfDownload().downloadResume(
                            context,
                            resumeController.nameController.text,
                            resumeController.titleController.text,
                            resumeController.emailController.text,
                            resumeController.descriptionController.text,
                            resumeController.experienceController.text,
                            resumeController.educationController.text,
                            resumeController.phoneNumberController.text,
                            resumeController.certificateController.text,
                            resumeController.portfolioController.text,
                          );
                          FirebaseStorageFunctions().sendResumeData(
                            resumeController.nameController.text,
                            resumeController.emailController.text,
                            resumeController.phoneNumberController.text,
                            resumeController.portfolioController.text,
                            resumeController.descriptionController.text,
                            ExperienceList.companyName,
                            ExperienceList.jobTitle,
                            ExperienceList.timePeriod,
                            ExperienceList.location,
                            EducationList.institute,
                            EducationList.level,
                            EducationList.level,
                            EducationList.grade,
                            CertificationList.instituteName,
                            CertificationList.titles,
                            CertificationList.dates,
                            CertificationList.credentials,
                          );
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                            (Route<dynamic> route) => false,
                          );
                        },
                        child: Text(
                          'Submit',
                          style: GoogleFonts.poppins(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
