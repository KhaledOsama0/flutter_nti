import 'package:flutter/material.dart';
import 'package:flutter_task_1/features/profile_card/widgets/card_widget.dart';
import 'package:gap/gap.dart';

class ProfileCardScreen extends StatelessWidget {
  const ProfileCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 75, 128),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text(
                'Profile Card',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Gap(90),
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(horizontal: 16),
              width: 370,
              height: 700,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade300,
              ),
              child: Column(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 70,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                  Gap(30),
                  CardWidget(
                    icon: Icons.person_outline,
                    title: 'Name',
                    subtitle: 'Khaled Osama',
                  ),
                  Gap(25),
                  CardWidget(
                    icon: Icons.work,
                    title: 'Job Title',
                    subtitle: 'Flutter Developer',
                  ),
                  Gap(25),
                  CardWidget(
                    icon: Icons.cake_outlined,
                    title: 'Age',
                    subtitle: '21',
                  ),
                  Gap(25),
                  CardWidget(
                    icon: Icons.location_on,
                    title: 'Address',
                    subtitle: 'Cairo, Egypt',
                  ),
                  Gap(25),
                  CardWidget(
                    icon: Icons.school,
                    title: 'Graduated',
                    subtitle: 'No',
                  ),
                  Gap(25),
                  CardWidget(
                    icon: Icons.email_outlined,
                    title: 'Email',
                    subtitle: 'khaledosama@gmail.com',
                  ),
                  Gap(25),
                  CardWidget(
                    icon: Icons.phone,
                    title: 'Phone',
                    subtitle: '+201015849874',
                  ),
                  Gap(25),
                  Row(
                    children: [
                      CardWidget(
                        icon: Icons.link_outlined,
                        title: 'LinkedIn',
                        subtitle: 'Khaled_Osama',
                      ),
                      Spacer(),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.blue,
                          ),
                        ),
                        child: Text(
                          'open',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                      ),
                      Gap(30),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
