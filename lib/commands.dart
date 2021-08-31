import 'const.dart';
import 'enums.dart';

class EpsonEPOSCommand {
  String _enumText(dynamic enumName) {
    List<String> ns = enumName.toString().split('.');
    if (ns.length > 0) {
      return ns.last;
    }
    return enumName.toString();
  }

  Map<String, dynamic> append(dynamic data) {
    return {"id": "appendText", "value": data};
  }

  Map<String, dynamic> addFeedLine(dynamic data) {
    return {"id": "addFeedLine", "value": data};
  }

  Map<String, dynamic> addLineSpace(int data) {
    return {"id": "addLineSpace", "value": data};
  }

  Map<String, dynamic> addCut(EpsonEPOSCut data) {
    final cutData = _enumText(data);
    return {"id": "addCut", "value": cutData};
  }

  Map<String, dynamic> addTextAlign(EpsonEPOSTextAlign data) {
    final cutData = _enumText(data);
    return {"id": "addTextAlign", "value": cutData};
  }

  Map<String, dynamic> addTextSmooth(int smooth) {
    return {"id": "addTextSmooth", "value": smooth};
  }

  Map<String, dynamic> addTextSize({
    int width = EPOS2_PARAM_DEFAULT,
    int height = EPOS2_PARAM_DEFAULT,
  }) {
    Map<String, dynamic> cmd = {
      "id": "addTextSize",
    };
    cmd['width'] = width;
    cmd['height'] = height;
    return cmd;
  }

  Map<String, dynamic> addTextStyle({
    int reverse = EPOS2_PARAM_DEFAULT,
    int ul = EPOS2_PARAM_DEFAULT,
    int em = EPOS2_PARAM_DEFAULT,
    int color = EPOS2_PARAM_DEFAULT,
  }) {
    Map<String, dynamic> cmd = {
      "id": "addTextStyle",
    };
    cmd['reverse'] = reverse;
    cmd['ul'] = ul;
    cmd['em'] = em;
    cmd['color'] = color;
    return cmd;
  }

  // trigger draw
  Map<String, dynamic> addPulse({
    int drawer = EPOS2_PARAM_DEFAULT,
    int time = EPOS2_PARAM_DEFAULT,
  }) {
    Map<String, dynamic> cmd = {
      "id": "addPulse",
    };
    cmd['drawer'] = drawer;
    cmd['time'] = time;
    return cmd;
  }

  Map<String, dynamic> addTextFont({
    int font = EPOS2_PARAM_DEFAULT,
  }) {
    Map<String, dynamic> cmd = {
      "id": "addTextFont",
    };
    cmd['font'] = font;
    return cmd;
  }

  Map<String, dynamic> appendBitmap(dynamic data, int width, int height, int posX, int posY) {
    Map<String, dynamic> cmd = {"id": "addImage", "value": data};
    cmd['width'] = width;
    cmd['height'] = height;
    cmd['posX'] = posX;
    cmd['posY'] = posY;

    return cmd;
  }
}
