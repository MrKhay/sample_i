
import 'package:flutter/material.dart';

class SlideModel{
  Icon icon;
  String txtHead;
 Color shadowColor;
 String txtDetail;

 SlideModel({required this.icon,required this.txtHead,required this.txtDetail,required this.shadowColor});

}

class SlideData{
  List<SlideModel> slideData = [
    SlideModel(icon: const Icon(Icons.note_rounded,color: Color.fromRGBO(253, 107, 109, 1.0),), txtHead: "1", txtDetail: "Applications", shadowColor: const Color.fromRGBO(247, 233, 233, 1.0)),
    SlideModel(icon: const Icon(Icons.storefront_rounded,color: Color.fromRGBO(92, 83, 63, 1.0),), txtHead: "50,675", txtDetail: "My Businesses", shadowColor: const Color.fromRGBO(245, 225, 176, 1.0)),
    SlideModel(icon: const Icon(Icons.group_outlined,color: Color.fromRGBO(51, 113, 56, 1.0),), txtHead: "12", txtDetail: "SubAgents", shadowColor: const Color.fromRGBO(209, 247, 196, 1.0)),
  ];
}