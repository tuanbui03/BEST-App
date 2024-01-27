class Payment{
  final int paymentID;
  final String description;

  Payment(this.paymentID, this.description);

  Map<String, dynamic> toMap() {
    return {'paymentID': paymentID, 'description': description};
  }
}
