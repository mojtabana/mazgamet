import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mazgamet/model.dart';
import 'package:mazgamet/utils.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mazgamet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  List<Box> boxs = [];
  List<Box> boxs2 = [];


  double? t(Situation situation) {
    switch (situation) {
      case Situation.s1:
        return 195;
      case Situation.s2:
        return 615;
      case Situation.s3:
        return null;
    }
  }

  double? r(Situation situation) {
    switch (situation) {
      case Situation.s1:
        return 40;
      case Situation.s2:
        return 40;
      case Situation.s3:
        return 500;
    }
  }

  double? b(Situation situation) {
    switch (situation) {
      case Situation.s1:
        return null;
      case Situation.s2:
        return null;
      case Situation.s3:
        return 100;
    }
  }

  Duration getDuration(Situation situation) {
    switch (situation) {
      case Situation.s1:
        return const Duration(milliseconds: 500);
      case Situation.s2:
        return const Duration(milliseconds: 500);
      case Situation.s3:
        return const Duration(milliseconds: 500);
    }
  }

  @override
  Widget build(BuildContext context) {
    boxs = ref.watch(boxProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        boxs2 = ref.read(boxProvider);
        switch (boxs2[0].situation) {
          case Situation.s1:
            ref.read(boxProvider.notifier).update(0, Situation.s3);
            ref.read(boxProvider.notifier).update(1, Situation.s1);
            ref.read(boxProvider.notifier).update(2, Situation.s2);
            break;
          case Situation.s2:
            ref.read(boxProvider.notifier).update(0, Situation.s1);
            ref.read(boxProvider.notifier).update(1, Situation.s2);
            ref.read(boxProvider.notifier).update(2, Situation.s3);
            break;
          case Situation.s3:
            ref.read(boxProvider.notifier).update(0, Situation.s2);
            ref.read(boxProvider.notifier).update(1, Situation.s3);
            ref.read(boxProvider.notifier).update(2, Situation.s1);
            break;
        }
      }),
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Center(
            child: Text(
              "مازقامت",
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            AnimatedPositioned(
              top: t(boxs[0].situation),
              right: r(boxs[0].situation),
              bottom: b(boxs[0].situation),
              duration: getDuration(boxs[0].situation),
              child: Container(
                height: 400,
                width: 250,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                child: const Center(child: Text("0")),
              ),
            ),
            AnimatedPositioned(
              top: t(boxs[1].situation),
              right: r(boxs[1].situation),
              bottom: b(boxs[1].situation),
              duration: getDuration(boxs[1].situation),
              child: Container(
                height: 400,
                width: 250,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                child: const Center(child: Text("1")),
              ),
            ),
            AnimatedPositioned(
              top: t(boxs[2].situation),
              right: r(boxs[2].situation),
              bottom: b(boxs[2].situation),
              duration: getDuration(boxs[2].situation),
              child: Container(
                height: 400,
                width: 250,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                child: const Center(child: Text("2")),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
