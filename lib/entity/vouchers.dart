class Vouchers{
  final int voucherID;
  final String voucherCode;
  final String dayStart;
  final String dayEnd;
  final String dateUse;
  final int descountPercent;
  final String description;

  Vouchers(this.voucherID, this.voucherCode, this.dayStart,
      this.dayEnd, this.dateUse, this.descountPercent, this.description);

  Map<String, dynamic> toMap() {
    return {
      'voucherID' : voucherID, 'voucherCode' : voucherCode, 'dayStart' : dayStart,
      'dayEnd' : dayEnd, 'dateUse' : dateUse, 'descountPercent' : descountPercent,
      'description': description
    };
  }
}
