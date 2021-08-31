import 'models.dart';

final List<EPSONSeries> epsonSeries = [
  EPSONSeries(id: "TM_M10", models: ["TM-m10"]),
  EPSONSeries(id: "TM_M30", models: ["TM-m30"]),
  EPSONSeries(id: "TM_M30II", models: [
    "TM-m30II",
    "TM-m30II-H",
    "TM-m30II-NT",
    "TM-m30II-S",
    "TM-m30II-SL",
  ]),
  EPSONSeries(id: "TM_M50", models: ["TM-m50"]),
  EPSONSeries(id: "TM_P20", models: ["TM-P20"]),
  EPSONSeries(id: "TM_P60", models: ["TM-P60 (Receipt/Peeler)"]),
  EPSONSeries(id: "TM_P60II", models: ["TM-P60II (Receipt/Peeler)"]),
  EPSONSeries(id: "TM_P80", models: ["TM-P80"]),
  EPSONSeries(id: "TM_T20", models: [
    "TM-T20",
    "TM-T20II",
    "TM-T20II-i",
    "TM-T20III",
    "TM-T20IIIL",
    "TM-T20X",
  ]),
  EPSONSeries(id: "TM_T60", models: ["TM-T60"]),
  EPSONSeries(id: "TM_T70", models: [
    "TM-T70",
    "TM-T70-i",
    "TM-T70II",
    "TM-T70II-DT",
    "TM-T70II-DT2",
  ]),
  EPSONSeries(id: "TM_T81", models: ["TM-T81II", "TM-T81III"]),
  EPSONSeries(id: "TM_T82", models: [
    "TM-T82",
    "TM-T82II",
    "TM-T82II-i",
    "TM-T82III",
    "TM-T82IIIL",
    "TM-T82X",
  ]),
  EPSONSeries(id: "TM_T83", models: [
    "TM-T83II",
    "TM-T83II-i",
  ]),
  EPSONSeries(id: "TM_T83III", models: ["TM-T83III"]),
  EPSONSeries(id: "TM_T88", models: [
    "TM-T88IV",
    "TM-T88V",
    "TM-T88VI",
    "TM-T88V-i",
    "TM-T88VI- iHUB",
    "TM-T88V-DT",
    "TM-T88VI-DT2",
  ]),
  EPSONSeries(id: "TM_T90", models: ["TM-T90"]),
  EPSONSeries(id: "TM_T100", models: ["TM-T100"]),
  EPSONSeries(id: "TM_U220", models: [
    "TM-U220",
    "TM-U220-i",
  ]),
  EPSONSeries(id: "TM_U330", models: ["TM-U330"]),
  EPSONSeries(id: "TM_L90", models: ["TM-L90"]),
  EPSONSeries(id: "TM_H6000", models: [
    "TM-H6000IV",
    "TM-H6000V",
    "TM-H6000IV-DT",
  ]),
];

const EPOS2_FALSE = 0;
const EPOS2_TRUE = 1;
const EPOS2_PARAM_UNSPECIFIED = -1;
const int EPOS2_PARAM_DEFAULT = -2;
const EPOS2_UNKNOWN = -3;

enum Epos2Color { EPOS2_COLOR_NONE, EPOS2_COLOR_1, EPOS2_COLOR_2, EPOS2_COLOR_3, EPOS2_COLOR_4 }

enum Epos2Drawer { EPOS2_DRAWER_2PIN, EPOS2_DRAWER_5PIN }

enum Epos2Pulse { EPOS2_PULSE_100, EPOS2_PULSE_200, EPOS2_PULSE_300, EPOS2_PULSE_400, EPOS2_PULSE_500 }
enum Epos2Font { EPOS2_FONT_A, EPOS2_FONT_B, EPOS2_FONT_C, EPOS2_FONT_D, EPOS2_FONT_E }
