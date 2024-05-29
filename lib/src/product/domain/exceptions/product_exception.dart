sealed class ProductException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  const ProductException(this.message, [this.stackTrace]);

  @override
  String toString() {
    return "$runtimeType: $message${stackTrace == null ? '' : '\n$stackTrace'}";
  }
}

class ProductServiceException extends ProductException {
  const ProductServiceException(super.message, [super.stackTrace]);
}
