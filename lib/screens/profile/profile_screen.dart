import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:june15th/screens/profile/bloc/profile_bloc.dart';
import 'package:june15th/screens/settings/settings_screen.dart';
import 'package:june15th/styles/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define some reusable colors

    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          var bloc = context.read<ProfileBloc>();
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Header: "Profile"
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Center(
                        child: Text(
                          'Profile',
                          style: TextStyle(
                            color: AppColors.systemBlack,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    // Avatar and Name
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[800],
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/profilefill.png", // Placeholder image
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      bloc.supabase.getUserName(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Settings Section Title
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Text(
                            'Settings Section',
                            style: TextStyle(
                              color: AppColors.systemBlack,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    // "App Settings" ListTile
                    Container(
                      color: Colors.transparent,
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        tileColor: AppColors.primaryFilledColor,
                        leading: Icon(Icons.settings, color: Colors.white),
                        title: Text(
                          "Settings",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 16,
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => BlocProvider.value(
                                value: bloc,
                                child: SettingsScreen(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Account Section Title
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Text(
                            'Account Section',
                            style: TextStyle(
                              color: AppColors.systemBlack,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    // "Change account name" ListTile
                    Container(
                      color: Colors.transparent,
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        tileColor: AppColors.primaryFilledColor,
                        leading: Icon(Icons.person, color: Colors.white),
                        title: Text(
                          "Change account email",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 16,
                        ),
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(height: 8),

                    // "Change account Image" ListTile
                    Container(
                      color: Colors.transparent,
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        tileColor: AppColors.primaryFilledColor,
                        leading: Icon(Icons.camera_alt, color: Colors.white),
                        title: Text(
                          "Change account image",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 16,
                        ),
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(height: 8),

                    // "Log out" ListTile (red)
                    Container(
                      color: Colors.transparent,
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        tileColor: AppColors.primaryFilledColor.withValues(
                          alpha: 0.75,
                        ),
                        leading: Icon(Icons.logout, color: Colors.red),
                        title: Text(
                          "Log out",
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                        onTap: () {},
                      ),
                    ),

                    // Fill remaining space so BottomNavigationBar is at bottom
                    const Spacer(),
                  ],
                ),
              ),
            ),

            // Bottom Navigation Bar
          );
        },
      ),
    );
  }
}
