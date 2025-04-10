import 'package:flutter/material.dart';
import '../widgets/job_card.dart';
import '../widgets/job_application_form.dart';
import '../widgets/job_filters.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({Key? key}) : super(key: key);

  @override
  _JobsScreenState createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  List<Map<String, dynamic>> filteredJobs = [];
  Map<String, dynamic> currentFilters = {};
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  // Add missing variables
  String _selectedJobType = 'All';
  String _selectedExperience = 'All';
  
  // Add missing lists
  final List<String> _jobTypes = ['All', 'Full-time', 'Part-time', 'Remote', 'Contract'];
  final List<String> _experienceLevels = ['All', 'Entry Level', '1-3 years', '3-5 years', '5+ years'];
  
  // Add missing jobs list
  List<Map<String, dynamic>> _jobs = [
    {
      'title': 'Senior Flutter Developer',
      'company': 'Tech Solutions Inc',
      'location': 'Ahmedabad',
      'type': 'Full-time',
      'salary': '12.0',
      'companyLogo': 'https://i.pravatar.cc/150?img=1',
    },
    {
      'title': 'Mobile App Developer',
      'company': 'Digital Innovations',
      'location': 'Gandhinagar',
      'type': 'Full-time',
      'salary': '8.0',
      'companyLogo': 'https://i.pravatar.cc/150?img=2',
    },
    {
      'title': 'UI/UX Designer',
      'company': 'Creative Minds',
      'location': 'Surat',
      'type': 'Full-time',
      'salary': '9.0',
      'companyLogo': 'https://i.pravatar.cc/150?img=3',
    },
  ];

  // Add missing method
  void _applyForJob(String jobTitle) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Apply for $jobTitle'),
        content: Text('Your application has been submitted successfully!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    filteredJobs = _getJobs();
  }

  void _applyFilters(Map<String, dynamic> filters) {
    setState(() {
      currentFilters = filters;
      filteredJobs = _getJobs().where((job) {
        bool matches = true;
        if (filters['jobType'] != null) {
          matches = matches && job['jobType'] == filters['jobType'];
        }
        if (filters['experience'] != null) {
          matches = matches && job['experience'] == filters['experience'];
        }
        if (filters['location'] != null) {
          matches = matches && job['location'] == filters['location'];
        }
        if (filters['industry'] != null) {
          matches = matches && job['industry'] == filters['industry'];
        }
        if (filters['department'] != null) {
          matches = matches && job['department'] == filters['department'];
        }
        if (filters['salaryRange'] != null) {
          final range = filters['salaryRange'] as RangeValues;
          matches = matches && job['salary'] >= range.start && job['salary'] <= range.end;
        }
        return matches;
      }).toList();
    });
  }

  List<Map<String, dynamic>> _getJobs() {
    return [
      {
        'title': 'Senior Flutter Developer',
        'company': 'Tech Solutions Inc',
        'location': 'Ahmedabad',
        'description': 'We are looking for an experienced Flutter developer to join our team. Must have experience in state management and clean architecture.',
        'salary': 12.0,
        'jobType': 'Full-time',
        'experience': '3-5 years',
        'industry': 'IT',
        'department': 'Development',
      },
      {
        'title': 'Mobile App Developer',
        'company': 'Digital Innovations',
        'location': 'Gandhinagar',
        'description': 'Join our dynamic team to work on cutting-edge mobile applications. Experience with Firebase and REST APIs required.',
        'salary': 8.0,
        'jobType': 'Full-time',
        'experience': '1-3 years',
        'industry': 'IT',
        'department': 'Development',
      },
      {
        'title': 'UI/UX Designer',
        'company': 'Creative Minds',
        'location': 'Surat',
        'description': 'Looking for a creative UI/UX designer to create beautiful and intuitive interfaces for our mobile apps.',
        'salary': 9.0,
        'jobType': 'Full-time',
        'experience': '2-4 years',
        'industry': 'Design',
        'department': 'Design',
      },
      {
        'title': 'Backend Developer',
        'company': 'Tech Solutions Inc',
        'location': 'Ahmedabad',
        'description': 'Join our backend team to build scalable APIs and microservices. Experience with Node.js and MongoDB required.',
        'salary': 11.0,
        'jobType': 'Full-time',
        'experience': '3-5 years',
        'industry': 'IT',
        'department': 'Development',
      },
      {
        'title': 'QA Engineer',
        'company': 'Quality First',
        'location': 'Vadodara',
        'description': 'Looking for a QA engineer to ensure the quality of our mobile applications. Experience with automated testing required.',
        'salary': 7.0,
        'jobType': 'Full-time',
        'experience': '2-4 years',
        'industry': 'IT',
        'department': 'Quality Assurance',
      },
      {
        'title': 'Product Manager',
        'company': 'Tech Solutions Inc',
        'location': 'Ahmedabad',
        'description': 'Lead our product development team and drive innovation in our mobile applications.',
        'salary': 15.0,
        'jobType': 'Full-time',
        'experience': '5-7 years',
        'industry': 'IT',
        'department': 'Product Management',
      },
      {
        'title': 'DevOps Engineer',
        'company': 'Cloud Solutions',
        'location': 'Remote',
        'description': 'Join our DevOps team to manage our cloud infrastructure and CI/CD pipelines.',
        'salary': 13.0,
        'jobType': 'Remote',
        'experience': '3-5 years',
        'industry': 'IT',
        'department': 'DevOps',
      },
      {
        'title': 'Data Scientist',
        'company': 'Analytics Pro',
        'location': 'Ahmedabad',
        'description': 'Work with our data team to analyze user behavior and improve our applications.',
        'salary': 14.0,
        'jobType': 'Full-time',
        'experience': '4-6 years',
        'industry': 'IT',
        'department': 'Data Science',
      },
      {
        'title': 'Technical Writer',
        'company': 'Tech Solutions Inc',
        'location': 'Remote',
        'description': 'Create technical documentation and guides for our development team and users.',
        'salary': 6.0,
        'jobType': 'Remote',
        'experience': '2-4 years',
        'industry': 'IT',
        'department': 'Documentation',
      },
      {
        'title': 'Marketing Manager',
        'company': 'Digital Innovations',
        'location': 'Gandhinagar',
        'description': 'Lead our marketing team and develop strategies to promote our mobile applications.',
        'salary': 10.0,
        'jobType': 'Full-time',
        'experience': '4-6 years',
        'industry': 'Marketing',
        'department': 'Marketing',
      },
    ];
  }

  void _showApplicationForm(BuildContext context, String title, String company) {
    showDialog(
      context: context,
      builder: (context) => JobApplicationForm(
        jobTitle: title,
        company: company,
        onSubmit: () {
          // TODO: Implement application submission logic
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Application submitted successfully!')),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Find Your Dream Job',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.titleLarge?.color,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Browse through thousands of full-time and part-time jobs',
                  style: TextStyle(
                    color: theme.textTheme.bodyMedium?.color,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search jobs...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: theme.cardColor,
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedJobType,
                    decoration: InputDecoration(
                      labelText: 'Job Type',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: theme.cardColor,
                    ),
                    items: _jobTypes.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedJobType = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedExperience,
                    decoration: InputDecoration(
                      labelText: 'Experience',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: theme.cardColor,
                    ),
                    items: _experienceLevels.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedExperience = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Recommended Jobs',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: theme.textTheme.titleLarge?.color,
              ),
            ),
          ),
          SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _jobs.length,
            itemBuilder: (context, index) {
              final job = _jobs[index];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: theme.cardColor,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(job['companyLogo']),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  job['title'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: theme.textTheme.titleLarge?.color,
                                  ),
                                ),
                                Text(
                                  job['company'],
                                  style: TextStyle(
                                    color: theme.textTheme.bodyMedium?.color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 16, color: theme.iconTheme.color),
                          SizedBox(width: 4),
                          Text(
                            job['location'],
                            style: TextStyle(
                              color: theme.textTheme.bodyMedium?.color,
                            ),
                          ),
                          SizedBox(width: 16),
                          Icon(Icons.work, size: 16, color: theme.iconTheme.color),
                          SizedBox(width: 4),
                          Text(
                            job['type'],
                            style: TextStyle(
                              color: theme.textTheme.bodyMedium?.color,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${job['salary']}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: theme.textTheme.titleLarge?.color,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _applyForJob(job['title']);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.primaryColor,
                              foregroundColor: theme.textTheme.bodyLarge?.color,
                            ),
                            child: Text('Apply Now'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}