import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentlo/core/utils/shared_widgets/MyDivider.dart';
import 'package:mentlo/core/utils/shared_widgets/settings_item.dart';
import 'package:mentlo/core/utils/styles/icon_broken.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              children:  [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                ),
                const Text(
                    'Name',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
               const SizedBox(
                  height: 8,
               ),
                const Text(
                    'email@gmail.com',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                  ),
                ),
               const SizedBox(
                 height: 10,
               ),
               Container(
                  width: 250,
                 clipBehavior: Clip.antiAlias,
                 decoration: BoxDecoration(
                   color: Colors.teal,
                   borderRadius: BorderRadius.circular(20),
                 ),
                 child: MaterialButton(
                   height: 54,
                   onPressed: (){},
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: const [
                       Text(
                       'Edit Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                 ),
                       SizedBox(
                         width: 8,
                       ),
                       Icon(
                         Icons.arrow_forward_ios_outlined,
                         color: Colors.white,
                         size: 18,
                       ),
                     ],
                   ),),
               ),
              ],
            ),
            // const Padding(
            //   padding: EdgeInsets.only(
            //     top: 16,
            //   ),
            //   child: MyDivider(
            //     height: 1,
            //     width: 300,
            //   ),
            // ),
            // SettingsItem(
            //   text: 'Profile',
            //   icon: Icons.person,
            //   onTap: () {
            //     debugPrint('pressed');
            //   },
            // ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: MyDivider(
                height: 1,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Dark Mode',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CupertinoSwitch(
                      value: false,
                      onChanged: (value){
                        value =  !value;
                        debugPrint(value.toString());
                      },
                    activeColor: Colors.teal,
                  ),
                ],
              ),
            ),
            const MyDivider(
              height: 1,
              width: double.infinity,
            ),
            Row(
              children:  const [
                Expanded(
                  child: Text(
                    'Change app them',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DropdownMenu(
                  initialSelection: 'Red',
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                  leadingIcon: Icon(Icons.color_lens,),
                  inputDecorationTheme: InputDecorationTheme(
                    border: InputBorder.none,
                  ),
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: 'Red', label: 'red',),
                  ],

                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
