import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:june15th/repositories/api/supabase_connect.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  var supabase = GetIt.I.get<SupabaseConnect>();
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
