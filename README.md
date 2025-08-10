# i_tdd

A utility-first package for simplifying Clean Architecture and Test-Driven Development in Flutter using Dart. It provides a wide range of abstract use cases, parameter objects, error handling extensions, and state classes, all designed to make your code more modular, testable, and maintainable.

---

## Features

- ✅ Ready-to-use abstract classes for Future, Stream, Either, and Option-based use cases
- 🧱 Parameter classes like `NoParams` and `ListQuery`
- 🧩 Extensions for error handling and reporting with `Either`
- 🧼 Clean Bloc state classes and a utility `LoadingCubit`
- 🧪 Designed with TDD and Clean Architecture in mind

---

## Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  i_tdd: latest_version
```

Then run:

```bash
flutter pub get
```

---

## Usage

### 1. Define a Use Case

```dart
class GetItems extends IEitherUseCase<List<Item>, NoParams> {
  @override
  Future<Either<IFailure, List<Item>>> call(NoParams params) {
    // implement business logic
  }
}
```

### 2. Bloc Integration

```dart
class ItemsCubit extends Cubit<BaseState> {
  final GetItems getItems;

  ItemsCubit(this.getItems) : super(Initial());

  void fetchItems() async {
    emit(DataLoading());
    final result = await getItems(NoParams());

    result.handleReport(
      onSuccess: (data) => emit(DataLoaded()),
      onFailed: (msg) => emit(ErrorState(msg)),
      onEmpty: () => emit(ErrorState('No items found')),
    );
  }
}
```

### 3. Load Stream Data

```dart
streamUseCase.loadStreamData(
  params: NoParams(),
  onLoading: () => emit(DataLoading()),
  onSuccess: (data) => emit(DataLoaded()),
  onEmpty: () => emit(ErrorState('No stream data')),
  onFailed: (msg) => emit(ErrorState(msg)),
);
```

---

## API Overview

### Abstract Use Cases

- `IEitherUseCase`
- `IEitherNonFutureUseCase`
- `IEitherStreamUseCase`
- `IOptionUseCase`
- `IOptionStreamUseCase`
- `IFutureOptionStreamUseCase`
- `IStreamUseCase`
- `IFutureUseCase`
- `IUseCase`

### Params

- `NoParams`
- `ListQuery`

### Extensions

- `ErrorHandlingExtension` on `Object`
- `ReportEitherExtensions` on `Either`
- `FutureStreamDataLoadingExtension` for `IFutureOptionStreamUseCase`
- `StreamDataLoadingExtension` for `IOptionStreamUseCase`
- `StreamDataHandlingExtension` for `Option<Stream>`

### States

- `BaseState` and concrete states: `Initial`, `DataLoading`, `DataLoaded`, `ErrorState`, etc.
- `FormSubmissionState` and states: `InitialFormState`, `FormSubmitting`, `SubmissionSuccess`, `SubmissionFailed`

### Utilities

- `LoadingCubit`
- Typedefs for `SuccessCallback`, `FailureCallback`, `StreamCallback`

---

## License

MIT License. See [LICENSE](LICENSE) for details.

---

## Contribution

Contributions are welcome! Please submit issues and pull requests to help improve this package.

