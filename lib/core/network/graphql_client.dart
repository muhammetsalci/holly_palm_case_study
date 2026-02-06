import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../constants/api_constants.dart';

/// Singleton GraphQL client for Shopify Storefront API.
/// 
/// Uses networkOnly fetch policy to ensure fresh data,
/// avoiding stale cache issues with product availability.
class GraphQLClientProvider {
  GraphQLClientProvider._();

  static GraphQLClient? _client;

  static GraphQLClient get client {
    _client ??= _createClient();
    return _client!;
  }

  static GraphQLClient _createClient() {
    final HttpLink httpLink = HttpLink(
      ApiConstants.baseUrl,
      defaultHeaders: {
        'X-Shopify-Storefront-Access-Token': ApiConstants.storefrontAccessToken,
        'Content-Type': 'application/json',
      },
    );

    final Link link = httpLink;

    return GraphQLClient(
      link: link,
      cache: GraphQLCache(store: InMemoryStore()),
      defaultPolicies: DefaultPolicies(
        query: Policies(fetch: FetchPolicy.networkOnly),
      ),
    );
  }

  static void reset() {
    _client = null;
  }

  static Future<QueryResult> query(
    String queryString, {
    Map<String, dynamic>? variables,
  }) async {
    final QueryOptions options = QueryOptions(
      document: gql(queryString),
      variables: variables ?? {},
      fetchPolicy: FetchPolicy.networkOnly,
    );

    final result = await client.query(options);

    if (kDebugMode) {
      if (result.hasException) {
        print('GraphQL Error: ${result.exception}');
      } else {
        print('GraphQL Query Success');
      }
    }

    return result;
  }

  static Future<QueryResult> mutate(
    String mutationString, {
    Map<String, dynamic>? variables,
  }) async {
    final MutationOptions options = MutationOptions(
      document: gql(mutationString),
      variables: variables ?? {},
    );

    final result = await client.mutate(options);

    if (kDebugMode) {
      if (result.hasException) {
        print('GraphQL Mutation Error: ${result.exception}');
      } else {
        print('GraphQL Mutation Success');
      }
    }

    return result;
  }
}
