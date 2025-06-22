import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:june15th/repositories/api/supabase_connect.dart';

setup() async {
  // Alternatively you could write it if you don't like global variables
  GetIt.I.registerSingletonAsync<SupabaseConnect>(() async {
    await dotenv.load(fileName: ".env");

    SupabaseConnect supabaseConnect = SupabaseConnect();
    await supabaseConnect.init();

    return supabaseConnect;
  });
  await GetIt.I.allReady();
}
