class ProfileDataModel {
  ProfileDataModel({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.emailCode,
    this.photoProfile,
    this.accountType,
    this.adminGroupId,
    this.ratingsCount,
    this.ratingsStatistics,
    this.ratingsOverall,
    this.accountStatus,
    this.accountReason,
    this.mobile,
    this.mobileVerifiedAt,
    this.mobileCode,
    this.taxNumber,
    this.bio,
    this.commercialCert,
    this.userType,
    this.facebookId,
    this.facebookToken,
    this.facebookRefreshToken,
    this.googleId,
    this.googleToken,
    this.googleRefreshToken,
    this.resetPasswordCode,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? email;
  DateTime? emailVerifiedAt;
  dynamic emailCode;
  String? photoProfile;
  String? accountType;
  dynamic adminGroupId;
  int? ratingsCount;
  String? ratingsStatistics;
  String? ratingsOverall;
  String? accountStatus;
  dynamic accountReason;
  String? mobile;
  DateTime? mobileVerifiedAt;
  dynamic mobileCode;
  String? taxNumber;
  String? bio;
  String? commercialCert;
  String? userType;
  dynamic facebookId;
  dynamic facebookToken;
  dynamic facebookRefreshToken;
  dynamic googleId;
  dynamic googleToken;
  dynamic googleRefreshToken;
  dynamic resetPasswordCode;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  bool get isImporterExporter {
    if (userType == UserType.importerExporter.value) return true;
    return false;
  }

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) =>
      ProfileDataModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        emailVerifiedAt: DateTime.parse(
            json['email_verified_at'] ?? DateTime.now().toString()),
        emailCode: json['email_code'],
        photoProfile: json['photo_profile'],
        accountType: json['account_type'],
        adminGroupId: json['admin_group_id'],
        ratingsCount: json['ratings_count'],
        ratingsStatistics: json['ratings_statistics'],
        ratingsOverall: json['ratings_overall'],
        accountStatus: json['account_status'],
        accountReason: json['account_reason'],
        mobile: json['mobile'],
        mobileVerifiedAt: DateTime.parse(
            json['mobile_verified_at'] ?? DateTime.now().toString()),
        mobileCode: json['mobile_code'],
        taxNumber: json['tax_number'],
        bio: json['bio'],
        commercialCert: json['commercial_cert'],
        userType: json['user_type'],
        facebookId: json['facebook_id'],
        facebookToken: json['facebook_token'],
        facebookRefreshToken: json['facebook_refresh_token'],
        googleId: json['google_id'],
        googleToken: json['google_token'],
        googleRefreshToken: json['google_refresh_token'],
        resetPasswordCode: json['reset_password_code'],
        deletedAt: json['deleted_at'],
        createdAt:
            DateTime.parse(json['created_at'] ?? DateTime.now().toString()),
        updatedAt:
            DateTime.parse(json['updated_at'] ?? DateTime.now().toString()),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'email_verified_at':
            "${emailVerifiedAt!.year.toString().padLeft(4, '0')}-${emailVerifiedAt!.month.toString().padLeft(2, '0')}-${emailVerifiedAt!.day.toString().padLeft(2, '0')}",
        'email_code': emailCode,
        'photo_profile': photoProfile,
        'account_type': accountType,
        'admin_group_id': adminGroupId,
        'ratings_count': ratingsCount,
        'ratings_statistics': ratingsStatistics,
        'ratings_overall': ratingsOverall,
        'account_status': accountStatus,
        'account_reason': accountReason,
        'mobile': mobile,
        'mobile_verified_at': mobileVerifiedAt!.toIso8601String(),
        'mobile_code': mobileCode,
        'tax_number': taxNumber,
        'bio': bio,
        'commercial_cert': commercialCert,
        'user_type': userType,
        'facebook_id': facebookId,
        'facebook_token': facebookToken,
        'facebook_refresh_token': facebookRefreshToken,
        'google_id': googleId,
        'google_token': googleToken,
        'google_refresh_token': googleRefreshToken,
        'reset_password_code': resetPasswordCode,
        'deleted_at': deletedAt,
        'created_at':
            "${createdAt!.year.toString().padLeft(4, '0')}-${createdAt!.month.toString().padLeft(2, '0')}-${createdAt!.day.toString().padLeft(2, '0')}",
        'updated_at':
            "${updatedAt!.year.toString().padLeft(4, '0')}-${updatedAt!.month.toString().padLeft(2, '0')}-${updatedAt!.day.toString().padLeft(2, '0')}",
      };
}

enum UserType {
  provider('provider'),
  importerExporter('importer_exporter');

  final String value;
  const UserType(this.value);
}
