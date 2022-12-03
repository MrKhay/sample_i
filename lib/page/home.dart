import 'package:flutter/material.dart';
import 'package:sample_i/api/data_api.dart';
import 'package:sample_i/model/slide_action.dart';
import 'package:sample_i/page/business.dart';
import 'package:sample_i/page/business_details.dart';
import 'package:sample_i/widget/actionslide.dart';
import '../constant.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final List<SlideModel> slideActionData = SlideData().slideData;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "DASHBOARD",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: Colors.grey, letterSpacing: 2),
                      ),
                      const SizedBox(height: Constants.pdSm),
                      Text(
                        "Overview",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Business()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Constants.brColor,
                        padding: const EdgeInsets.all(12)),
                    child: Row(
                      children: <Widget>[
                        const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Business Place",
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
              dashBoard(context: context),
              actionSlides(context),

              // Business Section

              Padding(
                padding: const EdgeInsets.symmetric(vertical: Constants.pdSm),
                child: Text(
                  "My Business",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        spreadRadius: -5,
                        blurRadius: 5,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ]),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(Constants.pdBg),
                      decoration: const BoxDecoration(
                        color: Constants.dashBoardColor,
                      ),
                      child: Text(
                        "NAME",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: const Color.fromRGBO(100, 106, 134, 1.0)),
                      ),
                    ),
                    FutureBuilder(
                        future: DataApi.getData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text("${snapshot.error} occurred",
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              );
                            } else if (snapshot.hasData) {
                              var data = snapshot.data as List<dynamic>;

                              return businessCategory(context: context,data: data);
                         }
                          }

                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.all(Constants.pdBg),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget dashBoard({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Constants.pdSm),
      child: Container(
        padding: const EdgeInsets.all(Constants.pdBg),
        decoration: const BoxDecoration(
            color: Constants.dashBoardColor,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Revenue",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Constants.brColor, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Constants.btnColor,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12)),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Today",
                        style: Theme.of(context)
                            .textTheme
                            .button!
                            .copyWith(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48, bottom: Constants.pdBg),
              child: RichText(
                text: TextSpan(
                    text: '₦ 4,000,000',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Constants.brColor, fontWeight: FontWeight.w900),
                    children: [
                      TextSpan(
                        text: ".00",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Constants.brColor,
                            fontWeight: FontWeight.w900),
                      )
                    ]),
              ),
            ),
            Text(
              "REVENUE COLLECTED",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Colors.black, letterSpacing: 2),
            ),
            const SizedBox(
              height: Constants.pdBg,
            )
          ],
        ),
      ),
    );
  }

  Widget actionSlides(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.15,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return ActionSlide(
            icon: slideActionData[index].icon,
            txtDetail: slideActionData[index].txtDetail,
            txtHead: slideActionData[index].txtHead,
            shadowColor: slideActionData[index].shadowColor,
          );
        },
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(width: Constants.pdSm),
      ),
    );
  }

  Widget businessCategory({required BuildContext context,required List<dynamic>data}) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const BusinessDetails())),
          child: Container(
            padding: const EdgeInsets.all(Constants.pdSm),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(data.elementAt(index),
                      style: Theme.of(context).textTheme.bodyText2),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey,
                    size: 16,
                  )
                ]),
          ),
        );
      },
      itemCount: 8,
      separatorBuilder: (BuildContext context, int index) => const Divider(
        height: 1,
        color: Constants.brColor,
      ),
    );
  }
}
