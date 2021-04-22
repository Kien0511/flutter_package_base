import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package_base/src/widget/ink_well_widget.dart';

import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class CustomDatePickerWidget extends StatelessWidget {
  final ValueChanged<DateTime> onDateTimeChange;
  final VoidCallback onCancel;
  final DateTime initialDate;
  final String title;
  final String textSettings;
  final String textCancel;
  final String dateFormat;

  final DateTime minDateTime;
  final DateTime maxDateTime;

  CustomDatePickerWidget({
    Key key,
    this.onDateTimeChange,
    this.initialDate,
    @required this.title,
    this.minDateTime,
    this.maxDateTime,
    this.textSettings = "設定",
    this.textCancel = "キャンセル",
    this.dateFormat = "yyyy年,MM月,dd日", this.onCancel,
  }) : super(key: key);

  final defaultTextStyle = TextStyle(color: Colors.grey, fontSize: 16);
  final selectedTextStyle = TextStyle(
    color: Color(0xFF1C1C1E),
    fontSize: 20,
  );

  @override
  Widget build(BuildContext context) {
    DateTime _dateSelected = initialDate ?? DateTime(DateTime.now().year - 50);

    return FractionallySizedBox(
      heightFactor: 0.8,
      child: Column(
        children: [
          Container(
            color: Color(0xFFF6F6F6),
            height: 44,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 20,
                  child: CustomInkWell(
                      onTap: () {
                        onCancel?.call();
                      },
                      child: Text(
                        textCancel,
                        style: TextStyle(
                          color: Color(0xFF636366),
                        ),
                      )),
                ),
                Center(
                    child: Text(
                  title,
                  style: TextStyle(
                      color: Color(0xFF1C1C1E), fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
                Positioned(
                  right: 20,
                  child: CustomInkWell(
                      onTap: () {
                        onDateTimeChange?.call(_dateSelected);
                      },
                      child: Text(
                        textSettings,
                        style: TextStyle(
                          color: Color(0xFF357AF8),
                        ),
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: DatePickerWidget(
              initialDateTime: _dateSelected,
              locale: DateTimePickerLocale.jp,
              minDateTime: minDateTime,
              maxDateTime: maxDateTime,
              dateFormat: dateFormat,
              onChange: (date, _) {
                _dateSelected = date;
              },
              pickerTheme: DateTimePickerTheme(
                  showTitle: false,
                  pickerHeight: double.infinity,
                  itemTextStyle: selectedTextStyle),
            ),
          ),
        ],
      ),
    );
  }
}
