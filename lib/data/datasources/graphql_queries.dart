/// GraphQL queries optimized for Shopify Storefront API.
/// 
/// Follows minimum data principle: fetches only fields required by UI
/// to reduce payload size, improve response times, and minimize API costs.
class GraphQLQueries {
  GraphQLQueries._();

  /// Fetches complete product data for detail screen.
  /// 
  /// Fields included:
  /// - descriptionHtml: Required for flutter_html rendering
  /// - priceRange: Enables price range display for multi-variant products
  /// - images(first: 10): Gallery display (10 is reasonable max for mobile UX)
  /// - variants(first: 50): Covers most products (Shopify limit is 100)
  /// - quantityAvailable: Powers stock validation for optimistic UI
  /// - compareAtPrice: Enables discount badge calculation
  /// - selectedOptions: Required for variant selection logic
  static const String getProductByHandle = r'''
    query GetProductByHandle($handle: String!) {
      product(handle: $handle) {
        id
        handle
        title
        descriptionHtml
        vendor
        productType
        tags
        priceRange {
          minVariantPrice {
            amount
            currencyCode
          }
          maxVariantPrice {
            amount
            currencyCode
          }
        }
        images(first: 10) {
          edges {
            node {
              url
              altText
              width
              height
            }
          }
        }
        options {
          id
          name
          values
        }
        variants(first: 50) {
          edges {
            node {
              id
              title
              availableForSale
              quantityAvailable
              selectedOptions {
                name
                value
              }
              price {
                amount
                currencyCode
              }
              compareAtPrice {
                amount
                currencyCode
              }
              image {
                url
                altText
              }
            }
          }
        }
      }
    }
  ''';

  /// Fetches product list for collection/category screens.
  /// 
  /// Excludes expensive fields (variants, images array) since
  /// list view only needs featuredImage and basic metadata.
  /// Includes pagination to support infinite scroll UX.
  static const String getProducts = r'''
    query GetProducts($first: Int!, $after: String) {
      products(first: $first, after: $after) {
        pageInfo {
          hasNextPage
          endCursor
        }
        edges {
          node {
            id
            handle
            title
            descriptionHtml
            vendor
            productType
            featuredImage {
              url
              altText
            }
            priceRange {
              minVariantPrice {
                amount
                currencyCode
              }
              maxVariantPrice {
                amount
                currencyCode
              }
            }
          }
        }
      }
    }
  ''';
}
