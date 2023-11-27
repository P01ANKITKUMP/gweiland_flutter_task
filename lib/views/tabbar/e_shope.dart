import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gweiland_flutter_task/blocs/trigger/cubit/trigger_cubit.dart';
import 'package:gweiland_flutter_task/domain/entity/trigger_model.dart';
import 'package:gweiland_flutter_task/utils/common_exports.dart';
import 'package:gweiland_flutter_task/utils/extensions.dart';

class EshopeTab extends StatefulWidget {
  const EshopeTab({super.key});

  @override
  State<EshopeTab> createState() => _EshopeTabState();
}

class _EshopeTabState extends State<EshopeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          AppStrings.appbar,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return BlocBuilder<TriggerCubit, TriggerState>(
      builder: (context, state) {
        if (state is TriggerInitial) {
          final fetachState = state as TriggerInitial;

          return Column(
            children: [
              _firstWidget(fetachState.triggerModel),
              const SizedBox(
                height: 20,
              ),
              _secondThirdWidgets(fetachState.triggerModel),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _firstWidget(TriggerModel triggerModel) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(border: Border.all()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(AppStrings.widget1),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Achived Counter: ${triggerModel.totalSuccessCount}',
            style: const TextStyle(fontSize: 22),
          ),
          const SizedBox(
            height: 8,
          ),
          if (triggerModel.isEqual != null)
            Text(
              triggerModel.isEqual! ? 'Success!' : 'Try Again!',
              style: const TextStyle(fontSize: 14),
            ),
        ],
      ),
    );
  }

  Widget _secondThirdWidgets(TriggerModel triggerModel) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3.5,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
              child: InkWell(
            onTap: () {
              final Random random = Random();
              final int randomNumber = random
                  .nextRandomNumber(); // Generates a random number from 0 to 59
              bool isEqual =
                  random.isRandomEqualToTimestampSeconds(randomNumber);
              if (isEqual) {
                final existCounter = triggerModel.totalSuccessCount ?? 0;
                final r = existCounter + 1;
                BlocProvider.of<TriggerCubit>(context)
                    .tapping(randomNumber, r, isEqual);
              } else {
                BlocProvider.of<TriggerCubit>(context).tapping(
                    randomNumber, triggerModel.totalSuccessCount ?? 0, isEqual);
              }
            },
            child: Container(
              decoration: BoxDecoration(border: Border.all()),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(AppStrings.widget2),
                  ),
                ],
              ),
            ),
          )),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(border: Border.all()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text(AppStrings.widget3),
                ),
                Text(
                  'No: ${triggerModel.tapValue}',
                  style: const TextStyle(fontSize: 22),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
