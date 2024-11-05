import 'package:ai_resume_reach/controllers/education_controllers.dart';
import 'package:ai_resume_reach/global_lists/education_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EducationSectionWidget extends StatefulWidget {
  int index;
  EducationSectionWidget({
    required this.index,
  });

  @override
  State<EducationSectionWidget> createState() => _EducationSectionWidgetState();
}

class _EducationSectionWidgetState extends State<EducationSectionWidget> {
  EducationControllers educationControllers = EducationControllers();
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
            controller: educationControllers.instituteNameController,
            keyboardType: TextInputType.text,

            maxLines: 1,

            // maxLength: 100,
            decoration: InputDecoration(
              labelText: 'Institute Name',
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
            controller: educationControllers.levelingNameController,
            keyboardType: TextInputType.text,

            maxLines: 1,

            // maxLength: 100,
            decoration: InputDecoration(
              labelText: 'Education Level i.e matric, inter etc',
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
            controller: educationControllers.timeControllers,
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
            controller: educationControllers.gradeControllers,
            keyboardType: TextInputType.multiline,

            maxLines: 1,

            // maxLength: 100,
            decoration: InputDecoration(
              labelText: 'Grade/CGPA/Percentage',
              labelStyle: GoogleFonts.poppins(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              EducationList.institute
                  .add(educationControllers.instituteNameController.text);
              EducationList.level
                  .add(educationControllers.levelingNameController.text);
              EducationList.time.add(educationControllers.timeControllers.text);
              EducationList.grade
                  .add(educationControllers.gradeControllers.text);
            });
          },
          icon: Icon(Icons.done_outline_outlined),
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ],
    );
  }
}
