import 'package:flutter/material.dart';

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
    // return new Consumer<MakeOrderNotifier>(
    // builder: (context, order, child) {
    // if (order.allProducts.length == 0) {
    //   return Scaffold(
    //     backgroundColor: Theme.of(context).backgroundColor,
    //     appBar: buildAppBar(context, title: 'Cart'),
    //     body: Center(
    //       child: Text(
    //         "Please add to order",
    //         style: Theme.of(context).textTheme.headline4,
    //         maxLines: 3,
    //       ),
    //     ),
    //   );
    // } else {
    // calculateTotal(order.allProducts);
    return Scaffold(
      body: ListView.separated(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              // order.removeSingleProduct(index);
            },
            confirmDismiss: (DismissDirection dismissDirection) async {
              // return await showConfirmationDialog(
              //         context, "remove this item") ==
              //     true;
            },
            background: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              color: kRed,
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.cancel,
                color: kWhite,
              ),
            ),
            secondaryBackground: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              color: kRed,
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.cancel,
                color: kWhite,
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kText(
                          text: "Iphone 12",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          maxLines: 3,
                          overflow: TextOverflow.fade,
                        ),
                        kText(
                          text: "¥ $_price x $_quantity",
                          fontSize: 16,
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  CustomStepper(
                    lowerLimit: 1,
                    upperLimit: 20,
                    stepValue: 1,
                    value: _quantity,
                    onChanged: (value) {
                      setState(() => _quantity = value);
                    },
                  ),
                ],
              ),
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
    // }
    //   },
    // );
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
