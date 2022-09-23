class SocketStream<T> {
  SocketStream({required this.stream, required this.close});

  final Stream<T> stream;
  final void Function() close;
}
