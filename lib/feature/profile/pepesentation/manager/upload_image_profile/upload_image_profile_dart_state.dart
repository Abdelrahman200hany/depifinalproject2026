abstract class UploadProfileImageState {}

class UploadProfileImageInitial extends UploadProfileImageState {}

class UploadProfileImageLoading extends UploadProfileImageState {}

class UploadProfileImageSuccess extends UploadProfileImageState {
  final String imageUrl;

  UploadProfileImageSuccess({required this.imageUrl});
}

class UploadProfileImageFailure extends UploadProfileImageState {
  final String message;

  UploadProfileImageFailure({required this.message});
}
