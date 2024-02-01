import 'package:crud_operations/models/user_model.dart';
import 'package:crud_operations/services/firestore_profile.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final firestoreProfileService = FirestoreProfileService();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController githubController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserModel?>(
      stream: firestoreProfileService.getProfile(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserModel userModel = snapshot.data!;

          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      controller: nameController..text = userModel.name!,
                      decoration: const InputDecoration(labelText: 'Name'),
                    ),
                    TextField(
                      controller: surnameController..text = userModel.surname!,
                      decoration: const InputDecoration(labelText: 'Surname'),
                    ),
                    TextField(
                      controller: descriptionController
                        ..text = userModel.description!,
                      decoration:
                          const InputDecoration(labelText: 'description'),
                    ),
                    TextField(
                      controller: githubController..text = userModel.github!,
                      decoration: const InputDecoration(labelText: 'github'),
                    ),
                    TextField(
                      controller: instagramController
                        ..text = userModel.instagram!,
                      decoration: const InputDecoration(labelText: 'instagram'),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () async {
                        UserModel updatedUserModel = UserModel(
                          name: nameController.text,
                          surname: surnameController.text,
                          description: descriptionController.text,
                          github: githubController.text,
                          instagram: instagramController.text,
                        );

                        await firestoreProfileService
                            .updateProfile(updatedUserModel);
                      },
                      child: const Text('Update Profile'),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () async {
                        UserModel newUserModel = UserModel(
                          name: nameController.text,
                          surname: surnameController.text,
                          description: descriptionController.text,
                          github: githubController.text,
                          instagram: instagramController.text,
                        );

                        await firestoreProfileService.addProfile(newUserModel);
                      },
                      child: const Text('Add Profile'),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Something went wrong! ${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}
