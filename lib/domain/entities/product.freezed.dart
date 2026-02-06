// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Product {
  /// Unique identifier (Shopify GID)
  String get id => throw _privateConstructorUsedError;

  /// Product handle (URL slug)
  String get handle => throw _privateConstructorUsedError;

  /// Product title
  String get title => throw _privateConstructorUsedError;

  /// Product description (HTML format)
  String get descriptionHtml => throw _privateConstructorUsedError;

  /// Product vendor/brand
  String? get vendor => throw _privateConstructorUsedError;

  /// Product type/category
  String? get productType => throw _privateConstructorUsedError;

  /// Product tags
  List<String> get tags => throw _privateConstructorUsedError;

  /// All product images
  List<ProductImage> get images => throw _privateConstructorUsedError;

  /// All product variants
  List<Variant> get variants => throw _privateConstructorUsedError;

  /// Available product options (Color, Size options)
  List<ProductOption> get options => throw _privateConstructorUsedError;

  /// Price range from API
  PriceRange? get apiPriceRange => throw _privateConstructorUsedError;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call({
    String id,
    String handle,
    String title,
    String descriptionHtml,
    String? vendor,
    String? productType,
    List<String> tags,
    List<ProductImage> images,
    List<Variant> variants,
    List<ProductOption> options,
    PriceRange? apiPriceRange,
  });

  $PriceRangeCopyWith<$Res>? get apiPriceRange;
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? handle = null,
    Object? title = null,
    Object? descriptionHtml = null,
    Object? vendor = freezed,
    Object? productType = freezed,
    Object? tags = null,
    Object? images = null,
    Object? variants = null,
    Object? options = null,
    Object? apiPriceRange = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            handle: null == handle
                ? _value.handle
                : handle // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            descriptionHtml: null == descriptionHtml
                ? _value.descriptionHtml
                : descriptionHtml // ignore: cast_nullable_to_non_nullable
                      as String,
            vendor: freezed == vendor
                ? _value.vendor
                : vendor // ignore: cast_nullable_to_non_nullable
                      as String?,
            productType: freezed == productType
                ? _value.productType
                : productType // ignore: cast_nullable_to_non_nullable
                      as String?,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            images: null == images
                ? _value.images
                : images // ignore: cast_nullable_to_non_nullable
                      as List<ProductImage>,
            variants: null == variants
                ? _value.variants
                : variants // ignore: cast_nullable_to_non_nullable
                      as List<Variant>,
            options: null == options
                ? _value.options
                : options // ignore: cast_nullable_to_non_nullable
                      as List<ProductOption>,
            apiPriceRange: freezed == apiPriceRange
                ? _value.apiPriceRange
                : apiPriceRange // ignore: cast_nullable_to_non_nullable
                      as PriceRange?,
          )
          as $Val,
    );
  }

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PriceRangeCopyWith<$Res>? get apiPriceRange {
    if (_value.apiPriceRange == null) {
      return null;
    }

    return $PriceRangeCopyWith<$Res>(_value.apiPriceRange!, (value) {
      return _then(_value.copyWith(apiPriceRange: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
    _$ProductImpl value,
    $Res Function(_$ProductImpl) then,
  ) = __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String handle,
    String title,
    String descriptionHtml,
    String? vendor,
    String? productType,
    List<String> tags,
    List<ProductImage> images,
    List<Variant> variants,
    List<ProductOption> options,
    PriceRange? apiPriceRange,
  });

  @override
  $PriceRangeCopyWith<$Res>? get apiPriceRange;
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
    _$ProductImpl _value,
    $Res Function(_$ProductImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? handle = null,
    Object? title = null,
    Object? descriptionHtml = null,
    Object? vendor = freezed,
    Object? productType = freezed,
    Object? tags = null,
    Object? images = null,
    Object? variants = null,
    Object? options = null,
    Object? apiPriceRange = freezed,
  }) {
    return _then(
      _$ProductImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        handle: null == handle
            ? _value.handle
            : handle // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        descriptionHtml: null == descriptionHtml
            ? _value.descriptionHtml
            : descriptionHtml // ignore: cast_nullable_to_non_nullable
                  as String,
        vendor: freezed == vendor
            ? _value.vendor
            : vendor // ignore: cast_nullable_to_non_nullable
                  as String?,
        productType: freezed == productType
            ? _value.productType
            : productType // ignore: cast_nullable_to_non_nullable
                  as String?,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        images: null == images
            ? _value._images
            : images // ignore: cast_nullable_to_non_nullable
                  as List<ProductImage>,
        variants: null == variants
            ? _value._variants
            : variants // ignore: cast_nullable_to_non_nullable
                  as List<Variant>,
        options: null == options
            ? _value._options
            : options // ignore: cast_nullable_to_non_nullable
                  as List<ProductOption>,
        apiPriceRange: freezed == apiPriceRange
            ? _value.apiPriceRange
            : apiPriceRange // ignore: cast_nullable_to_non_nullable
                  as PriceRange?,
      ),
    );
  }
}

