import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:image_picker/image_picker.dart';

final fileImagePickerProvider =
    StateNotifierProvider.autoDispose<FileImagePickerNotifier, PickerState>(
      (ref) => FileImagePickerNotifier(),
    );

class PickerState {
  final XFile? singleImage;
  final List<XFile> multipleImages;
  final List<PlatformFile> files;

  const PickerState({
    this.singleImage,
    this.multipleImages = const [],
    this.files = const [],
  });

  PickerState copyWith({
    XFile? singleImage,
    List<XFile>? multipleImages,
    List<PlatformFile>? files,
  }) {
    return PickerState(
      singleImage: singleImage ?? this.singleImage,
      multipleImages: multipleImages ?? this.multipleImages,
      files: files ?? this.files,
    );
  }
}

class FileImagePickerNotifier extends StateNotifier<PickerState> {
  FileImagePickerNotifier() : super(const PickerState());

  final ImagePicker _picker = ImagePicker();

  ///  Pick a single image from gallery
  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(
      source: source,
      imageQuality: 50,
    );
    if (image != null) {
      state = state.copyWith(singleImage: image);
    }
  }

  ///  Pick multiple images
  Future<void> pickMultipleImages() async {
    final List<XFile> images = await _picker.pickMultiImage();
    if (images.isNotEmpty) {
      state = state.copyWith(multipleImages: images);
    }
  }

  ///  Clear all selections
  void clearAll() {
    state = const PickerState();
  }
}
