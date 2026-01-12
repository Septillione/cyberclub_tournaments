import 'dart:io';

import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/data/providers/api_client.dart';
import 'package:cyberclub_tournaments/data/repositories/team_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class AvatarPicker extends StatefulWidget {
  final String? initialUrl;
  final Function(String) onUploadComplete;

  const AvatarPicker({
    super.key,
    this.initialUrl,
    required this.onUploadComplete,
  });

  @override
  State<AvatarPicker> createState() => _AvatarPickerState();
}

class _AvatarPickerState extends State<AvatarPicker> {
  String? _currentUrl;
  File? _localImage;
  bool _isUploading = false;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _currentUrl = widget.initialUrl;
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;

      setState(() {
        _localImage = File(image.path);
        _isUploading = true;
      });

      final repo = context.read<TeamRepository>();
      final uploadedUrl = await repo.uploadImage(image.path);

      // final apiClient = context.read<ApiClient>();
      // final uploadedUrl = await apiClient.uploadImage(image.path);

      if (uploadedUrl != null) {
        setState(() {
          _currentUrl = uploadedUrl;
          _isUploading = false;
        });

        print('AVATAR PICKER SUCCESS: $uploadedUrl');
        widget.onUploadComplete(uploadedUrl);
      } else {
        print("AVATAR PICKER FAILED: Url is null");
        setState(() {
          _isUploading = false;
        });
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Не удалось загрузить фото')),
          );
        }
      }
    } catch (e) {
      print("AVATAR PICKER CRASH: $e");
      setState(() {
        _isUploading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider? imageProvider;
    if (_localImage != null) {
      imageProvider = FileImage(_localImage!);
    } else if (_currentUrl != null && _currentUrl!.isNotEmpty) {
      imageProvider = NetworkImage(_currentUrl!);
    }

    return GestureDetector(
      onTap: _isUploading ? null : _pickImage,
      child: Center(
        child: Stack(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.bgSurface,
              backgroundImage: imageProvider,
              child: _isUploading
                  ? const CircularProgressIndicator()
                  : (imageProvider == null
                        ? const Icon(
                            LucideIcons.camera,
                            size: 40,
                            color: AppColors.textSecondary,
                          )
                        : null),
            ),
            if (!_isUploading)
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: AppColors.accentPrimary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    LucideIcons.pencil,
                    size: 16,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
