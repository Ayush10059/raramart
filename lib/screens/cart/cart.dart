import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raramart/providers/cart_provider.dart';

import 'package:raramart/utils/constants.dart';
import 'package:raramart/utils/helper.dart';

import 'package:raramart/utils/storage.dart';
import 'package:raramart/utils/custom_stepper.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

double _price = 0;
double _deliveryPrice = 0;
double _totalPrice = 0;

int _quantity = 1;

SecureStorage _secureStorage = SecureStorage();

class _CartScreenState extends State<CartScreen> {
  void initState() {
    super.initState();

    _price = 12000;
    _deliveryPrice = 110;
    _totalPrice = 0;
  }

  @override
  Widget build(BuildContext context) {
    return new Consumer<CartNotifier>(
      builder: (context, cart, child) {
        if (cart.allProducts.length == 0) {
          return Container(
            child: Center(
              child: kText(
                text: "No items in Cart",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                textColor: kBlack.withOpacity(0.6),
                maxLines: 2,
              ),
            ),
          );
        } else {
          // calculateTotal(order.allProducts);
          return Scaffold(
            body: ListView.separated(
              itemCount: cart.allProducts.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 80,
                  width: 80,
                  margin: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: kBoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              cart.allProducts[index].product.images?[0].src ??
                                  '',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            kText(
                              text: cart.allProducts[index].product.name ?? '',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              maxLines: 3,
                              overflow: TextOverflow.fade,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            kText(
                              text:
                                  "¥ ${cart.allProducts[index].product.price ?? ''} x ${cart.allProducts[index].quantity}",
                              fontSize: 16,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          kIconButton(
                            icon: Icons.delete_outline_rounded,
                            size: 22,
                            onPressed: () {
                              showConfirmationDialog(
                                context,
                                "Do you want to add $_quantity item(s) to order?",
                                null,
                                "Yes",
                                () {
                                  cart.removeSingleProduct(index);
                                  Navigator.pop(context);
                                },
                                "No",
                                () => Navigator.pop(context),
                              );
                            },
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          CustomStepper(
                            lowerLimit: 1,
                            upperLimit: 20,
                            stepValue: 1,
                            value: cart.allProducts[index].quantity,
                            onChanged: (value) {
                              setState(
                                () => cart.allProducts[index].quantity = value,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 1.0,
                  height: 1.0,
                );
              },
            ),
            persistentFooterButtons: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kText(
                          text: "Sub Total: ¥ ${_price.round() * _quantity}",
                          fontSize: 14,
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                        ),
                        kText(
                          text: "Delivery Charge: ¥ ${_deliveryPrice.round()}",
                          fontSize: 14,
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                        ),
                      ],
                    ),
                    kText(
                      text:
                          "Total: ¥ ${(_price.round() * _quantity) + _deliveryPrice.round()}",
                      fontSize: 14,
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          showConfirmationDialog(
                            context,
                            "Do you want to place an order?",
                            null,
                            "Yes",
                            () {
                              // _orde¥ervice
                              //     .makeOrder(
                              //   _token,
                              //   _companyId,
                              //   order.getOrder,
                              // )
                              //     .then((value) {
                              showSnackBar(
                                context,
                                text: "Order Placed",
                              );
                              // }, onError: (e) {
                              //   FormHelper.showSnackBar(
                              //     context,
                              //     text: "An error Occured",
                              //   );
                              // });

                              // MakeOrderNotifier orderNotifier =
                              //     Provider.of<MakeOrderNotifier>(context,
                              //         listen: false);

                              // orderNotifier.removeAllProducts();

                              Navigator.pop(context);
                            },
                            "No",
                            () => Navigator.pop(context),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Theme.of(context).primaryColor,
                          ),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          // width: AppTheme.fullWidth(context) * 0.7,
                          child: kText(
                            text: 'Checkout',
                            textColor: kWhite,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}


//   void calculateTotal(List<OrderProduct> allProducts) {
//     _subTotalPrice = 0;
//     _servicePrice = 0;
//     _vatPrice = 0;
//     _totalPrice = 0;
//     for (int i = 0; i < allProducts.length; i++) {
//       int linePrice =
//           (allProducts[i].product?.price ?? 0) * (allProducts[i].quantity ?? 1);

//       _subTotalPrice += linePrice;
//     }
//     _servicePrice =
//         ((int.tryPa¥e(_serviceCharge) ?? 10) * _subTotalPrice) / 100;
//     _vatPrice = ((int.tryPa¥e(_vat) ?? 13) * _subTotalPrice) / 100;

//     _totalPrice = _servicePrice + _vatPrice + _subTotalPrice;
//   }
// }
