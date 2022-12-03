import 'package:flutter/material.dart';
import 'package:sample_i/constant.dart';

class ActionSlide extends StatelessWidget {
  final Icon icon;
  final String txtHead;
  final Color shadowColor;
  final String txtDetail;

  const ActionSlide({Key? key, required this.icon, required this.txtHead, required this.shadowColor, required this.txtDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            spreadRadius: -5,
            blurRadius: 11,
            color: shadowColor,
          )
        ]
      ),
      padding: const EdgeInsets.only(right: 40,top: Constants.pdBg,bottom: Constants.pdBg,left: Constants.pdBg),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: shadowColor,
            radius: 25,
            child: icon,
          ),
          const SizedBox(width: Constants.pdSm),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                txtHead,
                style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: Constants.pdSm),
              Text(
                txtDetail,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Constants.captionColor),
              ),
            ],
          ),
          const SizedBox(width: Constants.pdBg),
        ],
      ),
    );
  }
}
