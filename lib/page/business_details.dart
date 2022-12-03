import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class BusinessDetails extends StatelessWidget {
  const BusinessDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 2,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Constants.pdBg),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/logo2.webp"),
                  ),
                  Container(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ministry of",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Constants.textColor),
                      ),
                      Text(
                        "Commerce",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Constants.textColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: Constants.pdSm),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              decoration: const BoxDecoration(
                  color: Constants.lightRed,
                  borderRadius: BorderRadius.all(Radius.circular(18))),
              child: Text(
                "Agent",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Constants.red, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
        actions: const [
          Icon(
            Icons.menu,
            color: Colors.black,
          ),
          SizedBox(width: Constants.pdSm)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: Constants.pdBg, horizontal: Constants.pdSm),
          child: Column(
            children: [
              dashBoard(context),
              Container(
                width: double.infinity,
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    spreadRadius: -6,
                    blurRadius: 5,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ]),
                padding: const EdgeInsets.symmetric(
                    vertical: Constants.pdBg, horizontal: Constants.pdSm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,

                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Address",
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(color: Constants.captionColor)),
                    const SizedBox(height: 8),
                    Text("14 Ogboko Street, Mgbuoba \n Obio-Akpor",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: const Color.fromRGBO(55, 64, 114, 1.0))),
                    const SizedBox(height: Constants.pdSm),
                    Text("L.G.A",
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(color: Constants.captionColor)),
                    const SizedBox(height: 8),
                    Text("Obio-Akpor",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: const Color.fromRGBO(55, 64, 114, 1.0))),
                    const SizedBox(height: Constants.pdSm),
                    Text("Ward",
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(color: Constants.captionColor)),
                    const SizedBox(height: 8),
                    Text("Obio-Akpor",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: const Color.fromRGBO(55, 64, 114, 1.0))),
                    const SizedBox(height: Constants.pdBg),
                    Text("Phone",
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(color: Constants.captionColor)),
                    const SizedBox(height: 8),
                    Text("0812345678",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: const Color.fromRGBO(55, 64, 114, 1.0))),
                    const SizedBox(height: Constants.pdSm),
                    Text("Email",
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(color: Constants.captionColor)),
                    const SizedBox(height: 8),
                    Text("0812345678",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: const Color.fromRGBO(55, 64, 114, 1.0))),
                    const SizedBox(height: Constants.pdBg + Constants.pdBg),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget dashBoard(context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(1, 3),
            spreadRadius: -9,
            blurRadius: 7,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ],
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 30, horizontal: Constants.pdBg),
              decoration: const BoxDecoration(
                color: Constants.brColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(Constants.pdSm),
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(70, 126, 148, 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: const Icon(
                          Icons.storefront,
                          color: Color.fromRGBO(98, 144, 162, 1.0),
                          size: 35,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: Constants.pdSm),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Paragraph Limited",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: Constants.pdSm),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 16),
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(207, 239, 252, 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(18))),
                        child: Text(
                          "Informal Sector",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      const SizedBox(height: Constants.pdBg),
                      Text(
                        "ID: MCI-23-02-00001",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.white),
                      )
                    ],
                  )
                ],
              )),
          Container(
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [

            ]),
            padding: const EdgeInsets.symmetric(
                vertical: Constants.pdSm, horizontal: Constants.pdSm),
            child: Row(
              children: [
                DottedBorder(
                  color: Constants.brColor,
                  strokeWidth: 1,
                  dashPattern: const [5, 5],
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),

                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: Constants.pdSm,vertical: 8),
                    decoration: const BoxDecoration(

                        borderRadius:
                            BorderRadius.all(Radius.circular(20))),
                    child: Text(
                      "General Information",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
                const SizedBox(width: Constants.pdBg),
                Text(
                  "Applications",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
