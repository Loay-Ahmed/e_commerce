import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/colors.dart';
import '../../../core/data/model/product.dart';
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
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/background_details.png'),
                           fit: BoxFit.cover,
                        ),
                    ),
                 //  color: Colors.black.,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Placeholder(
                      child:Image.asset(product.imageUrl
                       , height: 180,
                        ),
                      fallbackHeight: 180,
                      color: Colors.transparent,
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  right: 16,
                  child: CustomAppBar(title: ''),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
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
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.orange, size: 18),
                                SizedBox(width: 4),
                                Text("${product.rating}", style: TextStyle(fontSize: 14)),
                                Text("  (30+)", style: TextStyle(fontSize: 12, color: Colors.grey)),
                                Text("المراجعة",style: TextStyle(color: CustomColors.green1_500,decoration: TextDecoration.underline),)
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              "${product.price} جنية / الكيلو",
                              style: TextStyle(color: Colors.orange, fontSize: 16),
                              textAlign: TextAlign.right,
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
                                decoration: BoxDecoration(
                                  color: CustomColors.green1_500,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: Image.asset('assets/images/plus.png',width:16,height: 16 ,color:Colors.white),
                                  onPressed: () {
                                     {
                                      setState(() => quantity++);
                                    }
                                  },
                                ),
                              ),

                              Text("$quantity", style: TextStyle(fontSize: 16)),
                              Container(
                          decoration: BoxDecoration(
                          color: CustomColors.whitef7,
                          shape: BoxShape.circle,
                          ),
                                child: IconButton(
                                  icon: Image.asset('assets/images/minus.png',width: 36,height: 36,color:Colors.white ),
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


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
              child: Text(
                "${product.productName} ينتمي إلى الفصيلة القرعية ويشتهر بأنه حلو المذاق...",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 2.5,
                children: [
                  _buildInfoCard('assets/images/exipdate.png', 'عام', 'الصلاحية'),
                  _buildInfoCard('assets/images/organic.png', '100%', 'أورجانيك'),
                  _buildInfoCard('assets/images/calories.png', '${product.calories} كالوري', 'لكل 100 جرام'),
                  _buildInfoCard('assets/images/star.png', '${product.rating}', 'التقييم'),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SizedBox(
                width:343,
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: CustomColors.green1_500,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                  ),
                    padding: EdgeInsets.only(top: 15,right: 48,bottom: 15,left: 48),
                    elevation: 4,
                  ),
                  onPressed: () {},
                  child: Text("أضف إلى السلة",
                      style: GoogleFonts.cairo(fontSize: 14,color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String imagePath, String value, String label) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 30,
            height: 30,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(label, style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          )
        ],
      ),
    );
  }

}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
