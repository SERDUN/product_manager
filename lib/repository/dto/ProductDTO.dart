class ProductDTO {
  String title;
  String imgAsset;

  ProductDTO(this.title, this.imgAsset);


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDTO &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          imgAsset == other.imgAsset;

  @override
  int get hashCode => title.hashCode ^ imgAsset.hashCode;
}
