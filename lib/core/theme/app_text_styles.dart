import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// TextTheme _buildTextTheme(TextTheme base) {
//   return base
//       .copyWith(
//         // H1 / Title-XL
//         displayLarge: GoogleFonts.montserrat(
//           fontSize: 32,
//           fontWeight: FontWeight.bold,
//           color: AppColors.textPrimary,
//         ),
//         // H2 / Title-L
//         displayMedium: GoogleFonts.montserrat(
//           fontSize: 24,
//           fontWeight: FontWeight.bold,
//           color: AppColors.textPrimary,
//         ),
//         // H3 / Title-M
//         displaySmall: GoogleFonts.montserrat(
//           fontSize: 20,
//           fontWeight: FontWeight.w600, // SemiBold
//           color: AppColors.textPrimary,
//         ),

//         // Body-L / Main
//         bodyLarge: GoogleFonts.inter(
//           fontSize: 16,
//           fontWeight: FontWeight.normal,
//           color: AppColors.textPrimary,
//         ),
//         // Body-M / Secondary
//         bodyMedium: GoogleFonts.inter(
//           fontSize: 14,
//           fontWeight: FontWeight.normal,
//           color: AppColors.textSecondary,
//         ),

//         // Button
//         labelLarge: GoogleFonts.inter(
//           fontSize: 16,
//           fontWeight: FontWeight.w500, // Medium
//           color: AppColors.textPrimary,
//         ),

//         // Caption
//         bodySmall: GoogleFonts.inter(
//           fontSize: 12,
//           fontWeight: FontWeight.normal,
//           color: AppColors.textSecondary,
//         ),
//       )
//       .apply(
//         bodyColor: AppColors.textPrimary,
//         displayColor: AppColors.textPrimary,
//       );
// }

class AppTextStyles {
  static final TextStyle h1 = GoogleFonts.montserrat(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
  static final TextStyle h2 = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
  static final TextStyle h3 = GoogleFonts.montserrat(
    fontSize: 20,
    fontWeight: FontWeight.w600, // SemiBold
    color: AppColors.textPrimary,
  );
  static final TextStyle bodyL = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );
  static final TextStyle bodyM = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );
  static final TextStyle button = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500, // Medium
  );
  static final TextStyle caption = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );
  static final TextStyle nameParticipant = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );
}
