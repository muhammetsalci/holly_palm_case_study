// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'variant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Variant {
  /// Unique identifier (Shopify GID)
  String get id => throw _privateConstructorUsedError;

  /// Variant title (e.g., "Ice / 154")
  String get title => throw _privateConstructorUsedError;

  /// Price information
  Money get price => throw _privateConstructorUsedError;

  /// Compare at price (original price for discounts)
  Money? get compareAtPrice => throw _privateConstructorUsedError;

  /// Whether this variant is available for sale
  bool get availableForSale => throw _privateConstructorUsedError;

  /// Quantity available (if tracked)
  int? get quantityAvailable => throw _privateConstructorUsedError;

  /// Selected options (Color, Size, etc.)
  List<SelectedOption> get selectedOptions =>
      throw _privateConstructorUsedError;

  /// Variant image URL
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Create a copy of Variant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VariantCopyWith<Variant> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VariantCopyWith<$Res> {
  factory $VariantCopyWith(Variant value, $Res Function(Variant) then) =
      _$VariantCopyWithImpl<$Res, Variant>;
  @useResult
  $Res call({
    String id,
    String title,
    Money price,
    Money? compareAtPrice,
    bool availableForSale,
    int? quantityAvailable,
    List<SelectedOption> selectedOptions,
    String? imageUrl,
  });

  $MoneyCopyWith<$Res> get price;
  $MoneyCopyWith<$Res>? get compareAtPrice;
}

