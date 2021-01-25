import 'package:dart_amqp/dart_amqp.dart';

class RMQService {
  final String userQueue = "homeauto";
  final String passQueue = "homeauto12345!";
  final String vHostQueue = "/Homeauto";
  final String hostQueue = "192.168.4.2";
  final String queues = "Sensor";

  void publish(String message) {
    ConnectionSettings settings = new ConnectionSettings(
      host: hostQueue,
      authProvider: new PlainAuthenticator(userQueue, passQueue),
      virtualHost: vHostQueue,
    );
    Client client = new Client(settings: settings);
    print("kirim data");
    client.channel().then((Channel channel) {
      return channel.queue(queues, durable: true);
    }).then((Queue queue) {
      queue.publish(message);
      client.close();
    });
  }
}
