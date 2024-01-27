class Users{
  final int userID;
  final String userName;
  final String fullName;
  final String password;
  final int gender;
  final String email;
  final String image;
  final String phone;
  final String address;
  final String dob;
  final int role;
  final int status;

  Users(
   this.userID,this.userName, this.fullName,this.password,this.gender, this.email, this.image, this.phone, this.address, this.dob, this.role, this.status);

  Map<String, dynamic> toMap() {
    return {'userID' : userID, 'userName' : userName, 'fullName' : fullName, 'password' : password, 'gender' : gender, 'email' : email,
    'image' : image, 'phone' : phone, 'address' : address, 'dob' : dob, 'role' : role, 'status' : status};
  }

}
