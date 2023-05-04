import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mentlo/core/utils/blocs/appointment_bloc/cubit.dart';
import 'package:mentlo/core/utils/blocs/appointment_bloc/state.dart';
import 'package:mentlo/core/utils/blocs/appointment_bloc/state.dart';
import 'package:mentlo/core/utils/blocs/appointment_bloc/state.dart';
import 'package:mentlo/core/utils/blocs/appointment_bloc/state.dart';
import 'package:mentlo/core/utils/blocs/appointment_bloc/state.dart';
import 'package:mentlo/core/utils/blocs/navigation_bloc/cubit.dart';
import 'package:mentlo/core/utils/blocs/navigation_bloc/states.dart';
import 'package:mentlo/core/utils/constants/contstants.dart';
import 'package:mentlo/core/utils/shared_widgets/MyDivider.dart';
import 'package:mentlo/core/utils/shared_widgets/components.dart';
import 'package:mentlo/core/utils/shared_widgets/defaultTextFormField.dart';
import 'package:mentlo/core/utils/shared_widgets/settings_item.dart';
import 'package:mentlo/core/utils/styles/colors.dart';
import 'package:mentlo/core/utils/styles/icon_broken.dart';
import 'package:mentlo/features/settings_page/pages/complains_page.dart';
import 'package:mentlo/features/settings_page/pages/credit_card_page.dart';
import 'package:mentlo/features/settings_page/pages/edit_account_page.dart';
import 'package:mentlo/features/settings_page/pages/feedback_page.dart';
import 'package:overlay_support/overlay_support.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationBloc, NavigationStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        NavigationBloc cubit = NavigationBloc.get(context);
        double? ratingStars = 0.0;
        TextEditingController ratingController = TextEditingController();
        return OverlaySupport.global(
          child: Scaffold(
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
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Column(
                      children: [
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
                            color: defaultColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: MaterialButton(
                            height: 54,
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const EditAccountPage()));
                            },
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
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          CupertinoSwitch(
                            value: cubit.isDark,
                            onChanged: (value) {
                              cubit.changeAppMode();
                            },
                            activeColor: defaultColor,
                          ),
                        ],
                      ),
                    ),
                    const MyDivider(
                      height: 1,
                      width: double.infinity,
                    ),
                    Row(
                      children: [
                         const Text(
                          'Color',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            // fontWeight: FontWeight.bold,
                          ),
                          ),
                        const Spacer(),
                        DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isExpanded: false,
                            borderRadius: BorderRadius.zero,
                            icon: Icon(
                              Icons.color_lens_rounded,
                              color: defaultColor,
                              size: 28.0,
                            ),
                            onChanged: (value) {
                              debugPrint(value.toString());
                              cubit.changeAppColor(value.toString());
                            },
                            items: const [
                              DropdownMenuItem(
                                value: "Red",
                                child: Text(
                                  'Red',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "Blue",
                                child: Text(
                                  'Blue',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "Light blue",
                                child: Text(
                                  'Light blue',
                                  style: TextStyle(
                                    color: Colors.lightBlue,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "Teal",
                                child: Text(
                                  'Teal',
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const MyDivider(
                      height: 1,
                      width: double.infinity,
                    ),
                    SettingsItem(
                      text: 'Credit Cards',
                      icon: Icons.credit_card,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const CreditCardPage()));
                        debugPrint('pressed');
                      },
                    ),
                    const MyDivider(
                      height: 1,
                      width: double.infinity,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Feedback',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isExpanded: false,
                            borderRadius: BorderRadius.zero,
                            icon: const Icon(
                              Icons.feedback_outlined,
                              color: Colors.black,
                              size: 28.0,
                            ),
                            onChanged: (value) {
                              debugPrint(value.toString());
                              if(value == "FeedBack"){
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Rate Us'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Enter your feedback',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              // fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          DefaultFormField(
                                            validate: 'Please enter your feedback',
                                            keyboardType: TextInputType.text,
                                            controller: ratingController,
                                            hintText: 'Enter your feedback',
                                            suffix: Icons.star,
                                            isPassword: false,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          RatingBar.builder(
                                            initialRating: 0,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: defaultColor,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                              ratingStars = rating;
                                              debugPrint(ratingStars.toString());
                                            },
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(context, 'Cancel'),

                                         child: Text(
                                           'cancel',
                                           style: TextStyle(
                                              color: defaultColor,
                                             fontSize: 18,
                                             fontWeight: FontWeight.bold,
                                           ),
                                         ),),
                                        TextButton(
                                          onPressed: () {
                                            debugPrint('sent');
                                            AppointmentBloc.get(context).sendFeedback(
                                              userId: '1',
                                              msg: ratingController.text,
                                              rating: ratingStars!,);
                                              Navigator.pop(context);
                                          },
                                         child: Text(
                                           'Send',
                                           style: TextStyle(
                                             color: defaultColor,
                                             fontSize: 18,
                                             fontWeight: FontWeight.bold,
                                           ),
                                         ),),
                                      ],
                                    ));
                              }else if(value == "Complains"){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const ComplainsPage()));
                              }
                            },
                            items: const [
                              DropdownMenuItem(
                                value: "FeedBack",
                                child: Text(
                                  'FeedBack',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "Complains",
                                child: Text(
                                  'Complains',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const MyDivider(
                      height: 1,
                      width: double.infinity,
                    ),
                    SettingsItem(
                      text: 'Log out',
                      icon: Icons.logout,
                      onTap: ()  {
                        debugPrint('Log out');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
