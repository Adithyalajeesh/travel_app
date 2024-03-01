import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars=3;
  int selectedIndex=-1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              right: 0,
                left: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/mountain.jpeg",

                      ),
                      fit: BoxFit.cover
                    )
                  ),
                )),
            Positioned(
              top: 50,
                left: 20,
                child: Row(

              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.menu,color: Colors.white,),),

              ],
            )),
            Positioned(
              top: 220,
                child: Container(
                  padding: EdgeInsets.only(right: 20,left: 20,top: 25),
                  width:  MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),


                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                              text: "Yosemite",color: Colors.black.withOpacity(0.8),),
                          AppLargeText(text: "\$250",color: AppColors.mainColor,)
                        ],
                      ),
                      SizedBox(height: 6,),
                      Row(
                        children: [
                          Icon(Icons.location_on,color: AppColors.mainColor,),
                          SizedBox(width: 5,),
                          AppText(text: "USA, California",color: AppColors.textColor1,)
                        ],
                      ),
                      SizedBox(height: 6,),
                      Row(
                        children: [
                          Wrap(
                              children:
                              List.generate(5, (index) {
                                return Icon(Icons.star,color: index<=gottenStars?AppColors.starColor:AppColors.textColor2,);
                              })

                          ),
                          SizedBox(width: 8,),
                          AppText(text: "(4.6)",color: AppColors.textColor2,)
                        ],
                      ),
                      SizedBox(height: 10,),
                      AppLargeText(text: "People",color: Colors.black.withOpacity(0.8),size: 20,),
                      SizedBox(height: 4,),
                      AppText(text: "Number of people in your group",color: AppColors.mainTextColor,),
                      SizedBox(height: 8,),
                      Wrap(
                        children: List.generate(5, (index){
                          return InkWell(
                            onTap: (){
                              setState(() {
                                selectedIndex=index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              child: AppButton(
                                  color: selectedIndex==index?Colors.white:Colors.black,
                                  backgroundColor: selectedIndex==index?Colors.black:AppColors.buttonBackground,
                                  size: 50,
                                  borderColor:selectedIndex==index?Colors.black: AppColors.buttonBackground,
                              isIcon: false,
                              text: (index+1).toString(),),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 15,),
                      AppLargeText(text: "Description",color: Colors.black.withOpacity(0.8),size: 20,),
                      SizedBox(height: 8,),
                      AppText(text: "You must go for travel. Travelling helps reduce stress.Go to the mountains to see nature",
                      color: AppColors.mainTextColor,),
                      SizedBox(height: 25,),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        right: 20,
                        child: Row(
                          children: [
                            AppButton(color: AppColors.textColor2,
                                backgroundColor: Colors.white,
                                size: 60,
                                borderColor: AppColors.textColor2,
                            isIcon: true,
                            icon: Icons.favorite_border,),
                            SizedBox(width: 20,),
                            ResponsiveButton(
                              isResponsive: true,

                            )
                          ],
                        ),
                      )
                      
                    ],
                  ),

            )),

          ],

        ),
      ),
    );
  }
}
