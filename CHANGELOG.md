# Changelog

All notable changes to this project will be documented in this file.

## 0.0.2

### Jul 25, 2025

**🗑️ Removed**

* `FormSubmissionState`
* `BaseBloc`
* `LoadingCubit`

**♻️ Changed**

* Replaced `ReportEitherExtensions` with a new version `ResultEitherExtensions` on `Either<L, R>` to better conform to functional and reactive programming practices.

  * Added a return type `Future<R?>` to make the method more versatile and chainable.
  * Used nullability to clearly express the absence of a result.
  * Improved error and stack trace logging.
  * Provided consistent handling for empty list checks (`successReport is List && successReport.isEmpty`).

### Notes

* The new `ResultEitherExtensions.handleReport` allows for better integration in `async` workflows and makes handling success/failure/empty-list states easier and safer.
* Deprecated the old `ReportEitherExtensions` usage in favor of this newer and cleaner implementation.

## 0.0.1

### Added

* Abstract use case interfaces:

  * `IEitherUseCase`, `IEitherNonFutureUseCase`, `IEitherStreamUseCase`
  * `IOptionUseCase`, `IOptionStreamUseCase`, `IFutureOptionStreamUseCase`
  * `IStreamUseCase`, `IFutureUseCase`, `IUseCase`
* Parameter models: `NoParams`, `ListQuery`
* State management classes:

  * `BaseState`, `Initial`, `DataLoading`, `DataLoaded`, `ErrorState`, etc.
  * `FormSubmissionState`, `InitialFormState`, `FormSubmitting`, etc.
* Cubit utility: `LoadingCubit`
* Typedefs: `SuccessCallback`, `FailureCallback`, `StreamCallback`
* Extensions for error handling and reporting:

  * `ErrorHandlingExtension` on `Object`
  * `ReportEitherExtensions` on `Either`
  * `StreamDataHandlingExtension` on `Option<Stream>`
  * `FutureStreamDataLoadingExtension` and `StreamDataLoadingExtension` for loading patterns

### Notes

* Designed to support Clean Architecture and Test-Driven Development in Flutter apps.
* Works well with packages like `dartz`, `equatable`, and `flutter_bloc`.
