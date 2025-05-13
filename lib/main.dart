import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/routes/on_generate_routes.dart';
import 'package:fruits_hub_dashboard/core/services/custom_bloc_observer.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoint.dart';
import 'package:fruits_hub_dashboard/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:fruits_hub_dashboard/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Supabase.initialize(
    url: BackendEndpoint.subabaseUrl,
    anonKey: BackendEndpoint.supabaseKey,
  );
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupGetit();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: DashboardView.routeName,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
