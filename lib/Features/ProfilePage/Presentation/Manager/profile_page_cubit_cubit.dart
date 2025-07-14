import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'profile_page_cubit_state.dart';

class ProfilePageCubit extends Cubit<ProfilePageCubitState> {
  ProfilePageCubit() : super(ProfilePageCubitLoading()) {
    fetchUserDetails();
  }
  void fetchUserDetails() async {
    final email = Supabase.instance.client.auth.currentUser?.email;
    final name = await Supabase.instance.client
        .from('Users')
        .select('name')
        .eq('email', email!)
        .then((value) {
          return value;
        });
    emit(ProfilePageCubitSuccess(email, name.first.values.first));
  }
}
