import 'package:flutter/material.dart';
import 'package:sample_i/page/business_details.dart';

import '../api/data_api.dart';
import '../constant.dart';

class Business extends StatelessWidget {
  const Business({Key? key}) : super(key: key);

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
          padding: const EdgeInsets.symmetric(vertical: Constants.pdBg,horizontal: Constants.pdSm),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "BUSINESS",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: Colors.grey, letterSpacing: 2),
                      ),
                      const SizedBox(height: Constants.pdSm),
                      Text(
                        "All businesses",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Constants.dashBoardColor,
                        padding: const EdgeInsets.all(12)),
                    child: Row(
                      children: <Widget>[

                        Text(
                          "All Businesses",
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(color: const Color.fromRGBO(100, 106, 134, 1.0)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Color.fromRGBO(100, 106, 134, 1.0),
                          size: 24.0,
                        ),

                      ],
                    ),
                  )
                ],
              ),
              searchBar(context),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.all(Radius.circular(8)),
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
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: const Color.fromRGBO(100, 106, 134, 1.0)),
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
  
  searchBar(context){
    return Padding(padding: const EdgeInsets.symmetric(vertical: Constants.pdBg),
    child: Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(1, 1),
              spreadRadius: -5,
              blurRadius: 8,
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
          ]
      ),
      child: Theme(
        data:Theme.of(context).copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
            primary:Constants.brColor,
          ),
        ),
        child: const TextField(

          decoration: InputDecoration(
            focusColor: Constants.brColor,
            prefixIcon: Icon(Icons.search,
            ),
              focusedBorder: OutlineInputBorder(

                  borderSide: BorderSide(color: Colors.grey)),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              hintText: 'Search Business Places'),
        ),
      ),
    ),);
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
      itemCount: data.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(
        height: 1,
        color: Constants.brColor,
      ),
    );
  }

}
