import 'package:ai_resume_reach/controllers/certificate_controller.dart';
import 'package:ai_resume_reach/global_lists/certification_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CertificateSectionWidget extends StatefulWidget {
  const CertificateSectionWidget({super.key});

  @override
  State<CertificateSectionWidget> createState() =>
      _CertificateSectionWidgetState();
}

class _CertificateSectionWidgetState extends State<CertificateSectionWidget> {
  CertificateController certificateController = CertificateController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            style: GoogleFonts.poppins(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            controller: certificateController.instituteController,
            keyboardType: TextInputType.text,

            maxLines: 1,

            // maxLength: 100,
            decoration: InputDecoration(
                labelText: 'Institute Name',
                labelStyle: GoogleFonts.poppins(
                  color: Theme.of(context).colorScheme.onSurface,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            style: GoogleFonts.poppins(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            controller: certificateController.titleController,
            keyboardType: TextInputType.text,

            maxLines: 1,

            // maxLength: 100,
            decoration: InputDecoration(
              labelText: 'Certificatation Title',
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
            controller: certificateController.dateController,
            keyboardType: TextInputType.text,

            maxLines: 1,

            // maxLength: 100,
            decoration: InputDecoration(
              labelText: 'Date of certification',
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
            controller: certificateController.credentialsController,
            keyboardType: TextInputType.multiline,

            maxLines: 1,

            // maxLength: 100,
            decoration: InputDecoration(
              labelText: 'Credentials i.e link, ID etc',
              labelStyle: GoogleFonts.poppins(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              CertificationList.instituteName.add(
                certificateController.instituteController.text,
              );
              CertificationList.titles.add(
                certificateController.titleController.text,
              );
              CertificationList.dates.add(
                certificateController.dateController.text,
              );
              CertificationList.credentials.add(
                certificateController.credentialsController.text,
              );
            });
          },
          icon: Icon(
            Icons.done_outline_outlined,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
