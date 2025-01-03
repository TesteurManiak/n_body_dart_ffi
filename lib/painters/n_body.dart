import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:n_body_dart_ffi/models/methods.dart';
import 'package:n_body_dart_ffi/models/particles.dart';
import 'package:n_body_dart_ffi/models/simulation_managers.dart';
import 'package:n_body_dart_ffi/painters/dart_native_painter.dart';
import 'package:n_body_dart_ffi/painters/dart_painter.dart';
import 'package:n_body_dart_ffi/painters/experiment_painter.dart';

class NBodyDrawer extends StatefulWidget {
  final Size canvasSize;
  final Method method;
  final int particlesAmount;

  const NBodyDrawer({
    required this.canvasSize,
    required this.method,
    required this.particlesAmount,
    super.key,
  });

  @override
  State<NBodyDrawer> createState() => _NBodyDrawerState();
}

class _NBodyDrawerState extends State<NBodyDrawer>
    with TickerProviderStateMixin {
  late CustomPainter painter;
  late Ticker ticker;

  late SimulationManager simulationManager;

  @override
  void initState() {
    super.initState();

    init();
  }

  void init() {
    switch (widget.method) {
      case Method.dart:
        simulationManager = NBodySimulationManagerDart(
          particlesAmount: widget.particlesAmount,
          canvasSize: widget.canvasSize,
        )..init();
        painter = NBodyPainterDart(
          particles: simulationManager.particles as List<ParticleDart>,
        );
      case Method.dartNative:
        simulationManager = NBodySimulationManagerDartNative(
          particlesAmount: widget.particlesAmount,
          canvasSize: widget.canvasSize,
        )..init();
        painter = NBodyPainterDartNative(
          particles: simulationManager.particles as List<ParticleDartNative>,
        );
      case Method.experiment:
        simulationManager = NBodySimulationManagerExperiment(
          particlesAmount: widget.particlesAmount,
          canvasSize: widget.canvasSize,
        )..init();
        painter = NBodyPainterExperiment(
          particles: simulationManager.particles as List<ParticleDartNative>,
        );
    }

    ticker = Ticker(tick);
    ticker.start();
  }

  @override
  void dispose() {
    ticker.dispose();
    super.dispose();
  }

  void tick(Duration elapsed) {
    if (context.mounted) {
      setState(() {
        simulationManager.updateParticles();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRect(
          key: UniqueKey(),
          child: CustomPaint(
            painter: painter,
            size: MediaQuery.sizeOf(context),
          ),
        ),
      ],
    );
  }
}
