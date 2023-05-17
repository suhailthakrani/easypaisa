import 'package:flutter/material.dart';

class AccountInfoTile extends StatelessWidget {
  final Widget leadingIcon;
  final Widget trailingIcon;
  final String title;
  
  final VoidCallback? onTap;

  const AccountInfoTile({super.key, required this.leadingIcon, required this.trailingIcon, required this.title, this.onTap});



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            leadingIcon,
            const SizedBox(width: 12),
            Expanded(child: Text(
              title,
              style: const TextStyle(
                // fontFamily: 'Proxima Nova',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87
              ),
            ),),
            trailingIcon
          ],
        ),
      ),
    );
  }

}
