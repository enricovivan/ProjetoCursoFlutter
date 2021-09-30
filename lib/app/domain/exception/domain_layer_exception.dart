class DomainLayerException implements Exception {
  String causa;

  DomainLayerException(this.causa);

  @override
  String toString() {
    return causa;
  }
}