/// @nodoc
class _$VariantCopyWithImpl<$Res, $Val extends Variant>
    implements $VariantCopyWith<$Res> {
  _$VariantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Variant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? price = null,
    Object? compareAtPrice = freezed,
    Object? availableForSale = null,
    Object? quantityAvailable = freezed,
    Object? selectedOptions = null,
    Object? imageUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as Money,
            compareAtPrice: freezed == compareAtPrice
                ? _value.compareAtPrice
                : compareAtPrice // ignore: cast_nullable_to_non_nullable
                      as Money?,
            availableForSale: null == availableForSale
                ? _value.availableForSale
                : availableForSale // ignore: cast_nullable_to_non_nullable
                      as bool,
            quantityAvailable: freezed == quantityAvailable
                ? _value.quantityAvailable
                : quantityAvailable // ignore: cast_nullable_to_non_nullable
                      as int?,
            selectedOptions: null == selectedOptions
                ? _value.selectedOptions
                : selectedOptions // ignore: cast_nullable_to_non_nullable
                      as List<SelectedOption>,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of Variant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MoneyCopyWith<$Res> get price {
    return $MoneyCopyWith<$Res>(_value.price, (value) {
      return _then(_value.copyWith(price: value) as $Val);
    });
  }

  /// Create a copy of Variant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MoneyCopyWith<$Res>? get compareAtPrice {
    if (_value.compareAtPrice == null) {
      return null;
    }

    return $MoneyCopyWith<$Res>(_value.compareAtPrice!, (value) {
      return _then(_value.copyWith(compareAtPrice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VariantImplCopyWith<$Res> implements $VariantCopyWith<$Res> {
  factory _$$VariantImplCopyWith(
    _$VariantImpl value,
    $Res Function(_$VariantImpl) then,
  ) = __$$VariantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    Money price,
    Money? compareAtPrice,
    bool availableForSale,
    int? quantityAvailable,
    List<SelectedOption> selectedOptions,
    String? imageUrl,
  });

  @override
  $MoneyCopyWith<$Res> get price;
  @override
  $MoneyCopyWith<$Res>? get compareAtPrice;
}

/// @nodoc
class __$$VariantImplCopyWithImpl<$Res>
    extends _$VariantCopyWithImpl<$Res, _$VariantImpl>
    implements _$$VariantImplCopyWith<$Res> {
  __$$VariantImplCopyWithImpl(
    _$VariantImpl _value,
    $Res Function(_$VariantImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Variant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? price = null,
    Object? compareAtPrice = freezed,
    Object? availableForSale = null,
    Object? quantityAvailable = freezed,
    Object? selectedOptions = null,
    Object? imageUrl = freezed,
  }) {
    return _then(
      _$VariantImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as Money,
        compareAtPrice: freezed == compareAtPrice
            ? _value.compareAtPrice
            : compareAtPrice // ignore: cast_nullable_to_non_nullable
                  as Money?,
        availableForSale: null == availableForSale
            ? _value.availableForSale
            : availableForSale // ignore: cast_nullable_to_non_nullable
                  as bool,
        quantityAvailable: freezed == quantityAvailable
            ? _value.quantityAvailable
            : quantityAvailable // ignore: cast_nullable_to_non_nullable
                  as int?,
        selectedOptions: null == selectedOptions
            ? _value._selectedOptions
            : selectedOptions // ignore: cast_nullable_to_non_nullable
                  as List<SelectedOption>,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$VariantImpl extends _Variant {
  const _$VariantImpl({
    required this.id,
    required this.title,
    required this.price,
    this.compareAtPrice,
    required this.availableForSale,
    this.quantityAvailable,
    required final List<SelectedOption> selectedOptions,
    this.imageUrl,
  }) : _selectedOptions = selectedOptions,
       super._();

  /// Unique identifier (Shopify GID)
  @override
  final String id;

  /// Variant title (e.g., "Ice / 154")
  @override
  final String title;

  /// Price information
  @override
  final Money price;

  /// Compare at price (original price for discounts)
  @override
  final Money? compareAtPrice;

  /// Whether this variant is available for sale
  @override
  final bool availableForSale;

  /// Quantity available (if tracked)
  @override
  final int? quantityAvailable;

  /// Selected options (Color, Size, etc.)
  final List<SelectedOption> _selectedOptions;

  /// Selected options (Color, Size, etc.)
  @override
  List<SelectedOption> get selectedOptions {
    if (_selectedOptions is EqualUnmodifiableListView) return _selectedOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedOptions);
  }

  /// Variant image URL
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'Variant(id: $id, title: $title, price: $price, compareAtPrice: $compareAtPrice, availableForSale: $availableForSale, quantityAvailable: $quantityAvailable, selectedOptions: $selectedOptions, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VariantImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.compareAtPrice, compareAtPrice) ||
                other.compareAtPrice == compareAtPrice) &&
            (identical(other.availableForSale, availableForSale) ||
                other.availableForSale == availableForSale) &&
            (identical(other.quantityAvailable, quantityAvailable) ||
                other.quantityAvailable == quantityAvailable) &&
            const DeepCollectionEquality().equals(
              other._selectedOptions,
              _selectedOptions,
            ) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    price,
    compareAtPrice,
    availableForSale,
    quantityAvailable,
    const DeepCollectionEquality().hash(_selectedOptions),
    imageUrl,
  );

  /// Create a copy of Variant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VariantImplCopyWith<_$VariantImpl> get copyWith =>
      __$$VariantImplCopyWithImpl<_$VariantImpl>(this, _$identity);
}

abstract class _Variant extends Variant {
  const factory _Variant({
    required final String id,
    required final String title,
    required final Money price,
    final Money? compareAtPrice,
    required final bool availableForSale,
    final int? quantityAvailable,
    required final List<SelectedOption> selectedOptions,
    final String? imageUrl,
  }) = _$VariantImpl;
  const _Variant._() : super._();

  /// Unique identifier (Shopify GID)
  @override
  String get id;

  /// Variant title (e.g., "Ice / 154")
  @override
  String get title;

  /// Price information
  @override
  Money get price;

  /// Compare at price (original price for discounts)
  @override
  Money? get compareAtPrice;

  /// Whether this variant is available for sale
  @override
  bool get availableForSale;

  /// Quantity available (if tracked)
  @override
  int? get quantityAvailable;

  /// Selected options (Color, Size, etc.)
  @override
  List<SelectedOption> get selectedOptions;

  /// Variant image URL
  @override
  String? get imageUrl;

  /// Create a copy of Variant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VariantImplCopyWith<_$VariantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SelectedOption {
  String get name => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  /// Create a copy of SelectedOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SelectedOptionCopyWith<SelectedOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedOptionCopyWith<$Res> {
  factory $SelectedOptionCopyWith(
    SelectedOption value,
    $Res Function(SelectedOption) then,
  ) = _$SelectedOptionCopyWithImpl<$Res, SelectedOption>;
  @useResult
  $Res call({String name, String value});
}

/// @nodoc
class _$SelectedOptionCopyWithImpl<$Res, $Val extends SelectedOption>
    implements $SelectedOptionCopyWith<$Res> {
  _$SelectedOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SelectedOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? value = null}) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SelectedOptionImplCopyWith<$Res>
    implements $SelectedOptionCopyWith<$Res> {
  factory _$$SelectedOptionImplCopyWith(
    _$SelectedOptionImpl value,
    $Res Function(_$SelectedOptionImpl) then,
  ) = __$$SelectedOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String value});
}

/// @nodoc
class __$$SelectedOptionImplCopyWithImpl<$Res>
    extends _$SelectedOptionCopyWithImpl<$Res, _$SelectedOptionImpl>
    implements _$$SelectedOptionImplCopyWith<$Res> {
  __$$SelectedOptionImplCopyWithImpl(
    _$SelectedOptionImpl _value,
    $Res Function(_$SelectedOptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SelectedOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? value = null}) {
    return _then(
      _$SelectedOptionImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SelectedOptionImpl implements _SelectedOption {
  const _$SelectedOptionImpl({required this.name, required this.value});

  @override
  final String name;
  @override
  final String value;

  @override
  String toString() {
    return 'SelectedOption(name: $name, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedOptionImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, value);

  /// Create a copy of SelectedOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedOptionImplCopyWith<_$SelectedOptionImpl> get copyWith =>
      __$$SelectedOptionImplCopyWithImpl<_$SelectedOptionImpl>(
        this,
        _$identity,
      );
}

abstract class _SelectedOption implements SelectedOption {
  const factory _SelectedOption({
    required final String name,
    required final String value,
  }) = _$SelectedOptionImpl;

  @override
  String get name;
  @override
  String get value;

  /// Create a copy of SelectedOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectedOptionImplCopyWith<_$SelectedOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
