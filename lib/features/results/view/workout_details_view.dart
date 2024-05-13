import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartfit_development/app/utils/workout_helper.dart';
import 'package:smartfit_development/features/results/bloc/results_cubit.dart';
import 'package:video_player/video_player.dart';

class WorkoutDetailsView extends StatefulWidget {
  const WorkoutDetailsView({Key? key}) : super(key: key);

  static const String routeName = '/workout_details';

  @override
  State<WorkoutDetailsView> createState() => _WorkoutDetailsViewState();
}

class _WorkoutDetailsViewState extends State<WorkoutDetailsView> {
  VideoPlayerController? controller;
  bool isInitialized = false;
  bool isPlaying = false;
  double value = 1;

  @override
  void initState() {
    super.initState();

    context.read<ResultsCubit>().initVideo();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width - 40;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Workout Details'),
        ),
        body: BlocConsumer<ResultsCubit, ResultsState>(
            listener: (context, state) {
              if (state.status == RequestStatus.success) {
                controller = VideoPlayerController.networkUrl(state.video!,
                    videoPlayerOptions: VideoPlayerOptions())
                  ..initialize().then((_) {
                    setState(() {
                      isInitialized = true;
                    });
                  });

                controller!.addListener(() {
                  setState(() {
                    value = controller!.value.position.inMilliseconds /
                        controller!.value.duration.inMilliseconds;
                  });
                });
              }
            },
            listenWhen: (previous, current) => previous.video != current.video,
            buildWhen: (previous, current) => previous.video != current.video,
            builder: (context, state) {
              if (state.status == RequestStatus.loadingDetails ||
                  !isInitialized) {
                return const Center(child: CircularProgressIndicator());
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    AspectRatio(
                        aspectRatio: 1, child: VideoPlayer(controller!)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: SizedBox(
                              height: 30,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 5,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                          height: 35,
                                          width: 3,
                                          margin: EdgeInsets.only(
                                              left: width * value),
                                          color: Colors.black)),
                                  ...(state.currentWorkout!.results_bottom ??
                                          [])
                                      .sublist(
                                          0,
                                          state.currentWorkout!.results_bottom!
                                                  .length -
                                              1)
                                      .map((frame) => Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            margin: EdgeInsets.only(
                                                left: max(
                                                    (width * (frame / 280)) - 5,
                                                    0)),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.black),
                                                color: Colors.white),
                                            child: const Text('B',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          )))
                                      .toList(),
                                  ...(state.currentWorkout!.results_top ?? [])
                                      .map((frame) => Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            margin: EdgeInsets.only(
                                                left: max(
                                                    (width * (frame / 280)) - 5,
                                                    0)),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.black),
                                                color: Colors.white),
                                            child: const Text('T',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          )))
                                      .toList()
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    controller!.seekTo(
                                        controller!.value.position -
                                            const Duration(milliseconds: 100));
                                  },
                                  icon: const Icon(Icons.arrow_back_ios,
                                      size: 30)),
                              IconButton(
                                  onPressed: () {
                                    if (!isPlaying) {
                                      controller!.play();
                                      setState(() {
                                        isPlaying = true;
                                      });
                                    } else {
                                      controller!.pause();
                                      setState(() {
                                        isPlaying = false;
                                      });
                                    }
                                  },
                                  icon: isPlaying
                                      ? const Icon(Icons.pause, size: 30)
                                      : const Icon(Icons.play_arrow, size: 30)),
                              IconButton(
                                  onPressed: () {
                                    controller!.seekTo(
                                        controller!.value.position +
                                            const Duration(milliseconds: 100));
                                  },
                                  icon: const Icon(Icons.arrow_forward_ios,
                                      size: 30)),
                            ],
                          ),
                          Text(
                              'Overall result: ${accuracy(state.currentWorkout!).toStringAsFixed(1)}',
                              style: const TextStyle(fontSize: 24))
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
