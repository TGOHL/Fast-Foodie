// ignore_for_file: constant_identifier_names

enum Lane { Top, Jungle, Mid, Adc, Sup }

class LaneConverter {
  static String getLaneImage(Lane lane) {
    String l;
    switch (lane) {
      case Lane.Adc:
        l = 'assets/images/lanes/adc.png';
        break;
      case Lane.Mid:
        l = 'assets/images/lanes/mid.png';
        break;
      case Lane.Top:
        l = 'assets/images/lanes/top.png';
        break;
      case Lane.Sup:
        l = 'assets/images/lanes/sup.png';
        break;
      case Lane.Jungle:
        l = 'assets/images/lanes/jun.png';
        break;

      default:
        l = 'assets/images/lanes/adc.png';
    }
    return l;
  }

  static String laneToString(Lane lane) {
    String l;
    switch (lane) {
      case Lane.Adc:
        l = 'Adc';
        break;
      case Lane.Mid:
        l = 'Mid';
        break;
      case Lane.Top:
        l = 'Top';
        break;
      case Lane.Sup:
        l = 'Sup';
        break;
      case Lane.Jungle:
        l = 'Jungle';
        break;

      default:
        l = 'Adc';
    }
    return l;
  }

  static Lane stringToLane(String lane) {
    Lane l;
    switch (lane) {
      case 'Adc':
        l = Lane.Adc;
        break;
      case 'Mid':
        l = Lane.Mid;
        break;
      case 'Top':
        l = Lane.Top;
        break;
      case 'Sup':
        l = Lane.Sup;
        break;
      case 'Jungle':
        l = Lane.Jungle;
        break;

      default:
        l = Lane.Adc;
    }
    return l;
  }
}
