abstract class Mapper<T, F> {
  T handle(F f);
  T fromModel(F f) => handle((f ?? {}) as F);

  List<T> fromModelList(List<F>? map) => map?.map((i) => fromModel(i)).toList() ?? [];
}
