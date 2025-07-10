import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/colors.dart';
import '../../../core/data/model/product.dart';
import '../../../core/widgets/custom_button.dart';
import '../../auth/widgets/custom_app_bar.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    height: 350,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/background_details.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    //  color: Colors.black.,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomAppBar(title: ''),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Placeholder(
                            fallbackHeight: 180,
                            color: Colors.transparent,
                            child: Image.asset(product.imageUrl, height: 180),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Positioned(
                //   top: 16,
                //   left: 16,
                //   right: 16,
                //   child: CustomAppBar(title: ''),
                // ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: Builder(
                builder: (context) {
                  int quantity = 1;
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.productName,
                              style: GoogleFonts.cairo(
                                fontWeight: FontWeight.w700,
                                fontSize: 22,
                                color: CustomColors.grey950,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(height: 4),
                            Text(
                              "${product.price} جنية / الكيلو",
                              style: GoogleFonts.cairo(
                                color: Colors.orange,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 18),
                                SizedBox(width: 8),
                                Text(
                                  "${product.rating}",
                                  style: GoogleFonts.cairo(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "  (30+)",
                                  style: GoogleFonts.cairo(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "المراجعة",
                                  style: GoogleFonts.cairo(
                                    color: CustomColors.green1_500,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 16),

                      StatefulBuilder(
                        builder: (context, setState) {
                          return Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: CustomColors.green1_500,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: Image.asset(
                                    'assets/images/plus.png',
                                    width: 16,
                                    height: 16,
                                    // color: Colors.white,
                                  ),
                                  onPressed: () {
                                    {
                                      setState(() => quantity++);
                                    }
                                  },
                                ),
                              ),
                              SizedBox(width: 16),
                              Text(
                                "$quantity",
                                style: GoogleFonts.cairo(fontSize: 16),
                              ),
                              SizedBox(width: 16),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color(0xffF3F5F7),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: Image.asset(
                                    'assets/images/minus.png',
                                    width: 16,
                                    height: 16,
                                    // color,
                                  ),
                                  onPressed: () {
                                    setState(() => quantity--);
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),

            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 4,
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      "${product.productName} ينتمي إلى الفصيلة القرعية ويشتهر بأنه حلو المذاق...",
                      style: GoogleFonts.cairo(
                        color: CustomColors.lightGrey,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            GridView.extent(
              maxCrossAxisExtent: 342,
              shrinkWrap: true,
              mainAxisSpacing: 30,
              crossAxisSpacing: 15,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 20),
              childAspectRatio: 1.9,
              children: [
                _buildInfoCard('assets/images/exipdate.png', 'عام', 'الصلاحية'),
                _buildInfoCard('assets/images/organic.png', '100%', 'أورجانيك'),
                _buildInfoCard(
                  'assets/images/calories.png',
                  '${product.calories} كالوري',
                  'لكل 100 جرام',
                ),
                _buildInfoCard(
                  'assets/images/star.png',
                  '${product.rating}',
                  'التقييم',
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: SizedBox(
                width: 343,
                height: 54,
                child: CustomButton(text: "أضف الي السلة", onPress: () {}),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String imagePath, String value, String label) {
    return Container(
      padding: EdgeInsets.all(12),
      width: 163,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      alignment: Alignment.center,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value,
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: CustomColors.lightGreen,
                  ),
                ),
                Text(
                  label,
                  style: GoogleFonts.cairo(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.contain),
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
