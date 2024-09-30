import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/app_colors.dart';
import '../../../data/models/appointment_model.dart';
import '../../../data/models/coach_model.dart';
import '../../../generated/l10n.dart';
import 'three_step_progress_screen.dart';

class CoachDetailScreen extends StatefulWidget {
  final CoachModel modelData;

  const CoachDetailScreen({
    super.key,
    required this.modelData,
  });

  @override
  State<CoachDetailScreen> createState() => _CoachDetailScreenState();
}

class _CoachDetailScreenState extends State<CoachDetailScreen> {
  GoogleMapController? mapController;
  final TextEditingController reviewController = TextEditingController();

  List<AppointmentModel> schedule = [
    AppointmentModel(booked: true, time: '15:50'),
    AppointmentModel(booked: false, time: '16:10'),
    AppointmentModel(booked: true, time: '17:30'),
    AppointmentModel(booked: false, time: '18:20'),
  ];
  List<Map<String, String>> reviews = [
    {
      "name": "John Doe",
      "comment": "Great coach, really helpful!",
      "rating": "5.0"
    },
    {
      "name": "Jane Smith",
      "comment": "Very knowledgeable and professional.",
      "rating": "4.5"
    },
    {
      "name": "Samuel Green",
      "comment": "Good experience, learned a lot.",
      "rating": "3.5"
    },
  ];

  double _rating = 4.0;

  void _showReviewDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            // S.of(context).a,
            'Add a Review',
            style:
                TextStyle(color: Theme.of(context).textTheme.bodySmall!.color),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: reviewController,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodySmall!.color!,
                ),
                decoration: InputDecoration(
                  labelText: 'Your Comment',
                  labelStyle: TextStyle(
                    color: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .color!
                        .withOpacity(.6),
                  ),
                ),
                maxLines: 1,
              ),
              const SizedBox(height: 10),
              // const Text('Rating:'),
              RatingBar.builder(
                initialRating: _rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Theme.of(context).indicatorColor,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _rating = rating;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (reviewController.text.isNotEmpty) {
                  setState(() {
                    reviews.add({
                      "name": "New User",
                      "comment": reviewController.text,
                      "rating": _rating.toString(),
                    });
                    reviewController.clear();
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text(
                S.of(context).submit,
                // 'Submit',
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodySmall!.color),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                // S.of(context).ca,
                'Cancel',
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodySmall!.color),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: _buildAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileSection(context),
              SizedBox(height: 10.h),
              _buildRatingSection(context),
              const SizedBox(height: 20),
              _buildDetailsSection(),
              SizedBox(height: 10.h),
              _buildDescriptionSection(context),
              SizedBox(height: 10.h),
              _buildAvailabilitySection(),
              SizedBox(height: 20.h),
              _buildReviewsSection(context),
              const SizedBox(height: 20),
              _buildAddReviewSection(context),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      centerTitle: true,
      title: Text(
        S.of(context).coachDetails,
        // 'Coach Details',
        style: TextStyle(
          color: Theme.of(context).textTheme.bodySmall!.color,
        ),
      ),
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          GoRouter.of(context).pop();
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          height: 5,
          width: 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColors.seGreen,
          ),
          child: const Center(
            child: Icon(
              Icons.arrow_back_ios,
              size: 15,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(widget.modelData.image),
          ),
          const SizedBox(height: 10),
          Text(
            widget.modelData.name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodySmall!.color,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            S.of(context).coach,
            // "Coach",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).textTheme.bodySmall!.color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingSection(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                index < 4 ? Icons.star : Icons.star_border,
                color: Theme.of(context).primaryTextTheme.bodySmall!.color,
                size: 30,
              ),
            ),
          ),
          const SizedBox(width: 5),
          Text(
            '4.5',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).textTheme.bodySmall!.color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsSection() {
    return Stack(
      children: [
        Container(
          width: 350.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade400, width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                _buildDetailRow(S.of(context).rate, widget.modelData.rate),
                const SizedBox(height: 10),
                _buildDetailRow(S.of(context).city, widget.modelData.city),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
          textAlign: TextAlign.center,
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodySmall!.color,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.modelData.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodySmall!.color,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Text(
          widget.modelData.description,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Theme.of(context).textTheme.bodySmall!.color,
          ),
        ),
      ],
    );
  }

  Widget _buildAvailabilitySection() {
    return Container(
      padding: EdgeInsets.all(10.0.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade400, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).availability,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodySmall!.color),
          ),
          const SizedBox(
            height: 15,
          ),
          ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Dim.\n',
                        style:
                            TextStyle(fontSize: 20, color: Colors.red.shade500),
                        children: <TextSpan>[
                          TextSpan(
                            text: '19/05',
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 260.w,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: schedule.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ThreeStepProgressScreen(),
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              height: 45,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.seGreen,
                              ),
                              child: Center(
                                child: Text(
                                  schedule[index].time,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).reviews,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodySmall!.color,
          ),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          itemCount: reviews.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            double rating =
                double.tryParse(reviews[index]['rating'] ?? '0') ?? 0;
            return Card(
              color: Theme.of(context).primaryColor,
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            reviews[index]['name']!,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            reviews[index]['comment']!,
                            style: TextStyle(
                              fontSize: 14,
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: List.generate(5, (starIndex) {
                            if (starIndex < rating.floor()) {
                              return Icon(
                                Icons.star,
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .bodySmall!
                                    .color,
                                size: 20,
                              );
                            } else if (starIndex < rating) {
                              return Icon(
                                Icons.star_half,
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .bodySmall!
                                    .color,
                                size: 20,
                              );
                            } else {
                              return Icon(
                                Icons.star_border,
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .bodySmall!
                                    .color,
                                size: 20,
                              );
                            }
                          }),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          reviews[index]['rating']!,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodySmall!.color,
                          ),
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
    );
  }

  Widget _buildAddReviewSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: reviewController,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodySmall!.color!,
                  ),
                  decoration: InputDecoration(
                    hintMaxLines: 3,
                    hintText: S.of(context).enterReview, //"Enter your review"
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                icon: Icon(Icons.send,
                    color: Theme.of(context).primaryTextTheme.bodySmall!.color),
                onPressed: _showReviewDialog,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
