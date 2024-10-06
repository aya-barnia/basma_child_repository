//
// import 'package:pusher_client/pusher_client.dart';
//
// class PusherService {
//   late PusherClient pusher;
//   late Channel channel;
//
//   PusherService() {
//     PusherOptions options = PusherOptions(
//       cluster: 'eu', // Replace with your Pusher cluster
//       encrypted: true,
//     );
//
//     pusher = PusherClient(
//       'a1d40d932b2bd22d28ea', // Replace with your Pusher app key
//       options,
//       autoConnect: false,
//     );
//
//     pusher.connect();
//     pusher.onConnectionStateChange((state) {
//       print("previousState: ${state?.previousState}, currentState: ${state?.currentState}");
//     });
//
//     pusher.onConnectionError((error) {
//       print("error: ${error?.message}");
//     });
//   }
//
//   void subscribe(String channelName) {
//     channel = pusher.subscribe(channelName);
//   }
//
//   void bind(String eventName, Function(String) onEvent) {
//     channel.bind(eventName, (PusherEvent? event) {
//       if (event?.data != null) {
//         onEvent(event!.data!);
//       }
//     });
//   }
//
//   void disconnect() {
//     pusher.disconnect();
//   }
// }
//





//////////////////////////////////////
// import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

// class PusherService {
//   late PusherChannelsFlutter pusher;

//   Future<void> initPusher() async {
//     pusher = PusherChannelsFlutter.getInstance();
//     try {
//       await pusher.init(
//         apiKey: "a1d40d932b2bd22d28ea",
//         cluster: "eu",
//         // onConnectionStateChange: (state) {
//         //   print("Pusher connection state: ${state.currentState}");
//         // },
//         // onError: (String message, String code) {
//         //   print("Pusher error: $message (code: $code)");
//         // },
//       );
//       await pusher.subscribe(
//         channelName: 'your-channel-name',
//       );

//       pusher.onEvent!(
//             (event) {
//           if (event.eventName == 'new_message') {
//             print("Received new message: ${event.data}");
//             // Handle the new message event
//           }
//         } as PusherEvent,
//       );
//       await pusher.subscribe(channelName: 'chat_channel');
//       // await pusher.bind(
//       //   'new_message',
//       //       (event) {
//       //     print("Received new message: ${event.data}");
//       //     // Handle the new message event
//       //   },
//       // );
//       await pusher.connect();
//     } catch (e) {
//       print("Pusher initialization error: $e");
//     }
//   }
// }


import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class PusherService {
  late PusherChannelsFlutter pusher;

  Future<void> initPusher() async {
    pusher = PusherChannelsFlutter.getInstance();
    try {
      await pusher.init(
        apiKey: "a1d40d932b2bd22d28ea",
        cluster: "eu",
        // onConnectionStateChange: (state) {
        //   print("Pusher connection state: ${state.currentState}");
        // },
        // onError: (String message, String code) {
        //   print("Pusher error: $message (code: $code)");
        // },
      );
      await pusher.subscribe(
        channelName: 'your-channel-name',
      );

      pusher.onEvent!(
            (event) {
          if (event.eventName == 'new_message') {
            print("Received new message: ${event.data}");
            // Handle the new message event
          }
        } as PusherEvent,
      );
      await pusher.subscribe(channelName: 'chat_channel');
      // await pusher.bind(
      //   'new_message',
      //       (event) {
      //     print("Received new message: ${event.data}");
      //     // Handle the new message event
      //   },
      // );
      await pusher.connect();
    } catch (e) {
      print("Pusher initialization error: $e");
    }
  }
}
