import 'package:ecommerce/core/middleware/onboarding_middleware.dart';
import 'package:ecommerce/view/screen/address/add_address.dart';
import 'package:ecommerce/view/screen/address/address_details.dart';
import 'package:ecommerce/view/screen/address/view_address.dart';
import 'package:ecommerce/view/screen/auth/forget%20password/forget_password.dart';
import 'package:ecommerce/view/screen/auth/forget%20password/reset_password.dart';
import 'package:ecommerce/view/screen/auth/forget%20password/success_reset_password.dart';
import 'package:ecommerce/view/screen/auth/forget%20password/verify_code_forget_password.dart';
import 'package:ecommerce/view/screen/auth/login/login.dart';
import 'package:ecommerce/view/screen/auth/signup/signup.dart';
import 'package:ecommerce/view/screen/auth/signup/success_signup.dart';
import 'package:ecommerce/view/screen/auth/signup/verify_code_signup.dart';
import 'package:ecommerce/view/screen/cart/cart.dart';
import 'package:ecommerce/view/screen/checkout/checkout.dart';
import 'package:ecommerce/view/screen/favorites/favorites_page.dart';
import 'package:ecommerce/view/screen/home/home_page.dart';
import 'package:ecommerce/view/screen/language.dart';
import 'package:ecommerce/view/screen/notifications/notifications.dart';
import 'package:ecommerce/view/screen/offers.dart';
import 'package:ecommerce/view/screen/onboarding.dart';
import 'package:ecommerce/view/screen/orders/archived_orders.dart';
import 'package:ecommerce/view/screen/orders/order_details.dart';
import 'package:ecommerce/view/screen/orders/orders.dart';
import 'package:ecommerce/view/screen/orders/tracking.dart';
import 'package:ecommerce/view/screen/productDetails/product_details.dart';
import 'package:ecommerce/view/screen/products/products_page.dart';
import 'package:ecommerce/test.dart';
import 'package:get/get.dart';

import 'core/constants/app_routes.dart';

List<GetPage> routes = [
  GetPage(
    name: "/",
    page: () => const Language(),
    middlewares: [OnBoardingMiddleware()],
  ),
  // GetPage(
  //   name: "/",
  //   page: () => const Test(),
  // ),
  //onBoarding
  GetPage(name: AppRoutes.onBoarding, page: () => const OnBoarding()),
  // auth
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.signUp, page: () => const SignUp()),
  GetPage(name: AppRoutes.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoutes.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),
  // reset password
  GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoutes.verifyCodeForgetPassword,page: () => const VerifyCodeForgetPassword()),
  GetPage(name: AppRoutes.successResetPassword,page: () => const SuccessResetPassword()),
  // home
  GetPage(name: AppRoutes.homePage, page: () => const HomePage()),
  // products
  GetPage(name: AppRoutes.productsPage, page: () => const ProductsPage()),
  GetPage(name: AppRoutes.productDetails, page: () => const ProductDetails()),
  // offers
  GetPage(name: AppRoutes.offers, page: () => const Offers()),

  //favorite
  GetPage(name: AppRoutes.favoritesPage, page: () => const FavoritesPage()),
  //cart
  GetPage(name: AppRoutes.cart, page: () => const Cart()),
  // address
  GetPage(name: AppRoutes.viewAddress, page: () => const ViewAddress()),
  GetPage(name: AppRoutes.addAddress, page: () => const AddAddress()),
  GetPage(name: AppRoutes.addressDetails, page: () => const AddressDetails()),
  // checkout
  GetPage(name: AppRoutes.checkout, page: () => const Checkout()),
  // orders
  GetPage(name: AppRoutes.orders, page: () => const Orders()),
  GetPage(name: AppRoutes.orderDetails, page: () => const OrderDetails()),
  GetPage(name: AppRoutes.archivedOrders, page: () => const ArchivedOrders()),
  GetPage(name: AppRoutes.orderTracking, page: () => const Tracking()),
  // notifications
  GetPage(name: AppRoutes.notifications, page: () => const Notifications()),

];
