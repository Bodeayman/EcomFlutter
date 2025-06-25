// import 'package:ecomflutter/pages/PaymentScreens/payment_view.dart';
// import 'package:flutter/material.dart';

// class CheckoutDialog extends StatelessWidget {
//   const CheckoutDialog({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: Container(
//         width: 300,
//         height: 200,
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Text(
//               'Payment Method',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,

//               children: [
//                 InkWell(
//                   onTap: () {
//                     value.clearCart();
//                     Navigator.of(newContext).pop();
//                     // BlocProvider.of<
//                     //   StripePaymentCubit
//                     // >(context).makePayment(
//                     //   paymentIntentmodel:
//                     //       PaymentIntentInputModel(
//                     //         amount: "100",
//                     //         currency: "USD",
//                     //       ),
//                     // );

//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text("Purchase Successful")),
//                     );
//                     value.totalPrice = 0;
//                     Navigator.of(context).push(
//                       MaterialPageRoute(builder: (context) => PaymentView()),
//                     );
//                   },
//                   child: SizedBox(
//                     height: 59,
//                     width: 59,
//                     child: Container(
//                       width: 100, // Adjust size as needed
//                       height: 100,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(
//                           30,
//                         ), // Make sure this value is reasonable
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(30),
//                         child: Image.asset(
//                           "assets/img/stripe.png",
//                           fit:
//                               BoxFit
//                                   .cover, // Ensures it fills the rounded shape
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 50, width: 100),
//               ],
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Close'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// // Underconstruction here