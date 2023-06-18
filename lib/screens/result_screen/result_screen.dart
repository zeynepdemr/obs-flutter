import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/models/requests/student.dart';
import 'package:flutter_app/models/responses/exam_response.dart';
import 'package:flutter_app/screens/result_screen/components/result_component.dart';
import 'package:flutter_app/screens/result_screen/data/result_data.dart';
import 'package:sizer/sizer.dart';
import 'package:collection/collection.dart';

import '../../blocs/user_bloc.dart';

class ResultScreen extends StatefulWidget {
  static String routeName = 'ResultScreen';

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List<ExamResponse> exams = List<ExamResponse>.empty();
  Student student = Student();
  @override
  void initState() {
    userBloc.getExam().then((response){
      setState(() {
        exams = response;
      });
    });

    userBloc.getStudent().then((response){
      setState(() {
        student = response;
      });
    });

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    int oMarks = exams.map((e) => e.point!).sum.toInt();
    int tMarks = exams.map((e) => 100).sum.toInt();
    return Scaffold(
      appBar: AppBar(
        title: Text('Sonuçlar'),
      ),
      body: Column(
        children: [
          //we will design the circle at the end
          Container(
            height: 20.h,
            margin: EdgeInsets.all(3.h),
            child: CustomPaint(
              foregroundPainter: CircularPainter(
                  backgroundColor: kPrimaryColor,
                  lineColor: kOtherColor,
                  width: 5.w),
              child: Center(
                //lets sum the total marks adn obtained marks // collection library for sum
                child: Text('$oMarks\n / \n$tMarks',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1),
              ),
            ),
          ),
          Text('Mükemmelsin',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(fontWeight: FontWeight.w900)),
          Text('${student.firstName} !!', style: Theme.of(context).textTheme.subtitle1!),
          sizedBox,
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: kTopBorderRadius, color: kOtherColor),
              child: ListView.builder(
                  padding: EdgeInsets.all(kDefaultPadding),
                  itemCount: exams.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: kDefaultPadding),
                      padding: EdgeInsets.all(kDefaultPadding / 2),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(kDefaultPadding),
                        boxShadow: [
                          BoxShadow(color: kTextLightColor, blurRadius: 2.0),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(exams[index].lecture!.name!,
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context).textTheme.subtitle2),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${exams[index].point} / 100',
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        width:
                                            100,
                                        height: 2.h,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[700],
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                  kDefaultPadding),
                                              bottomRight: Radius.circular(
                                                  kDefaultPadding)),
                                        ),
                                      ),
                                      Container(
                                        height: 2.h,
                                        width: exams[index]
                                            .point!
                                            .toDouble(),
                                        decoration: BoxDecoration(
                                          color: exams[index].grade == "D"
                                              ? kErrorBorderColor
                                              : kOtherColor,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                  kDefaultPadding),
                                              bottomRight: Radius.circular(
                                                  kDefaultPadding)),
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    exams[index].grade!,
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(fontWeight: FontWeight.w900),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
