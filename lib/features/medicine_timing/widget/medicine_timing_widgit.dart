import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentlo/core/utils/blocs/appointment_bloc/cubit.dart';
import 'package:mentlo/core/utils/blocs/appointment_bloc/cubit.dart';
import 'package:mentlo/core/utils/blocs/appointment_bloc/state.dart';
import 'package:mentlo/core/utils/constants/contstants.dart';
import 'package:mentlo/core/utils/shared_widgets/components.dart';
import 'package:mentlo/core/utils/shared_widgets/defaultTextFormField.dart';
import 'package:mentlo/core/utils/styles/colors.dart';

class MedicineTimingWidget extends StatelessWidget {
  const MedicineTimingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController? medicineNameController = TextEditingController();
    TextEditingController? medicineTimeController = TextEditingController();
    TextEditingController? medicineFromController = TextEditingController();
    TextEditingController? medicineToController = TextEditingController();
    String? repetitions = 'repetitions';
    return BlocConsumer<AppointmentBloc, AppointmentStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        AppointmentBloc cubit = AppointmentBloc.get(context);
        return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Image(
                    width: double.infinity,
                    height: 250,
                    image: AssetImage('assets/images/medicine.jpg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Medicine Name:',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        TextFormField(
                          controller: medicineNameController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Medicine name is needed';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            label: Text(
                              'Enter medicine name',
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(18),
                                topRight: Radius.circular(18),
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Text(
                          'Time:',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        TextFormField(
                          controller: medicineTimeController,
                          keyboardType: TextInputType.none,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Medicine time is needed';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            label: Text(
                              'Enter medicine time',
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(18),
                                topRight: Radius.circular(18),
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                          ),
                          onTap: () async {
                            TimeOfDay? time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            medicineTimeController.text = time!.format(context);
                          },
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            const Text(
                              'From:',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                              child: Container(
                                height: 50,
                                child: TextFormField(
                                  controller: medicineFromController,
                                  keyboardType: TextInputType.none,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Medicine time is needed';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    label: Text(
                                      'from',
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(18),
                                        topRight: Radius.circular(18),
                                        topLeft: Radius.circular(8),
                                        bottomLeft: Radius.circular(8),
                                      ),
                                    ),
                                  ),
                                  onTap: () async {
                                    DateTime? date = await showDatePicker(
                                      firstDate: DateTime.now(),
                                      initialDate: DateTime.now(),
                                      lastDate: DateTime(2035),
                                      context: context,
                                    );
                                    medicineFromController.text =
                                    date!.toString().split(' ')[0];
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            const Text(
                              'To:',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                              child: Container(
                                height: 50,
                                child: TextFormField(
                                  controller: medicineToController,
                                  keyboardType: TextInputType.none,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Medicine time is needed';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    label: Text(
                                      'to',
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(18),
                                        topRight: Radius.circular(18),
                                        topLeft: Radius.circular(8),
                                        bottomLeft: Radius.circular(8),
                                      ),
                                    ),
                                  ),
                                  onTap: () async {
                                    DateTime? date = await showDatePicker(
                                      firstDate: DateTime.now(),
                                      initialDate: DateTime.now(),
                                      lastDate: DateTime(2035),
                                      context: context,
                                    );
                                    medicineToController.text =
                                    date!.toString().split(' ')[0];
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Repetition:',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DropdownButton(
                              isExpanded: false,
                              hint: Text(repetitions!),
                              items: const [
                                DropdownMenuItem(
                                  value: 'Daily',
                                  child: Text('Daily'),
                                ),
                                DropdownMenuItem(
                                  value: 'Weekly',
                                  child: Text('Weekly'),
                                ),
                                DropdownMenuItem(
                                  value: 'Monthly',
                                  child: Text('Monthly'),
                                ),
                              ],
                              onChanged: (value) {
                                repetitions = value as String?;
                                debugPrint(repetitions!);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                cubit.saveMedicineData(
                    userID: '1',
                    medicineName: medicineNameController.text,
                    medicineTime: medicineTimeController.text,
                    medicineFrom: medicineFromController.text,
                    medicineTo: medicineToController.text,
                    repetition: repetitions!,
                );
                if(state is SaveMedicineDataSuccessState){
                  showToast(
                    msg: 'Medicine added successfully',
                    state: ToastState.SUCCESS,
                  );
                  Navigator.pop(context);
                }
              },
              backgroundColor: defaultColor,
              clipBehavior: Clip.antiAlias,
              child: const Icon(Icons.add),
            )
        );
      },
    );
  }
}
