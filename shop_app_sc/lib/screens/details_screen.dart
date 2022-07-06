import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/models/Product.dart';
import 'package:stylish/screens/home/components/color_dot.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: product.bgColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const BackButton(
            color: Colors.black,
          ),
          actions: [
            IconButton(
              icon: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset(
                    "assets/icons/Heart.svg",
                    height: 20,
                  )),
              onPressed: () {},
            )
          ],
        ),
        body: Column(
          children: [
            Image.asset(
              product.image,
              height: MediaQuery.of(context).size.height * 0.4,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(defaultPadding,
                    defaultPadding * 2, defaultPadding, defaultPadding),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(defaultBorderRadius * 3),
                    topRight: Radius.circular(defaultBorderRadius * 3),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            "₹" + product.price.toString(),
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: defaultPadding),
                        child: Text(
                            "A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5inches (8 to 13 cm) long and usually having 2-5 buttons."),
                      ),
                      const Text(
                        "Colors",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: defaultPadding / 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ColorDot(
                            color: const Color(0xFFBEE8EA),
                            isActive: false,
                            press: () {},
                          ),
                          ColorDot(
                            color: const Color(0xFF141B4A),
                            isActive: true,
                            press: () {},
                          ),
                          ColorDot(
                            color: const Color(0xFFF4E5C3),
                            isActive: false,
                            press: () {},
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: defaultPadding * 1.5,
                      ),
                      Center(
                        child: SizedBox(
                          width: 200,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: primaryColor,
                              shape: StadiumBorder(),
                            ),
                            child: const Text('Add to Cart'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
