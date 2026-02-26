import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:cyberclub_tournaments/core/di/injection_container.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/upload_team_logo_usecase.dart';

class AvatarPicker extends StatefulWidget {
  final String? initialUrl;
  final ValueChanged<String> onUploadComplete;

  // Опционально — если нужно загружать не только лого команды
  final Future<String?> Function(String path)? customUpload;

  const AvatarPicker({
    super.key,
    this.initialUrl,
    required this.onUploadComplete,
    this.customUpload,
  });

  @override
  State<AvatarPicker> createState() => _AvatarPickerState();
}

class _AvatarPickerState extends State<AvatarPicker> {
  File? _localImage;
  String? _remoteUrl;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _remoteUrl = widget.initialUrl;
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final xFile = await picker.pickImage(source: ImageSource.gallery);

    if (xFile == null) return;

    setState(() {
      _localImage = File(xFile.path);
      _isLoading = true;
    });

    try {
      String? url;
      if (widget.customUpload != null) {
        url = await widget.customUpload!(xFile.path);
      } else {
        // По умолчанию загружаем как лого команды
        url = await serviceLocator<UploadTeamLogoUseCase>()(xFile.path);
      }

      if (url != null) {
        _remoteUrl = url;
        widget.onUploadComplete(url);
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Ошибка загрузки фото')));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _isLoading ? null : _pickImage,
        child: Stack(
          children: [
            _AvatarImage(
              localImage: _localImage,
              remoteUrl: _remoteUrl,
              isLoading: _isLoading,
            ),
            if (!_isLoading) const _EditBadge(),
          ],
        ),
      ),
    );
  }
}

class _AvatarImage extends StatelessWidget {
  final File? localImage;
  final String? remoteUrl;
  final bool isLoading;

  const _AvatarImage({
    required this.localImage,
    required this.remoteUrl,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    ImageProvider? image;
    if (localImage != null) {
      image = FileImage(localImage!);
    } else if (remoteUrl != null && remoteUrl!.isNotEmpty) {
      image = NetworkImage(remoteUrl!);
    }

    return CircleAvatar(
      radius: 50,
      backgroundColor: AppColors.bgSurface,
      backgroundImage: image,
      child: isLoading
          ? const CircularProgressIndicator()
          : (image == null
                ? const Icon(
                    LucideIcons.camera,
                    size: 40,
                    color: AppColors.textSecondary,
                  )
                : null),
    );
  }
}

class _EditBadge extends StatelessWidget {
  const _EditBadge();

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
    );
  }
}
