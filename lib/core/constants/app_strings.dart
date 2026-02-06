/// Centralized application strings for UI text.
/// 
/// Benefits:
/// - Easy localization in future (all strings in one place)
/// - Prevents duplicate text across codebase
/// - Consistent messaging across the app
/// - Simple to update copy without touching logic
class AppStrings {
  AppStrings._();

  // MARK: - General

  static const String back = 'Geri tuşuna basıldı';
  static const String retry = 'Tekrar Dene';
  static const String cancel = 'İptal';
  static const String confirm = 'Onayla';
  static const String ok = 'Tamam';
  static const String delete = 'Çıkar';
  static const String clear = 'Temizle';

  // MARK: - Product Detail

  static const String productDetail = 'Ürün Detayı';
  static const String productLoading = 'Ürün yükleniyor...';
  static const String productDescription = 'Ürün Açıklaması';
  static const String errorOccurred = 'Bir hata oluştu';
  
  // MARK: - Variant Selection

  static const String selectVariant = 'Varyant Seçin';
  static const String required = 'Zorunlu';
  static const String inStock = 'Stokta var';
  static const String outOfStock = 'Stokta yok';
  static const String pleaseSelectOption = 'Lütfen Seçenek Belirleyin';
  static const String notAvailable = 'Stokta Yok';
  
  // MARK: - Cart

  static const String myCart = 'Sepetim';
  static const String cartLoading = 'Sepet yükleniyor...';
  static const String emptyCartTitle = 'Sepetiniz Boş';
  static const String emptyCartMessage = 'Alışverişe başlamak için ürünleri\nkeşfetmeye başlayın';
  static const String continueShopping = 'Alışverişe Devam Et';
  static const String totalAmount = 'Toplam Tutar';
  static const String completeOrder = 'Siparişi Tamamla';
  static const String clearCart = 'Sepeti Temizle';
  static const String clearCartConfirm = 'Tüm ürünler sepetten çıkarılacak. Emin misiniz?';
  static const String cartCleared = 'Sepet temizlendi';
  static const String removeProduct = 'Ürünü Çıkar';
  static const String checkoutComingSoon = 'Ödeme özelliği yakında eklenecek';
  
  // MARK: - Add to Cart

  static const String price = 'Fiyat';
  static const String makeSelection = 'Seçim yapın';
  static const String addToCart = 'Sepete Ekle';
  
  // MARK: - Success Messages

  /// Returns formatted message for item added to cart
  static String itemAddedToCart(String variantTitle) => '$variantTitle sepete eklendi!';
  
  /// Returns formatted message for item removed from cart
  static String itemRemovedFromCart(String productTitle) => '$productTitle sepetten çıkarıldı';
  
  /// Returns formatted message for remove confirmation
  static String removeFromCartConfirm(String productTitle) => '$productTitle sepetten çıkarılsın mı?';
  
  /// Returns formatted cart title with item count
  static String cartWithCount(int count) => 'Sepetim ($count)';
  
  /// Returns formatted product count text
  static String productCount(int count) => '$count Ürün';
}
