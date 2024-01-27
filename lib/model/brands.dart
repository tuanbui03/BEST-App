class Brands{
  final int brandID;
  final String brandName;
  final String description;

  Brands(this.brandID, this.brandName, this.description);

  Map<String, dynamic> toMap() {
    return {'brandID': brandID, 'brandName': brandName, 'description': description};
  }

}
