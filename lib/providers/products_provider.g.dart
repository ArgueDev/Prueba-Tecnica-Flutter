// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productsHash() => r'b3ed96d6315debfbb1b9f474791a9cf9c4f988ee';

/// See also [products].
@ProviderFor(products)
final productsProvider =
    AutoDisposeFutureProvider<List<ProductResponse>>.internal(
      products,
      name: r'productsProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product') ? null : _$productsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProductsRef = AutoDisposeFutureProviderRef<List<ProductResponse>>;
String _$productByIdHash() => r'3800045cc5f4dedf3cfc8a4352af54e664dcc78f';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [productById].
@ProviderFor(productById)
const productByIdProvider = ProductByIdFamily();

/// See also [productById].
class ProductByIdFamily extends Family<AsyncValue<ProductResponse>> {
  /// See also [productById].
  const ProductByIdFamily();

  /// See also [productById].
  ProductByIdProvider call(int id) {
    return ProductByIdProvider(id);
  }

  @override
  ProductByIdProvider getProviderOverride(
    covariant ProductByIdProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productByIdProvider';
}

/// See also [productById].
class ProductByIdProvider extends AutoDisposeFutureProvider<ProductResponse> {
  /// See also [productById].
  ProductByIdProvider(int id)
    : this._internal(
        (ref) => productById(ref as ProductByIdRef, id),
        from: productByIdProvider,
        name: r'productByIdProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$productByIdHash,
        dependencies: ProductByIdFamily._dependencies,
        allTransitiveDependencies: ProductByIdFamily._allTransitiveDependencies,
        id: id,
      );

  ProductByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<ProductResponse> Function(ProductByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProductByIdProvider._internal(
        (ref) => create(ref as ProductByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ProductResponse> createElement() {
    return _ProductByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProductByIdRef on AutoDisposeFutureProviderRef<ProductResponse> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ProductByIdProviderElement
    extends AutoDisposeFutureProviderElement<ProductResponse>
    with ProductByIdRef {
  _ProductByIdProviderElement(super.provider);

  @override
  int get id => (origin as ProductByIdProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
