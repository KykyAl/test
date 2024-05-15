import 'package:flutter/material.dart';

class ResolutionSize{
  SizedBox normalResolutionSpaceHeight = SizedBox(height:10 ,);
  SizedBox smallResolutionSpaceHeight = SizedBox(height:5 ,);
  SizedBox mediumResolutionSpaceHeight = SizedBox(height:15 ,);
  SizedBox largeResolutionSpaceHeight = SizedBox(height:20 ,);

  //WiDTH Resolution
  
  SizedBox normalResolutionSpaceWidth = SizedBox(width:10 ,);
  SizedBox smallResolutionSpaceWidth = SizedBox(width:5 ,);
  SizedBox mediumResolutionSpaceWidth = SizedBox(width:15 ,);
  SizedBox largeResolutionSpaceWidth = SizedBox(width:10 ,);

  SizedBox costumizeResolution({double? height, double? width}){
    return SizedBox(
      height: height,
      width: width,
    );
  }
}

ResolutionSize resolutionSize = ResolutionSize();