/// @nodoc

class _$ProductImpl extends _Product {
  const _$ProductImpl({
    required this.id,
    required this.handle,
    required this.title,
    required this.descriptionHtml,
    this.vendor,
    this.productType,
    final List<String> tags = const [],
    required final List<ProductImage> images,
    required final List<Variant> variants,
    required final List<ProductOption> options,
    this.apiPriceRange,
  }) : _tags = tags,
       _images = images,
       _variants = variants,
       _options = options,
       super._();

  /// Unique identifier (Shopify GID)
  @override
  final String id;

  /// Product handle (URL slug)
  @override
  final String handle;

  /// Product title
  @override
  final String title;

  /// Product description (HTML format)
  @override
  final String descriptionHtml;

  /// Product vendor/brand
  @override
  final String? vendor;

  /// Product type/category
  @override
  final String? productType;

  /// Product tags
  final List<String> _tags;

  /// Product tags
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  /// All product images
  final List<ProductImage> _images;

  /// All product images
  @override
  List<ProductImage> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  /// All product variants
  final List<Variant> _variants;

  /// All product variants
  @override
  List<Variant> get variants {
    if (_variants is EqualUnmodifiableListView) return _variants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variants);
  }

  /// Available product options (Color, Size options)
  final List<ProductOption> _options;

  /// Available product options (Color, Size options)
  @override
  List<ProductOption> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  /// Price range from API
  @override
  final PriceRange? apiPriceRange;

  @override
  String toString() {
    return 'Product(id: $id, handle: $handle, title: $title, descriptionHtml: $descriptionHtml, vendor: $vendor, productType: $productType, tags: $tags, images: $images, variants: $variants, options: $options, apiPriceRange: $apiPriceRange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.handle, handle) || other.handle == handle) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.descriptionHtml, descriptionHtml) ||
                other.descriptionHtml == descriptionHtml) &&
            (identical(other.vendor, vendor) || other.vendor == vendor) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._variants, _variants) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.apiPriceRange, apiPriceRange) ||
                other.apiPriceRange == apiPriceRange));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    handle,
    title,
    descriptionHtml,
    vendor,
    productType,
    const DeepCollectionEquality().hash(_tags),
    const DeepCollectionEquality().hash(_images),
    const DeepCollectionEquality().hash(_variants),
    const DeepCollectionEquality().hash(_options),
    apiPriceRange,
  );

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);
}

abstract class _Product extends Product {
  const factory _Product({
    required final String id,
    required final String handle,
    required final String title,
    required final String descriptionHtml,
    final String? vendor,
    final String? productType,
    final List<String> tags,
    required final List<ProductImage> images,
    required final List<Variant> variants,
    required final List<ProductOption> options,
    final PriceRange? apiPriceRange,
  }) = _$ProductImpl;
  const _Product._() : super._();

  /// Unique identifier (Shopify GID)
  @override
  String get id;

  /// Product handle (URL slug)
  @override
  String get handle;

  /// Product title
  @override
  String get title;

  /// Product description (HTML format)
  @override
  String get descriptionHtml;

  /// Product vendor/brand
  @override
  String? get vendor;

  /// Product type/category
  @override
  String? get productType;

  /// Product tags
  @override
  List<String> get tags;

  /// All product images
  @override
  List<ProductImage> get images;

  /// All product variants
  @override
  List<Variant> get variants;

  /// Available product options (Color, Size options)
  @override
  List<ProductOption> get options;

