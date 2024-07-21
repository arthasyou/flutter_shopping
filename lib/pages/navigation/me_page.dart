import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../gen/app_localizations.dart';

@RoutePage()
class MePage extends StatelessWidget {
  const MePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppLocalizations.of(context)!.language),
    );
  }
}
