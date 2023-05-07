import 'package:assignment_test_for_the_zartek/provider/home_provider.dart';
import 'package:assignment_test_for_the_zartek/widgets/sizers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_cart_button.dart';

class ItemDetailes extends StatelessWidget {
  ItemDetailes({super.key, required this.index});
  int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, home, child) {
      return Container(
        padding: const EdgeInsets.all(8),
        height: 205,
        width: 500,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.flood_rounded,
              color: Colors.green,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250,
                  child: Text(
                    home.dishName[index],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 17,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                // price information
                kHeight2,
                SizedBox(
                  width: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'IND ${home.dishPrice[index]}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        '${home.dishCalories[index]} calories',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                kHeight10,
                SizedBox(
                  width: 250,
                  child: Text(
                    "${home.dishDescription[index]}",
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                kHeight10, kHeight5,
                AddCartButton(index: index,),
                kHeight10,
                Text(
                  home.addonCat[index].isEmpty ? "" : 'Customizable available',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Container(
                height: 70,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                    image: NetworkImage('${home.dishImage[index]}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
