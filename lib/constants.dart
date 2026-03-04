import 'package:flutter/material.dart';

const Color klinearGradientStart = Color(0xFF9687EF);
const Color klinearGradientEnd = Color(0xBBE36E91);
const Color kBackgroundColor = Color(0xFFD3CBF9);

const TextStyle kBlackBold = TextStyle(
  fontFamily: 'Poppins',
  color: Colors.black,
  fontWeight: FontWeight.w900,
);

const TextStyle kBlackNormal = TextStyle(
  fontFamily: 'Poppins',
  color: Colors.black,
);

const TextStyle kWhiteBold = TextStyle(
  fontFamily: 'Poppins',
  color: Colors.white,
  fontWeight: FontWeight.w900,
);

const TextStyle kWhiteNormalShadow = TextStyle(
  fontFamily: 'Poppins',
  color: Colors.white,
  shadows: [
    Shadow(offset: Offset(-1, -1), color: Colors.black),
    Shadow(offset: Offset(1, -1), color: Colors.black),
    Shadow(offset: Offset(-1, 1), color: Colors.black),
    Shadow(offset: Offset(1, 1), color: Colors.black),
  ],
);

const TextStyle kWhiteNormal = TextStyle(
  fontFamily: 'Poppins',
  color: Colors.white,
);

const TextStyle kWhiteBoldShadow = TextStyle(
  fontFamily: 'Poppins',
  color: Colors.white,
  fontWeight: FontWeight.w900,
  shadows: [
    Shadow(offset: Offset(-1, -1), color: Colors.black),
    Shadow(offset: Offset(1, -1), color: Colors.black),
    Shadow(offset: Offset(-1, 1), color: Colors.black),
    Shadow(offset: Offset(1, 1), color: Colors.black),
  ],
);

const TextStyle kDarkPurpleNormal = TextStyle(
  fontFamily: 'Poppins',
  color: Color(0xFF4A3880),
);

const TextStyle kDarkPurpleBold = TextStyle(
  fontFamily: 'Poppins',
  color: Color(0xFF4A3880),
  fontWeight: FontWeight.w900,
);