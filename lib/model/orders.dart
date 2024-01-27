class Orders{
  final int orderID;
  final int userID;
  final int paymentID;
  final String address;
  final double total;
  final String dateCreated;
  final int status;
  final String phone;
  final String fullName;
  final String email;

  Orders(this.orderID, this.userID, this.paymentID, this.address,
      this.total, this.dateCreated, this.status, this.phone, this.fullName, this.email);

  Map<String, dynamic> toMap() {
    return {'orderID': orderID, 'userID': userID, 'paymentID' : paymentID, 'address' : address,
    'total' : total, 'dateCreated' : dateCreated, 'status' : status, 'phone': phone, 'fullName': fullName, 'email': email};
  }
}
