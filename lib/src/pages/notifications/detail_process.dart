// import 'package:flutter/material.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// import '../../utils/theme/colors.dart';
// import '../../widget/buttons/secondary_button.dart';
// import '../../widget/others/green_dot.dart';

// class DetailProcess extends StatefulWidget {
//   final ValueNotifier onDetailProcess;

//   const DetailProcess({Key? key, required this.onDetailProcess})
//       : super(key: key);

//   @override
//   _DetailProcessState createState() => _DetailProcessState();
// }

// class _DetailProcessState extends State<DetailProcess> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _content(context),
//     );
//   }

//   Widget _content(BuildContext context) => SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
//           child: Column(children: [
//             SizedBox(height: 8.h),
//             _title,
//             SizedBox(height: 3.h),
//             _header,
//             SizedBox(height: 1.h),
//             _description,
//             _items,
//             SizedBox(height: 3.h),
//             Text(
//                 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.'),
//             SizedBox(height: 3.h),
//             SecondaryButton(
//                 labelText: 'ADJUNTAR VIDEO',
//                 isEnabled: true,
//                 asset: 'assets/img/upload_file_gray.png',
//                 size: 100,
//                 onPressed: () {}),
//             SizedBox(height: 3.h),
//             SecondaryButton(
//                 labelText: 'GRABAR VIDEO',
//                 isEnabled: true,
//                 size: 100,
//                 asset: 'assets/img/record_video_gray.png',
//                 onPressed: () {}),
//           ]),
//         ),
//       );

//   Container get _title => Container(
//         padding: EdgeInsets.all(0),
//         width: 100.w,
//         height: 30,
//         child: Row(
//           children: [
//             InkWell(
//               onTap: () {
//                 widget.onDetailProcess.value = !widget.onDetailProcess.value;
//                 setState(() {});
//               },
//               child: Image.asset(
//                 'assets/img/back_arrow_black.png',
//                 height: 5.h,
//                 width: 5.w,
//               ),
//             ),
//             Spacer(),
//             Image.asset(
//               'assets/text/mi_proceso.png',
//               width: 40.w,
//             ),
//             Spacer(flex: 2),
//             // Padding(
//             //   padding: EdgeInsets.only(right: 20),
//             //   child: Image.asset(
//             //     'assets/img/green_dots.png',
//             //     height: 3.h,
//             //   ),
//             // ),
//           ],
//         ),
//       );

//   SizedBox get _header => SizedBox(
//         width: 100.w,
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'PREPARACIÓN',
//                   style: TextStyle(color: AppColors.primaryColor),
//                 ),
//                 Text(
//                   'Exámenes Médicos',
//                   style: TextStyle(color: AppColors.darkGrey),
//                 ),
//               ],
//             ),
//             Spacer(),
//             Image.asset(
//               'assets/img/medical_document.png',
//               height: 15.w,
//             ),
//           ],
//         ),
//       );

//   Container get _description => Container(
//         margin: EdgeInsets.only(top: 10),
//         width: 100.w,
//         child: Text(
//             'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
//       );

//   Container get _items => Container(
//         margin: EdgeInsets.only(top: 10),
//         child: _listOffers,
//       );

//   Widget get _listOffers => ListView.builder(
//       itemCount: 5,
//       padding: EdgeInsets.all(0),
//       shrinkWrap: true,
//       primary: false,
//       itemBuilder: (context, index) {
//         return Row(
//           children: [
//             GreenDot(),
//             SizedBox(width: 20),
//             Container(
//               margin: EdgeInsets.only(top: 30),
//               width: 80.w,
//               child: Text(
//                   'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.'),
//             ),
//           ],
//         );
//       });
// }
