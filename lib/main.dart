import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'dart:io';
import 'package:flutter/services.dart';


void main() {
    runApp(MyApp());
    if(Platform.isAndroid){
        //设置Android头部的导航栏透明
        SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark 
            //light:黑色图标 dark：白色图标 
            //在此处设置statusBarIconBrightness为全局设置
        );
        SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.blue,
            ),
            home: MyHomePage(),
        );
    }
}

class MyHomePage extends StatefulWidget {
    @override
    _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                toolbarHeight: 0,
                excludeHeaderSemantics: false,
                elevation: 0,
            ),
            body: WebviewScaffold(
                url: 'https://www.hao123.com/',
                withZoom: false,
                withLocalStorage: true,
                withJavascript: true,
                hidden: true,
                // 三行解决安卓自动缩放问题,三个参数缺一不可
                useWideViewPort: true,
                displayZoomControls:true,
                withOverviewMode: true
            ),
        );
    }
}
