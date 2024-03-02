enum HoursEnum {
  am0(label: "00:00", dateString: "1970-01-01 00:00:00Z", value: 0),
  am0_30(label: "00:30", dateString: "1970-01-01 00:30:00Z", value: 0.5),
  am1(label: "01:00", dateString: "1970-01-01 01:00:00Z", value: 1),
  am1_30(label: "01:30", dateString: "1970-01-01 01:30:00Z", value: 1.5),
  am2(label: "02:00", dateString: "1970-01-01 02:00:00Z", value: 2),
  am2_30(label: "02:30", dateString: "1970-01-01 02:30:00Z", value: 2.5),
  am3(label: "03:00", dateString: "1970-01-01 03:00:00Z", value: 3),
  am3_30(label: "03:30", dateString: "1970-01-01 03:30:00Z", value: 3.5),
  am4(label: "04:00", dateString: "1970-01-01 04:00:00Z", value: 4),
  am4_30(label: "04:30", dateString: "1970-01-01 04:30:00Z", value: 4.5),
  am5(label: "05:00", dateString: "1970-01-01 05:00:00Z", value: 5),
  am5_30(label: "05:30", dateString: "1970-01-01 05:30:00Z", value: 5.5),
  am6(label: "06:00", dateString: "1970-01-01 06:00:00Z", value: 6),
  am6_30(label: "06:30", dateString: "1970-01-01 06:30:00Z", value: 6.5),
  am7(label: "07:00", dateString: "1970-01-01 07:00:00Z", value: 7),
  am7_30(label: "07:30", dateString: "1970-01-01 07:30:00Z", value: 7.5),
  am8(label: "08:00", dateString: "1970-01-01 08:00:00Z", value: 8),
  am8_30(label: "08:30", dateString: "1970-01-01 08:30:00Z", value: 8.5),
  am9(label: "09:00", dateString: "1970-01-01 09:00:00Z", value: 9),
  am9_30(label: "09:30", dateString: "1970-01-01 09:30:00Z", value: 9.5),
  am10(label: "10:00", dateString: "1970-01-01 10:00:00Z", value: 10),
  am10_30(label: "10:30", dateString: "1970-01-01 10:30:00Z", value: 10.5),
  am11(label: "11:00", dateString: "1970-01-01 11:00:00Z", value: 11),
  am11_30(label: "11:30", dateString: "1970-01-01 11:30:00Z", value: 11.5),
  am12(label: "12:00", dateString: "1970-01-01 12:00:00Z", value: 12),
  am12_30(label: "12:30", dateString: "1970-01-01 12:30:00Z", value: 12.5),
  pm1(label: "13:00", dateString: "1970-01-01 13:00:00Z", value: 13),
  pm1_30(label: "13:30", dateString: "1970-01-01 13:30:00Z", value: 13.5),
  pm2(label: "14:00", dateString: "1970-01-01 14:00:00Z", value: 14),
  pm2_30(label: "14:30", dateString: "1970-01-01 14:30:00Z", value: 14.5),
  pm3(label: "15:00", dateString: "1970-01-01 15:00:00Z", value: 15),
  pm3_30(label: "15:30", dateString: "1970-01-01 15:30:00Z", value: 15.5),
  pm4(label: "16:00", dateString: "1970-01-01 16:00:00Z", value: 16),
  pm4_30(label: "16:30", dateString: "1970-01-01 16:30:00Z", value: 16.5),
  pm5(label: "17:00", dateString: "1970-01-01 17:00:00Z", value: 17),
  pm5_30(label: "17:30", dateString: "1970-01-01 17:30:00Z", value: 17.5),
  pm6(label: "18:00", dateString: "1970-01-01 18:00:00Z", value: 18),
  pm6_30(label: "18:30", dateString: "1970-01-01 18:30:00Z", value: 18.5),
  pm7(label: "19:00", dateString: "1970-01-01 19:00:00Z", value: 19),
  pm7_30(label: "19:30", dateString: "1970-01-01 19:30:00Z", value: 19.5),
  pm8(label: "20:00", dateString: "1970-01-01 20:00:00Z", value: 20),
  pm8_30(label: "20:30", dateString: "1970-01-01 20:30:00Z", value: 20.5),
  pm9(label: "21:00", dateString: "1970-01-01 21:00:00Z", value: 21),
  pm9_30(label: "21:30", dateString: "1970-01-01 21:30:00Z", value: 21.5),
  pm10(label: "22:00", dateString: "1970-01-01 22:00:00Z", value: 22),
  pm10_30(label: "22:30", dateString: "1970-01-01 22:30:00Z", value: 22.5),
  pm11(label: "23:00", dateString: "1970-01-01 23:00:00Z", value: 23),
  pm11_30(label: "23:30", dateString: "1970-01-01 23:30:00Z", value: 23.5),
  pm12(label: "23:59", dateString: "1970-01-01 23:59:00Z", value: 23.9);

  final String label;
  final String dateString;
  final double value;

  DateTime get dateTime => DateTime.parse(dateString);

  const HoursEnum({required this.label, required this.dateString, required this.value});
  static HoursEnum fromMap(double value) => HoursEnum.values.firstWhere((element) => element.value == value);
}

enum WeekDayEnum {
  monday(label: "segunda", id: 1),
  tuesday(label: "terca", id: 2),
  wednesday(label: "quarta", id: 3),
  thursday(label: "quinta", id: 4),
  friday(label: "sexta", id: 5),
  saturday(label: "sabado", id: 6),
  sunday(label: "domingo", id: 7);

  final String label;
  final int id;

  const WeekDayEnum({required this.label, required this.id});
  static WeekDayEnum fromMap(int id) => WeekDayEnum.values.firstWhere((element) => element.id == id);
}
