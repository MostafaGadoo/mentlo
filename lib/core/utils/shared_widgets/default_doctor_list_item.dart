import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DefaultDoctorsListItem extends StatelessWidget {
  final String profileImage;
  final String doctorName;
  final String doctorEmail;
  final String from;
  final String to;
  final String workingDays;
  final VoidCallback? appointmentBooked;


  const DefaultDoctorsListItem({
    Key? key,
    required this.profileImage,
    required this.doctorName,
    required this.doctorEmail,
    required this.from,
    required this.to,
    required this.workingDays,
    required this.appointmentBooked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 3,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(

                        title: const Text('Book Appointment'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doctorName,
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Text(
                              doctorEmail,
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Text(
                              'From $from' + ' To $to',
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Text(
                              'Working Days: $workingDays',
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                      height: 54,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        color: Colors.teal,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: MaterialButton(
                                        onPressed: (){
                                          Navigator.pop(context);
                                          appointmentBooked!();
                                        },
                                        child: const Text(
                                          'Book Appointment',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )),
                                ),
                                const SizedBox(
                                  width: 34,
                                ),
                                TextButton(onPressed: (){
                                  Navigator.pop(context);
                                }, child: const Text('Cancel', style: TextStyle(color: Colors.teal,),)),
                              ],
                            ),
                          ],
                        ),
                      ));
            },
            child: Container(
              decoration: BoxDecoration(
                color: HexColor('#c9e0df'),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 43,
                          backgroundImage:
                              NetworkImage(profileImage),
                          backgroundColor: HexColor('#F1F0F3'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 4,
                                ),
                                child: Text(
                                  doctorName,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  // softWrap: true,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                doctorEmail,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                softWrap: true,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              const Text(
                                'Select to see full details and \nbook your appointment',
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 14,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ],
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
