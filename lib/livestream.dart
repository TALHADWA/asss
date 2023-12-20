import 'package:api/Rivrepod/api.dart';
import 'package:api/videoplayer/videoplay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LiveStreamskl extends StatefulWidget {
  const LiveStreamskl({super.key});

  @override
  State<LiveStreamskl> createState() => _LiveStreamsklState();
}

class _LiveStreamsklState extends State<LiveStreamskl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: ((context, ref, child) {
        final asdxs = ref.watch(live);
        return Container(
            height: 1000,
            width: 1000,
            color: Colors.red,
            child: asdxs.when(data: ((data) {
              return ListView.builder(
                  itemCount: 22,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title: InkWell(
                          onTap: () {
                            String url =
                                data.data![index].assets!.hls.toString();
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                    VideoPlayerScreen(videoUrl: url)));
                          },
                          child: Text(data!.data![index].name.toString())),
                      leading: Container(
                        height: 106660,
                        width: 100,
                        color: Colors.green,
                        child: Image.network(
                            data.data![index].assets!.thumbnail.toString()),
                      ),
                    );
                  }));
            }), error: ((error, stackTrace) {
              return Text(error.toString());
            }), loading: (() {
              return const Text("Ffdgdf");
            })));
      })),
    );
  }
}
