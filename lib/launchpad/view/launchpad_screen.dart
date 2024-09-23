import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/app/service/di.dart';
import 'package:tourism_app/launchpad/cubit/launchpad_cubit.dart';
import 'package:tourism_app/launchpad/widget/adaptive_launchpad.dart';

class LaunchpadScreen extends StatelessWidget {
  const LaunchpadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.get<LaunchpadCubit>(),
      child: const AdaptiveLaunchpadView(),
    );
  }
}
