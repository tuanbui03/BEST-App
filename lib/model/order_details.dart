class OrderDetails{
  final int orderDetailsID;
  final int orderID;
  final int voucherID;
  final int productID;
  final int quantity;
  final double price;
  final int productSize;

  OrderDetails(this.orderDetailsID, this.orderID, this.voucherID, this.productID,
      this.quantity, this.price, this.productSize);

  Map<String, dynamic> toMap() {
    return {'orderDetailsID': orderDetailsID, 'orderID': orderID,'voucherID' : voucherID, 'productID' : productID,
    'quantity': quantity, 'price' : price, 'productSize' : productSize};
  }
}
