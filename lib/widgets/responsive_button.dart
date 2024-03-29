import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;

   ResponsiveButton({super.key,
  this.isResponsive,this.width=120});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width:isResponsive==true?double.maxFinite: width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor
        ),
        child: Row(
          mainAxisAlignment: isResponsive==true?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
        children: [
          isResponsive==true? Container(margin:EdgeInsets.only(left: 20),
              child: AppText(text: "Book Trip Now",color:Colors.white,)):Container(),
          Image.asset('assets/button-one.png')
        ],
        ),
      
      ),
    );
  }
}