  /// Price range from API
  @override
  PriceRange? get apiPriceRange;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PriceRange {
  Money get minPrice => throw _privateConstructorUsedError;
  Money get maxPrice => throw _privateConstructorUsedError;

  /// Create a copy of PriceRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PriceRangeCopyWith<PriceRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceRangeCopyWith<$Res> {
  factory $PriceRangeCopyWith(
    PriceRange value,
    $Res Function(PriceRange) then,
  ) = _$PriceRangeCopyWithImpl<$Res, PriceRange>;
  @useResult
  $Res call({Money minPrice, Money maxPrice});

  $MoneyCopyWith<$Res> get minPrice;
  $MoneyCopyWith<$Res> get maxPrice;
}

/// @nodoc
class _$PriceRangeCopyWithImpl<$Res, $Val extends PriceRange>
    implements $PriceRangeCopyWith<$Res> {
  _$PriceRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PriceRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? minPrice = null, Object? maxPrice = null}) {
    return _then(
      _value.copyWith(
            minPrice: null == minPrice
                ? _value.minPrice
                : minPrice // ignore: cast_nullable_to_non_nullable
                      as Money,
            maxPrice: null == maxPrice
                ? _value.maxPrice
                : maxPrice // ignore: cast_nullable_to_non_nullable
                      as Money,
          )
          as $Val,
    );
  }

  /// Create a copy of PriceRange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MoneyCopyWith<$Res> get minPrice {
    return $MoneyCopyWith<$Res>(_value.minPrice, (value) {
      return _then(_value.copyWith(minPrice: value) as $Val);
    });
  }

  /// Create a copy of PriceRange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MoneyCopyWith<$Res> get maxPrice {
    return $MoneyCopyWith<$Res>(_value.maxPrice, (value) {
      return _then(_value.copyWith(maxPrice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PriceRangeImplCopyWith<$Res>
    implements $PriceRangeCopyWith<$Res> {
  factory _$$PriceRangeImplCopyWith(
    _$PriceRangeImpl value,
    $Res Function(_$PriceRangeImpl) then,
  ) = __$$PriceRangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Money minPrice, Money maxPrice});

  @override
  $MoneyCopyWith<$Res> get minPrice;
  @override
  $MoneyCopyWith<$Res> get maxPrice;
}

/// @nodoc
class __$$PriceRangeImplCopyWithImpl<$Res>
    extends _$PriceRangeCopyWithImpl<$Res, _$PriceRangeImpl>
    implements _$$PriceRangeImplCopyWith<$Res> {
  __$$PriceRangeImplCopyWithImpl(
    _$PriceRangeImpl _value,
    $Res Function(_$PriceRangeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PriceRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? minPrice = null, Object? maxPrice = null}) {
    return _then(
      _$PriceRangeImpl(
        minPrice: null == minPrice
            ? _value.minPrice
            : minPrice // ignore: cast_nullable_to_non_nullable
                  as Money,
        maxPrice: null == maxPrice
            ? _value.maxPrice
            : maxPrice // ignore: cast_nullable_to_non_nullable
                  as Money,
      ),
    );
  }
}

/// @nodoc

class _$PriceRangeImpl extends _PriceRange {
  const _$PriceRangeImpl({required this.minPrice, required this.maxPrice})
    : super._();

  @override
  final Money minPrice;
  @override
  final Money maxPrice;

  @override
  String toString() {
    return 'PriceRange(minPrice: $minPrice, maxPrice: $maxPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceRangeImpl &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice));
  }

  @override
  int get hashCode => Object.hash(runtimeType, minPrice, maxPrice);

  /// Create a copy of PriceRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceRangeImplCopyWith<_$PriceRangeImpl> get copyWith =>
      __$$PriceRangeImplCopyWithImpl<_$PriceRangeImpl>(this, _$identity);
}

abstract class _PriceRange extends PriceRange {
  const factory _PriceRange({
    required final Money minPrice,
    required final Money maxPrice,
  }) = _$PriceRangeImpl;
  const _PriceRange._() : super._();

  @override
  Money get minPrice;
  @override
  Money get maxPrice;

  /// Create a copy of PriceRange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PriceRangeImplCopyWith<_$PriceRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductImage {
  String get url => throw _privateConstructorUsedError;
  String? get altText => throw _privateConstructorUsedError;
  int? get width => throw _privateConstructorUsedError;
  int? get height => throw _privateConstructorUsedError;

  /// Create a copy of ProductImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductImageCopyWith<ProductImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductImageCopyWith<$Res> {
  factory $ProductImageCopyWith(
    ProductImage value,
    $Res Function(ProductImage) then,
  ) = _$ProductImageCopyWithImpl<$Res, ProductImage>;
  @useResult
  $Res call({String url, String? altText, int? width, int? height});
}

/// @nodoc
class _$ProductImageCopyWithImpl<$Res, $Val extends ProductImage>
    implements $ProductImageCopyWith<$Res> {
  _$ProductImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? altText = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(
      _value.copyWith(
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
            altText: freezed == altText
                ? _value.altText
                : altText // ignore: cast_nullable_to_non_nullable
                      as String?,
            width: freezed == width
                ? _value.width
                : width // ignore: cast_nullable_to_non_nullable
                      as int?,
            height: freezed == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductImageImplCopyWith<$Res>
    implements $ProductImageCopyWith<$Res> {
  factory _$$ProductImageImplCopyWith(
    _$ProductImageImpl value,
    $Res Function(_$ProductImageImpl) then,
  ) = __$$ProductImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url, String? altText, int? width, int? height});
}

/// @nodoc
class __$$ProductImageImplCopyWithImpl<$Res>
    extends _$ProductImageCopyWithImpl<$Res, _$ProductImageImpl>
    implements _$$ProductImageImplCopyWith<$Res> {
  __$$ProductImageImplCopyWithImpl(
    _$ProductImageImpl _value,
    $Res Function(_$ProductImageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? altText = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(
      _$ProductImageImpl(
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
        altText: freezed == altText
            ? _value.altText
            : altText // ignore: cast_nullable_to_non_nullable
                  as String?,
        width: freezed == width
            ? _value.width
            : width // ignore: cast_nullable_to_non_nullable
                  as int?,
        height: freezed == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc

class _$ProductImageImpl implements _ProductImage {
  const _$ProductImageImpl({
    required this.url,
    this.altText,
    this.width,
    this.height,
  });

  @override
  final String url;
  @override
  final String? altText;
  @override
  final int? width;
  @override
  final int? height;

  @override
  String toString() {
    return 'ProductImage(url: $url, altText: $altText, width: $width, height: $height)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImageImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.altText, altText) || other.altText == altText) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url, altText, width, height);

  /// Create a copy of ProductImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImageImplCopyWith<_$ProductImageImpl> get copyWith =>
      __$$ProductImageImplCopyWithImpl<_$ProductImageImpl>(this, _$identity);
}

abstract class _ProductImage implements ProductImage {
  const factory _ProductImage({
    required final String url,
    final String? altText,
    final int? width,
    final int? height,
  }) = _$ProductImageImpl;

  @override
  String get url;
  @override
  String? get altText;
  @override
  int? get width;
  @override
  int? get height;

  /// Create a copy of ProductImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImageImplCopyWith<_$ProductImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductOption {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get values => throw _privateConstructorUsedError;

  /// Create a copy of ProductOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductOptionCopyWith<ProductOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductOptionCopyWith<$Res> {
  factory $ProductOptionCopyWith(
    ProductOption value,
    $Res Function(ProductOption) then,
  ) = _$ProductOptionCopyWithImpl<$Res, ProductOption>;
  @useResult
  $Res call({String id, String name, List<String> values});
}

/// @nodoc
class _$ProductOptionCopyWithImpl<$Res, $Val extends ProductOption>
    implements $ProductOptionCopyWith<$Res> {
  _$ProductOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? values = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            values: null == values
                ? _value.values
                : values // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductOptionImplCopyWith<$Res>
    implements $ProductOptionCopyWith<$Res> {
  factory _$$ProductOptionImplCopyWith(
    _$ProductOptionImpl value,
    $Res Function(_$ProductOptionImpl) then,
  ) = __$$ProductOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, List<String> values});
}

/// @nodoc
class __$$ProductOptionImplCopyWithImpl<$Res>
    extends _$ProductOptionCopyWithImpl<$Res, _$ProductOptionImpl>
    implements _$$ProductOptionImplCopyWith<$Res> {
  __$$ProductOptionImplCopyWithImpl(
    _$ProductOptionImpl _value,
    $Res Function(_$ProductOptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? values = null}) {
    return _then(
      _$ProductOptionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        values: null == values
            ? _value._values
            : values // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc

class _$ProductOptionImpl implements _ProductOption {
  const _$ProductOptionImpl({
    required this.id,
    required this.name,
    required final List<String> values,
  }) : _values = values;

  @override
  final String id;
  @override
  final String name;
  final List<String> _values;
  @override
  List<String> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  @override
  String toString() {
    return 'ProductOption(id: $id, name: $name, values: $values)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductOptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    const DeepCollectionEquality().hash(_values),
  );

  /// Create a copy of ProductOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductOptionImplCopyWith<_$ProductOptionImpl> get copyWith =>
      __$$ProductOptionImplCopyWithImpl<_$ProductOptionImpl>(this, _$identity);
}

abstract class _ProductOption implements ProductOption {
  const factory _ProductOption({
    required final String id,
    required final String name,
    required final List<String> values,
  }) = _$ProductOptionImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  List<String> get values;

  /// Create a copy of ProductOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductOptionImplCopyWith<_$ProductOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
