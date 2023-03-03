import 'package:flutter/material.dart';

class TopDoctorsWidget extends StatelessWidget {
  final String? name;
  final String? specification;
  final int? expYears;
  final String? image;
  const TopDoctorsWidget({
    Key? key,
    this.name,
    this.specification,
    this.expYears,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            debugPrint('Doctor information');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name!,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              specification!,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Experience yrs: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  expYears!.toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(image!),
                      ),
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Container(
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(10),
                  //         color: Colors.lightBlue,
                  //       ),
                  //       child: MaterialButton(
                  //         onPressed: (){},
                  //         color: Colors.lightBlue,
                  //         child: const Text(
                  //           'Book',
                  //           style: TextStyle(
                  //             fontSize: 20,
                  //             color: Colors.white,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
