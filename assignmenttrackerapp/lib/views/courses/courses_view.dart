import 'package:assignmenttrackerapp/models/db_course.dart';
import 'package:assignmenttrackerapp/services/database/courses_service.dart';
import 'package:assignmenttrackerapp/views/courses/add_course_view.dart';
import 'package:assignmenttrackerapp/views/widgets/standard_editable_item_widget.dart';
import 'package:flutter/material.dart';

class CoursesView extends StatefulWidget {
  final CoursesService _coursesService;

  const CoursesView({super.key, required CoursesService coursesService})
      : _coursesService = coursesService;

  @override
  State<CoursesView> createState() => _CoursesViewState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Courses';
  }
}

class _CoursesViewState extends State<CoursesView> {
  @override
  void initState() {
    widget._coursesService.getAllCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: widget._coursesService.cache.cacheStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final courses = snapshot.data!;
            courses.sort((a, b) => a.courseName.compareTo(b.courseName));

            return ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return StandardEditableItemWidget<DatabaseCourse>(
                  data: course,
                  titleBuilder: (course) => course.courseName,
                  subtitle1Builder: (course) =>
                      course.courseEvent!.scheduledDaysString,
                  subtitle2Builder: (course) =>
                      course.courseEvent!.timeSlotsString,
                  onDelete: () async {
                    await widget._coursesService.deleteCourseById(
                      id: course.courseId,
                      eventIds: [
                        if (course.courseEvent != null) course.courseEvent!.id,
                        if (course.tutorialEvent != null)
                          course.tutorialEvent!.id,
                        if (course.labEvent != null) course.labEvent!.id,
                      ],
                    );
                  },
                  onUpdate: () async {},
                );
              },
            );
          }
          return const Center(
            child: Text("No courses found."),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddCourseView(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
