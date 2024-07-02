enum RequestState { loading, loaded, error }
enum ViewOrientation {
  orientationVertical(0),
  orientationHorizontal(1),
  orientationGrid(2),
  orientationFlexibleRow(3);

  final int value;

  const ViewOrientation(this.value);

  @override
  String toString() => value.toString();
}