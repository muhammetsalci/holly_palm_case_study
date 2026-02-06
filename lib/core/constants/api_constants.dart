/// Shopify Storefront API configuration constants.
class ApiConstants {
  ApiConstants._();

  static const String baseUrl =
      'https://hollypalm-test.myshopify.com/api/2024-01/graphql.json';

  static const String storefrontAccessToken =
      '00e75e3bfd60f9cbb0d4f357c372d2b0';

  static const String productHandle = 'selling-plans-ski-wax';

  static const Duration requestTimeout = Duration(seconds: 30);
}
