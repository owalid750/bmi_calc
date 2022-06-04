import 'dart:math';
import 'package:bmi_cal/bmi_cubit/cubit.dart';
import 'package:bmi_cal/layout/cubit/cubit.dart';
import 'package:bmi_cal/layout/cubit/states.dart';
import 'package:bmi_cal/modules/bmi_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "BMI Calculator",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              actions: [
                IconButton(
                    onPressed: () {
                     BmiCubit.get(context).changeMode();
                    },
                    icon: const Icon(Icons.dark_mode))
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              cubit.toggle1();
                            },
                            child: Container(
                                width: 120,
                                height: 150,
                                decoration: BoxDecoration(
                                    color: cubit.isMale == true
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children:  [
                                    Icon(
                                      Icons.male,
                                      color: Theme.of(context).iconTheme.color,
                                      size: 100,
                                    ),
                                   const Text("Male",
                                        style: TextStyle(fontSize: 20)),
                                  ],
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              cubit.toggle1();
                            },
                            child: Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                    color: !cubit.isMale == true
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children:  [
                                    Icon(
                                      Icons.female,
                                        color: Theme.of(context).iconTheme.color,
                                      size: 100,
                                    ),
                                   const Text("Female",
                                        style: TextStyle(fontSize: 20)),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("HEIGTH"),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${cubit.heigth.round()}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 30),
                              ),
                              const Text("CM")
                            ],
                          ),
                          Slider(
                              min: 90,
                              max: 220,
                              value: cubit.heigth,
                              onChanged: (val) {
                                cubit.onChangeHeight(val);
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              const  Text("AGE"),
                                Text("${cubit.age}"),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(
                                      mini: true,
                                      onPressed: () {
                                        cubit.onRemoveAge();
                                      },
                                      child:const Icon(
                                        Icons.remove,
                                      ),
                                      heroTag: "age--",
                                    ),
                                    FloatingActionButton(
                                      mini: true,
                                      onPressed: () {
                                        cubit.onAddAge();
                                      },
                                      child:const Icon(
                                        Icons.add,
                                      ),
                                      heroTag: "age++",
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                               const Text("WEIGHT"),
                                Text("${cubit.weigth}"),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(
                                      mini: true,
                                      onPressed: () {
                                        cubit.onRemoveWeight();
                                      },
                                      child: const Icon(
                                        Icons.remove,
                                      ),
                                      heroTag: "weight--",
                                    ),
                                    FloatingActionButton(
                                      mini: true,
                                      onPressed: () {
                                        cubit.onAddWeight();
                                      },
                                      child:const Icon(
                                        Icons.add,
                                      ),
                                      heroTag: "weight++",
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // ignore: sized_box_for_whitespace
                Container(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          cubit.result =
                              (cubit.weigth / pow(cubit.heigth / 100, 2))
                                  .round();

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ResultScreen(
                              age: cubit.age,
                              isMale: cubit.isMale,
                              result: cubit.result,
                            );
                          }));
                        },
                        child: Text(
                          "Calculate",
                          style: Theme.of(context).textTheme.bodyText2,
                        )))
              ],
            ),
          );
        },
      ),
    );
  }
}
