import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_webservice/places.dart' as place;

class TextFieldSearch extends StatefulWidget {
  final List<place.Prediction> initialList;
  final String? label;
  final TextEditingController controller;
  final InputDecoration? decoration;
  final int minStringLength;
  final int itemsInView;
  final RxBool loading;
  final ValueChanged<place.Prediction> onSelectedItem;
  final ValueChanged<String> onChanged;
  final ValueChanged<bool>? onFocus;

  const TextFieldSearch(
      {Key? key,
      required this.initialList,
      this.label,
      required this.loading,
      required this.controller,
      required this.onSelectedItem,
      required this.onChanged,
      this.onFocus,
      this.decoration,
      this.itemsInView = 3,
      this.minStringLength = 2})
      : super(key: key);

  @override
  TextFieldSearchState createState() => TextFieldSearchState();
}

class TextFieldSearchState extends State<TextFieldSearch> {
  final FocusNode _focusNode = FocusNode();
  late OverlayEntry _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  static const itemHeight = 55;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (widget.onFocus != null) widget.onFocus!(_focusNode.hasFocus);
      if (_focusNode.hasFocus) {
        widget.controller.selection = TextSelection(
            baseOffset: 0, extentOffset: widget.controller.text.length);
        _overlayEntry = _createOverlayEntry();
        Overlay.of(context).insert(_overlayEntry);
      } else {
        _overlayEntry.remove();
      }
    });
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  Widget _listViewBuilder(context) {
    return Obx(() => ListView.builder(
          controller: _scrollController,
          itemCount: widget.initialList.length,
          itemBuilder: (context, i) {
            return GestureDetector(
                onTap: () {
                  widget.onSelectedItem(widget.initialList[i]);

                  FocusScope.of(context).unfocus();
                },
                child: ListTile(
                    title: Text(widget.initialList[i].description ?? '')));
          },
          padding: EdgeInsets.zero,
          shrinkWrap: true,
        ));
  }

  Widget _loadingIndicator() {
    return SizedBox(
      width: 50,
      height: 50,
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }

  Widget decoratedScrollbar(child) {
    return Scrollbar(child: child);
  }

  Widget _listViewContainer(context) {
    return Obx(() => SizedBox(
        height: widget.initialList.isEmpty ? 0 : calculateHeight().toDouble(),
        child: decoratedScrollbar(_listViewBuilder(context))));
  }

  num heightByLength(int length) {
    return itemHeight * length;
  }

  num calculateHeight() {
    if (widget.initialList.length > 1) {
      if (widget.itemsInView <= widget.initialList.length) {
        return heightByLength(widget.itemsInView);
      }

      return heightByLength(widget.initialList.length);
    }

    return itemHeight;
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Size overlaySize = renderBox.size;
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    return OverlayEntry(
        builder: (context) => Positioned(
              width: overlaySize.width,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset(0.0, overlaySize.height + 5.0),
                child: Material(
                  elevation: 4.0,
                  child: Obx(() => ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: screenWidth,
                        maxWidth: screenWidth,
                        minHeight: 0,
                        maxHeight: calculateHeight().toDouble(),
                      ),
                      child: widget.loading.value
                          ? _loadingIndicator()
                          : _listViewContainer(context))),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextField(
        controller: widget.controller,
        focusNode: _focusNode,
        decoration:
            widget.decoration ?? InputDecoration(labelText: widget.label),
        onChanged: widget.onChanged,
      ),
    );
  }
}
