import 'dart:ffi';
import 'dart:ffi' as ffi;
import 'dart:io';

import 'ffi_rust_plugin_bindings_generated.dart';

/// Here we must use the rust compiled library
// const String _libName = 'ffi_rust_plugin';
const String _libName = 'n_body_rust_simulation';

/// The dynamic library in which the symbols for [FfiRustPluginBindings] can be found.
final DynamicLibrary _dylib = () {
  if (Platform.isMacOS || Platform.isIOS) {
    return DynamicLibrary.open('$_libName.framework/$_libName');
  }
  if (Platform.isAndroid || Platform.isLinux) {
    return DynamicLibrary.open('lib$_libName.so');
  }
  if (Platform.isWindows) {
    return DynamicLibrary.open('lib/$_libName.dll');
  }
  throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
}();

/// The bindings to the native functions in [_dylib].
final FfiRustPluginBindings _bindings = FfiRustPluginBindings(_dylib);

ffi.Pointer<NBody> initRust(
  int particlesAmount,
  double canvasWidth,
  double canvasHeight,
  double minMass,
  double maxMass,
  ffi.Pointer<NBody> previousPtr,
) {
  return _bindings.init(
    particlesAmount,
    canvasWidth,
    canvasHeight,
    minMass,
    maxMass,
    previousPtr,
  );
}

ffi.Pointer<ffi.Pointer<ParticleRust>> updateParticlesRust(
  ffi.Pointer<NBody> nBodyPtr,
) {
  return _bindings.update_particles(nBodyPtr);
}
