import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_scan_bluetooth/flutter_scan_bluetooth.dart';
import 'package:wifi_info_plugin/wifi_info_plugin.dart';

class FlutterBluetooth with ChangeNotifier{
  //General
  FlutterBlue flutterBlue = FlutterBlue.instance;
  bool isOnline;

  //Local:
  FlutterScanBluetooth _device = FlutterScanBluetooth();
  String _feed = "No Connection";
  bool  _isScanning = false;

  FlutterBluetooth({
   @required this.isOnline,
});

  //Initialize
  FlutterBluetooth.initialize(){
    scanForNearbyDevices();
  }

  //Getters
  String getFeed()=> _feed;

  //Turn On Device
  void turnDeviceOn() async {
    isOnline = await flutterBlue.isOn;
    notifyListeners();
  }

  //Scanner
  Future<void> scanForNearbyDevices() async {
    //Turn Device On
    turnDeviceOn();

    //Check if Device is Online
    if(!isOnline){
      _feed = "Device is not online";
      return null;
    }else{
      //Scan for Bluetooth Devices
      await _device.startScan(pairedDevices: false);

      //Print number of devices connected
      _device.devices.toList().then((value) => print("Number of Devices Connected: ${value.length}"));

      //
      _device.devices.listen((event){
        //Clear Feed
        if (event != null) _feed = "";

        //Save Device Name + Address into Feed
        _feed = _feed + event.name+' (${event.address})\n';
        notifyListeners();
        return _feed;
      });
    }

  }




}