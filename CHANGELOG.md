# Changelog

All notable changes to this project will be documented in this file.

## 0.0.1
### Added
- Abstract use case interfaces:
    - `IEitherUseCase`, `IEitherNonFutureUseCase`, `IEitherStreamUseCase`
    - `IOptionUseCase`, `IOptionStreamUseCase`, `IFutureOptionStreamUseCase`
    - `IStreamUseCase`, `IFutureUseCase`, `IUseCase`
- Parameter models: `NoParams`, `ListQuery`
- State management classes:
    - `BaseState`, `Initial`, `DataLoading`, `DataLoaded`, `ErrorState`, etc.
    - `FormSubmissionState`, `InitialFormState`, `FormSubmitting`, etc.
- Cubit utility: `LoadingCubit`
- Typedefs: `SuccessCallback`, `FailureCallback`, `StreamCallback`
- Extensions for error handling and reporting:
    - `ErrorHandlingExtension` on `Object`
    - `ReportEitherExtensions` on `Either`
    - `StreamDataHandlingExtension` on `Option<Stream>`
    - `FutureStreamDataLoadingExtension` and `StreamDataLoadingExtension` for loading patterns

### Notes

- Designed to support Clean Architecture and Test-Driven Development in Flutter apps.
- Works well with packages like `dartz`, `equatable`, and `flutter_bloc`.
