class APIs {
  APIs._();

  // Base url
  static const String baseUrl = "https://diadem.ideablitztech.com";

  //base api url
  static const String baseApiUrl = "$baseUrl/api/mobile";

  //token generation url
  static const String tokenGenerate = "$baseApiUrl/token_generate";

  //token refresh
  static const String tokenRefresh = "$baseApiUrl/token_refresh";

  // otp url
  static const String userOtpResend = "$baseApiUrl/user_otp_send";

  // login url
  static const String loginWithOtp = "$baseApiUrl/user_otp_login";

  // banner url
  static const String banner = "$baseApiUrl/home_screen?option=banner";

  // shop by category url
  static const String homeShopByCategory =
      "$baseApiUrl/home_screen?option=shop_by_category";
  // shop by category url
  static const String shopBySubCategory = "$baseApiUrl/shop_by_sub_category";

  // user registration
  static const String userRegistration = "$baseApiUrl/user_register";

  // user shopping type
  static const String shoppingType = "$baseApiUrl/shopping_type";

  // user whats new
  static const String whatsNew = "$baseApiUrl/home_screen?option=whats_new";

  // popular products
  static const String popularProducts =
      "$baseApiUrl/home_screen?option=popular";

  // popular products
  static const String ashirahSarees =
      "$baseApiUrl/home_screen?option=ashirah_sarees";

  // popular products
  static const String productCategoryVideo = "$baseApiUrl/product_listing";

  // product listing top picked products
  static const String topPickedProducts = "$baseApiUrl/product_listing";

  // product listing top picked products
  static const String categoryProducts = "$baseApiUrl/product_listing";

  // product listing top picked products
  static const String productListingBanner = "$baseApiUrl/product_listing";

  // product listing top picked products
  static const String productDetails = "$baseApiUrl/product_details";

  // product get size by color
  static const String getSizeByColor = "$baseApiUrl/get_color_by_size_select";

  // product select Color Variant
  static const String selectColorVariant = "$baseApiUrl/select_color_variant";

  // product generating unique id
  static const String uniqueId = "$baseApiUrl/appinfo?type=0";

  // product add to cart
  static const String addToCart = "$baseApiUrl/addtocart";

  // product view cart
  static const String viewCart = "$baseApiUrl/viewcart";

  // area details
  static const String areaDetails = "$baseApiUrl/appinfo?type=1";

  // add shipping address
  static const String addShippingAddress = "$baseApiUrl/address/add";

  // add shipping address
  static const String listShippingAddress = "$baseApiUrl/address";

  // remove cart
  static const String removeCart = "$baseApiUrl/removecart";

  // userData
  static const String userData = "$baseApiUrl/appinfo?type=2";

  // checkout
  static const String checkout = "$baseApiUrl/checkout";

  // place order
  static const String placeOrder = "$baseApiUrl/placeorder";

  // my orders
  static const String orders = "$baseApiUrl/myorders";

  // my orders
  static const String orderDetails = "$baseApiUrl/orderdetail";

  // my orders
  static const String addToWishlist = "$baseApiUrl/orderdetail";
}
