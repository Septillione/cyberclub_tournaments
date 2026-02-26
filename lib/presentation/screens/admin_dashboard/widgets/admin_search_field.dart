import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:cyberclub_tournaments/presentation/screens/admin_dashboard/bloc/admin_dashboard_bloc.dart';

class AdminSearchField extends StatefulWidget {
  final int tabIndex;

  const AdminSearchField({super.key, required this.tabIndex});

  @override
  State<AdminSearchField> createState() => _AdminSearchFieldState();
}

class _AdminSearchFieldState extends State<AdminSearchField> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  bool _isSearching = false;

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _clearSearch() {
    _controller.clear();
    _focusNode.unfocus();
    setState(() => _isSearching = false);
    context.read<AdminDashboardBloc>().add(
      AdminDashboardQueryChanged('', widget.tabIndex),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      focusNode: _focusNode,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        labelText: 'Поиск',
        suffixIcon: _isSearching
            ? IconButton(icon: const Icon(Icons.clear), onPressed: _clearSearch)
            : const Icon(LucideIcons.search),
      ),
      onTap: () => setState(() => _isSearching = true),
      onChanged: (value) {
        context.read<AdminDashboardBloc>().add(
          AdminDashboardQueryChanged(value, widget.tabIndex),
        );
      },
    );
  }
}
