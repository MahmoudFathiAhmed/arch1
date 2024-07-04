import 'package:flutter/material.dart';
//need to custom styles of popup
class CustomPopupMenuButton<T> extends StatelessWidget {
  final List<CustomPopupMenuItem<T>> items;
  final Widget child;
  final Function(T) onSelected;

  const CustomPopupMenuButton({super.key, required this.items, required this.child, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<T>(
      onSelected: onSelected,
      position: PopupMenuPosition.under,
      // constraints: const BoxConstraints(maxWidth: 100, maxHeight: 90),
      // elevation: 1.5,
      // shadowColor: Colors.grey.shade400,
      // surfaceTintColor: Colors.white,
      // padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context) {
        return items;
      },
      child: child,
    );
  }
}


class CustomPopupMenuItem<T> extends PopupMenuItem<T> {
  const CustomPopupMenuItem({super.key, required Widget child, required T value})
      : super(value: value, child: child);

  @override
  PopupMenuItemState<T, CustomPopupMenuItem<T>> createState() =>
      _CustomPopupMenuItemState<T>();
}

class _CustomPopupMenuItemState<T>
    extends PopupMenuItemState<T, CustomPopupMenuItem<T>> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context, widget.value);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: widget.child,
      ),
    );
  }
}


