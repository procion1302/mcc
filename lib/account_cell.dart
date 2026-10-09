import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class User {
  final String name;
  final String company;

  const User({
    required this.name,
    required this.company,
  });
}

class AccountCell extends StatelessWidget {
  final User user;
  final VoidCallback onLogout;

  const AccountCell({super.key, required this.user, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Account',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(33, 65, 160, 1),
            ),
          ),

          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                user.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Color.fromRGBO(16, 13, 107, 1),
                ),
              ),
              Text(
                user.company,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Color.fromRGBO(103, 103, 103, 1),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: onLogout,
              borderRadius: BorderRadius.circular(6),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/images/logout.svg',
                      width: 20,
                      height: 20,
                      colorFilter: const ColorFilter.mode(
                        Color.fromRGBO(103, 130, 255, 1),
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'LOGOUT',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(103, 130, 255, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
