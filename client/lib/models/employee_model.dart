class EmployeeModel{
  final int id;
  final String name;
  final String position;
  final String birthPlace;
  final String birthDate;
  final int leaveBalance;
  final String? imgPath;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.position,
    required this.birthPlace,
    required this.birthDate,
    required this.leaveBalance,
    this.imgPath,
});
}