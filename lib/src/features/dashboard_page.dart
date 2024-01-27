import 'dart:io';

import 'package:flutter/material.dart';
import 'package:job_box/src/core/common/models/search_stream.dart';
import 'package:job_box/src/core/common/widgets/app_search_bar.dart';
import 'package:job_box/src/core/theme/app_theme.dart';
import 'package:job_box/src/features/jobs/presentation/applied_jobs/widgets/applied_jobs_fragment.dart';
import 'package:job_box/src/features/jobs/presentation/job_listings/widgets/job_listing_fragment.dart';

import '../core/common/widgets/app_button.dart';
import '../core/constants/strings.dart';
import '../core/theme/text_theme.dart';
import 'profile/presentations/widgets/profile_fragment.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 0;

  List<Widget> fragments = [];

  @override
  void initState() {
    fragments = [
      const JobListingFragment(),
      const AppliedJobsFragment(),
      const ProfileFragment()
    ];
    SearchStream().init(); // Starting the search stream
    super.initState();
  }

  @override
  void dispose() {
    SearchStream().disposeStream();
    super.dispose();
  }

  final TextEditingController _searchController = TextEditingController();
  String searchText = "";
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (result) {
        if (!result) {
          if (selectedIndex != 0) {
            setState(() {
              selectedIndex = 0;
            });
          } else {
            _exitApplicationDialog(context);
          }
        }
        return;
      },
      child: Scaffold(
        appBar: selectedIndex == 0
            ? AppBar(
                backgroundColor: AppTheme.primaryColor,
                automaticallyImplyLeading: false,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(120),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text("Hi Mark "),
                            Icon(IconData(0xf03b5, fontFamily: 'MaterialIcons'))
                          ],
                        ),
                        Text(
                          Strings.findTheBestJob,
                          style: AppTextTheme.fancyTextStyle,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppSearchBar(
                            textEditingController: _searchController,
                            hint: Strings.startSearchingForJobs,
                            onInputChanged: (text) async {
                              await Future.delayed(
                                  const Duration(milliseconds: 500));
                              SearchStream().addValueToStream(
                                  text); // Adding search Text to the stream, which will be listened by the job listing
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ))
            : null,
        body: SafeArea(child: SafeArea(child: fragments[selectedIndex])),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt), label: Strings.jobListings),
            BottomNavigationBarItem(
                icon: Icon(Icons.edit), label: Strings.appliedJobs),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: Strings.profile),
          ],
        ),
      ),
    );
  }

  _exitApplicationDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (bContext) => AlertDialog(
              title: Center(
                child: Text(
                  Strings.exitApp,
                  style: AppTextTheme.heading3,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    Strings.exitAppBody,
                    style: AppTextTheme.bodyLightStyle,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AppButton(
                          width: 80,
                          buttonText: Strings.globalCancel,
                          backgroundColor: Colors.white,
                          foregroundColor: AppTheme.primaryColor,
                          onPressed: () {
                            Navigator.pop(bContext);
                          }),
                      AppButton(
                          width: 80,
                          buttonText: Strings.globalQuit,
                          onPressed: () {
                            Navigator.pop(bContext);
                            exit(0);
                          }),
                    ],
                  )
                ],
              ),
            ));
  }
}
