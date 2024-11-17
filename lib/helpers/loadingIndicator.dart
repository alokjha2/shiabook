

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';



Widget loading()=>LoadingIndicator(
    indicatorType: Indicator.lineScale, /// Required, The loading type of the widget
    colors: [Colors.orange],       /// Optional, The color collections
    strokeWidth: 2,                     /// Optional, The stroke of the line, only applicable to widget which contains line
    // backgroundColor: Colors.black,      /// Optional, Background of the widget
    // pathBackgroundColor: Colors.black   /// Optional, the stroke backgroundColor
);