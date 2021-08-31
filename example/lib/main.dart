import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:epson_epos/epson_epos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<EpsonPrinterModel> printers = [];

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('EPSON ePOS'),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: onDiscoveryTCP, child: Text('Discovery TCP')),
                Flexible(
                    child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    final printer = printers[index];
                    return ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text('${printer.model} | ${printer.series}'),
                      subtitle: Text('${printer.address}'),
                      trailing: TextButton(
                          onPressed: () {
                            // onSetPrinterSetting(printer);
                            onPrintTest(printer);
                          },
                          child: Text('Print Test')),
                    );
                  },
                  itemCount: printers.length,
                  primary: false,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                ))
              ],
            ),
          ),
        )),
      ),
    );
  }

  buildPrinter() {}

  onDiscoveryTCP() async {
    try {
      List<EpsonPrinterModel>? data =
          await EpsonEPOS.onDiscovery(type: EpsonEPOSPortType.TCP);
      if (data != null && data.length > 0) {
        data.forEach((element) {
          print(element.toJson());
        });
        setState(() {
          printers = data;
        });
      }
    } catch (e) {
      log("Error: " + e.toString());
    }
  }

  void onSetPrinterSetting(EpsonPrinterModel printer) async {
    try {
      await EpsonEPOS.setPrinterSetting(printer, paperWidth: 80);
    } catch (e) {
      log("Error: " + e.toString());
    }
  }

  void onPrintTest(EpsonPrinterModel printer) async {
    EpsonEPOSCommand command = EpsonEPOSCommand();
    List<Map<String, dynamic>> commands = [];
    commands.add(command.addTextAlign(EpsonEPOSTextAlign.LEFT));
    commands.add(command.addFeedLine(1));
    commands.add(command.append('EPSON ePOS Testing\n'));
    commands.add(command.addTextAlign(EpsonEPOSTextAlign.CENTER));
    commands.add(command.append('Center\n'));
    commands.add(command.addTextAlign(EpsonEPOSTextAlign.LEFT));
    commands.add(command.addTextSmooth(EPOS2_TRUE));
    commands.add(command.addTextSize(width: 2, height: 2));
    commands.add(command.append('Large\n'));
    commands.add(command.addTextSize());
    commands.add(command.append('Default Text size\n'));
    commands.add(command.addTextStyle(reverse: EPOS2_TRUE));
    commands.add(command.append('Reverse\n'));
    commands.add(command.addTextStyle(ul: EPOS2_TRUE));
    commands.add(command.append('Underline\n'));
    commands.add(command.addTextStyle(em: EPOS2_TRUE));
    commands.add(command.append('Empasis\n'));
    commands.add(command.addTextStyle(color: Epos2Color.EPOS2_COLOR_2.index));
    commands.add(command.append('Color 1\n'));
    commands.add(command.addTextStyle());
    // commands.add(command.addPulse(drawer: EPOS2_PARAM_DEFAULT, time: Epos2Pulse.EPOS2_PULSE_200.index));
    commands.add(command.addTextFont(font: Epos2Font.EPOS2_FONT_B.index));
    commands.add(command.append('Color 1\n'));
    commands.add(command.addTextFont());

    // commands.add(command.addCut(EpsonEPOSCut.CUT_FEED));
    final resp = await EpsonEPOS.onPrint(printer, commands);
    print(resp);
  }
}
