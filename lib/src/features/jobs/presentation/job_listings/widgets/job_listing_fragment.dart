import 'package:flutter/material.dart';
import 'package:job_box/src/core/common/models/company_model.dart';
import 'package:job_box/src/core/common/models/salary_model.dart';
import 'package:job_box/src/core/common/models/search_stream.dart';
import 'package:job_box/src/features/jobs/data/models/job_model.dart';
import 'package:job_box/src/features/jobs/presentation/job_listings/widgets/job_list_view.dart';

import '../../../../../core/constants/strings.dart';

class JobListingFragment extends StatefulWidget {
  const JobListingFragment({Key? key}) : super(key: key);

  @override
  State<JobListingFragment> createState() => _JobListingFragmentState();
}

class _JobListingFragmentState extends State<JobListingFragment>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  List<JobModel> recentJobs = [];

  List<JobModel> jobsNearYou = [];

  @override
  void initState() {
    recentJobs.add(JobModel(
        jobRole: "Senior Product Designer",
        jobDescription: Strings.sampleJD,
        requirements: Strings.sampleReq,
        companyModel: const CompanyModel(
            companyName: "SLACK",
            companyLogo:
                "https://assets.stickpng.com/images/5cb480cd5f1b6d3fbadece79.png"),
        jobPostedOn: DateTime(2024, 01, 20),
        salaryModel: const SalaryModel(minSalary: 6000, maxSalary: 8000),
        location: "East, Singapore"));
    jobsNearYou.add(JobModel(
        jobRole: "Senior Product Designer",
        jobDescription: Strings.sampleJD,
        requirements: Strings.sampleReq,
        companyModel: const CompanyModel(
            companyName: "SLACK",
            companyLogo:
                "https://assets.stickpng.com/images/5cb480cd5f1b6d3fbadece79.png"),
        jobPostedOn: DateTime(2024, 01, 20),
        salaryModel: const SalaryModel(minSalary: 6000, maxSalary: 8000),
        location: "East, Singapore"));
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.label,
            dividerColor: Colors.transparent,
            tabs: const [
              Tab(
                text: Strings.recentJobs,
              ),
              Tab(
                text: Strings.nearYou,
              ),
            ]),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder(
              stream: SearchStream().getStream(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                String searchText = snapshot.data ?? "";

                return TabBarView(controller: _tabController, children: [
                  JobListView(
                      jobs: searchText.isNotEmpty
                          ? recentJobs
                              .where((element) =>
                                  element.toString().contains(searchText))
                              .toList()
                          : recentJobs),
                  JobListView(
                      jobs: searchText.isNotEmpty
                          ? jobsNearYou
                              .where((element) =>
                                  element.toString().contains(searchText))
                              .toList()
                          : jobsNearYou),
                ]);
              },
            ),
          ),
        )
      ],
    );
  }
}
