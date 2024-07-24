// ignore_for_file: constant_identifier_names

enum Availability {
  VeryLikelyOpen('Very Likely Open'),
  VeryLikelyClosed('Very Likely Closed'),
  LikelyOpen('Likely Open'),
  LikelyClosed('Likely Closed'),
  Unsure('N/A');

  final String label;

  const Availability(this.label);
}
