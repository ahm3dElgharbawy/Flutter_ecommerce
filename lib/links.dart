class Links {
  static String serverLink           = "https://ecommerce4test.000webhostapp.com";
  static String imagesPath           = "$serverLink/uploads";
  // login & signup
  static String signupRoute          = "$serverLink/auth/signup.php";
  static String loginRoute           = "$serverLink/auth/login.php";
  static String verifyCode           = "$serverLink/auth/verifyCode.php";
  static String resendVerifyCode     = "$serverLink/auth/resendVerifyCode.php";
  // forgot password
  static String checkEmail           = "$serverLink/auth/checkEmail.php";
  static String resetPassword        = "$serverLink/auth/resetPassword.php";
  // home page
  static String home                 = "$serverLink/home.php";
  // offers 
  static String offers               = "$serverLink/products/offers.php";
  // products page
  static String products             = "$serverLink/products/products.php";
  // favorite
  static String addFavorite          = "$serverLink/products/favorite/addFavorite.php";
  static String removeFavorite       = "$serverLink/products/favorite/removeFavorite.php";
  static String favorites            = "$serverLink/products/favorite/favorites.php";
  static String removeFromFavorites  = "$serverLink/products/favorite/removeFromFavorites.php";
  // cart 
  static String addToCart            = "$serverLink/cart/addToCart.php";
  static String removeFromCart       = "$serverLink/cart/removeFromCart.php";
  static String getProductQuantity   = "$serverLink/cart/getProductQuantity.php";
  static String viewCart             = "$serverLink/cart/viewCart.php";
  static String coupon               = "$serverLink/cart/coupon.php";
  // search 
  static String search               = "$serverLink/search/search.php";
  // address
  static String addAddress           = "$serverLink/address/addAddress.php";
  static String viewAddress          = "$serverLink/address/viewAddress.php";
  static String removeAddress        = "$serverLink/address/removeAddress.php";
  // checkout
  static String checkout             = "$serverLink/orders/checkout.php";
  // orders 
  static String orders               = "$serverLink/orders/orders.php";
  static String orderDetails         = "$serverLink/orders/orderDetails.php";
  static String removeOrder          = "$serverLink/orders/removeOrder.php";
  static String archivedOrders       = "$serverLink/orders/archivedOrders.php";
  static String rating               = "$serverLink/orders/rating.php";
  // notifications
  static String notifications        = "$serverLink/notifications/viewNotifications.php";



}