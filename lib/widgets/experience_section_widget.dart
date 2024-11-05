import 'package:ai_resume_reach/controllers/experience_controllers.dart';
import 'package:ai_resume_reach/global_lists/experience_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExperienceSectionWidget extends StatefulWidget {
  int index;
  ExperienceSectionWidget({required this.index});

  @override
  State<ExperienceSectionWidget> createState() =>
      _ExperienceSectionWidgetState();
}

class _ExperienceSectionWidgetState extends State<ExperienceSectionWidget> {
  ExperienceControllers experienceControllers = ExperienceControllers();

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
            controller: experienceControllers.companyNameController,
            keyboardType: TextInputType.text,

            maxLines: 1,

            // maxLength: 100,
            decoration: InputDecoration(
              labelText: 'Company Name',
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
            controller: experienceControllers.jobTitleController,
            keyboardType: TextInputType.text,

            maxLines: 1,

            // maxLength: 100,
            decoration: InputDecoration(
              labelText: 'Job Title',
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
            controller: experienceControllers.timeController,
            keyboardType: TextInputType.text,

            maxLines: 1,

            // maxLength: 100,
            decoration: InputDecoration(
              labelText: 'Time Period',
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
            controller: experienceControllers.locationController,
            keyboardType: TextInputType.multiline,

            maxLines: 1,

            // maxLength: 100,
            decoration: InputDecoration(
              labelText: 'Location',
              labelStyle: GoogleFonts.poppins(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              ExperienceList.companyName
                  .add(experienceControllers.companyNameController.text);

              ExperienceList.jobTitle
                  .add(experienceControllers.jobTitleController.text);
              ExperienceList.timePeriod
                  .add(experienceControllers.timeController.text);
              ExperienceList.location
                  .add(experienceControllers.locationController.text);
            });
          },
          icon: Icon(Icons.done_outline_outlined),
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ],
    );
  }
}
