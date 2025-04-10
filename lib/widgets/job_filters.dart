import 'package:flutter/material.dart';

class JobFilters extends StatefulWidget {
  final Function(Map<String, dynamic>) onFilterChanged;

  const JobFilters({Key? key, required this.onFilterChanged}) : super(key: key);

  @override
  _JobFiltersState createState() => _JobFiltersState();
}

class _JobFiltersState extends State<JobFilters> {
  String? _selectedJobType;
  String? _selectedExperience;
  RangeValues _salaryRange = RangeValues(0, 50);
  String? _selectedLocation;
  String? _selectedIndustry;

  final List<String> _jobTypes = ['Full-time', 'Part-time', 'Contract', 'Remote'];
  final List<String> _experienceLevels = ['Entry Level', '1-3 years', '3-5 years', '5+ years'];
  final List<String> _locations = ['Ahmedabad', 'Gandhinagar', 'Surat', 'Vadodara', 'Remote'];
  final List<String> _industries = ['IT', 'Healthcare', 'Finance', 'Education', 'Manufacturing'];

  void _applyFilters() {
    final filters = {
      'jobType': _selectedJobType,
      'experience': _selectedExperience,
      'salaryRange': _salaryRange,
      'location': _selectedLocation,
      'industry': _selectedIndustry,
    };
    widget.onFilterChanged(filters);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              _buildFilterChip('Job Type', _selectedJobType, _jobTypes),
              SizedBox(width: 8),
              _buildFilterChip('Experience', _selectedExperience, _experienceLevels),
              SizedBox(width: 8),
              _buildFilterChip('Location', _selectedLocation, _locations),
              SizedBox(width: 8),
              _buildFilterChip('Industry', _selectedIndustry, _industries),
              SizedBox(width: 8),
              ActionChip(
                label: Text('Salary Range'),
                onPressed: _showSalaryRangeDialog,
                avatar: Icon(Icons.attach_money, size: 18),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChip(String label, String? selectedValue, List<String> options) {
    return ActionChip(
      label: Text(selectedValue ?? label),
      onPressed: () => _showFilterDialog(label, selectedValue, options),
      avatar: Icon(Icons.arrow_drop_down, size: 18),
    );
  }

  void _showFilterDialog(String title, String? selectedValue, List<String> options) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select $title'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: options.map((option) => RadioListTile<String>(
              title: Text(option),
              value: option,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  switch (title) {
                    case 'Job Type':
                      _selectedJobType = value;
                      break;
                    case 'Experience':
                      _selectedExperience = value;
                      break;
                    case 'Location':
                      _selectedLocation = value;
                      break;
                    case 'Industry':
                      _selectedIndustry = value;
                      break;
                  }
                });
                _applyFilters();
                Navigator.pop(context);
              },
            )).toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _showSalaryRangeDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select Salary Range'),
        content: Container(
          height: 100,
          child: Column(
            children: [
              RangeSlider(
                values: _salaryRange,
                min: 0,
                max: 50,
                divisions: 50,
                labels: RangeLabels(
                  '₹${_salaryRange.start.round()}L',
                  '₹${_salaryRange.end.round()}L',
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _salaryRange = values;
                  });
                },
              ),
              Text(
                'Range: ₹${_salaryRange.start.round()}L - ₹${_salaryRange.end.round()}L',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              _applyFilters();
              Navigator.pop(context);
            },
            child: Text('Apply'),
          ),
        ],
      ),
    );
  }
}