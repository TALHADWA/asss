import 'package:api/Model/model.dart';
import 'package:api/Rivrepod/api.dart';
import 'package:api/livestream.dart';
import 'package:api/videoplayer/videoplay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LiveStreamskl()));
            },
            child: Text("Live Stream")),
      ),
      body: Consumer(builder: ((context, ref, child) {
        
        final asdx = ref.watch(asd);
  
        return Container(
            height: 1000,
            width: 1000,
            color: Colors.red,
            child: asdx.when(data: ((data) {
              return ListView.builder(
                  itemCount: data?.data?.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title: InkWell(
                          onTap: () {
                            String url = data!.data![index].assets?.mp4 ?? "";
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    VideoPlayerScreen(videoUrl: url)));
                          },
                          child: Text(data!.data![index].title.toString())),
                      leading: Container(
                        height: 100,
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
