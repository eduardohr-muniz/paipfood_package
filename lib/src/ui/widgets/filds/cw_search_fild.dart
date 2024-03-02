import 'package:flutter/material.dart';

import 'package:paipfood_package/paipfood_package.dart';

/// Flutter code sample for [SearchBar].

class CwSearchFild extends StatefulWidget {
  final String? initialValue;
  final String? label;
  final double? maxheight;
  final String? hintText;
  final SearchController searchController;
  final int debounceMilisecons;
  final Future<List<Widget>> Function(String)? onChanged;
  final bool searchOnTap;
  const CwSearchFild({
    required this.searchController,
    Key? key,
    this.initialValue,
    this.label,
    this.maxheight,
    this.hintText,
    this.debounceMilisecons = 0,
    this.onChanged,
    this.searchOnTap = true,
  }) : super(key: key);

  @override
  State<CwSearchFild> createState() => _CwSearchFildState();
}

class _CwSearchFildState extends State<CwSearchFild> {
  late final debounce = Debounce(miliseconds: widget.debounceMilisecons);
  List<Widget> children = [];
  String fildContent = '';
  bool _init = false;

  @override
  void initState() {
    if (widget.initialValue != null) {
      fildContent = widget.initialValue!;
    }
    widget.searchController.addListener(() {
      if (!widget.searchController.isOpen) {
        widget.searchController.selection = TextSelection.fromPosition(const TextPosition(offset: 0));
        FocusScope.of(context).unfocus();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(widget.label!, style: context.textTheme.labelMedium, overflow: TextOverflow.ellipsis)),
        SearchAnchor(
            viewHintText: widget.hintText,
            headerHintStyle: context.textTheme.labelLarge!.copyWith(color: context.color.secondaryText.withOpacity(0.5)),
            viewSurfaceTintColor: context.responsive.isMobile ? context.color.primaryBG : context.color.onPrimaryBG,
            viewBackgroundColor: context.responsive.isMobile ? context.color.primaryBG : context.color.onPrimaryBG,
            viewConstraints: context.responsive.isMobile ? null : const BoxConstraints(maxHeight: 300),
            isFullScreen: context.responsive.isMobile ? true : false,
            viewShape: context.responsive.isMobile
                ? null
                : const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    side: BorderSide(
                      color: PColors.primaryColor_,
                    ),
                  ),
            dividerColor: context.color.secondaryText.withOpacity(0.2),
            searchController: widget.searchController,
            builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                hintText: widget.hintText,

                hintStyle:
                    MaterialStatePropertyAll<TextStyle>(context.textTheme.labelLarge!.copyWith(color: context.color.secondaryText.withOpacity(0.5))),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    side: BorderSide(
                      width: context.isDarkTheme ? 0 : 1,
                      color: context.isDarkTheme ? context.color.onPrimaryBG : PColors.neutral_.get300,
                    ),
                  ),
                ),
                backgroundColor: MaterialStatePropertyAll(context.color.onPrimaryBG),
                surfaceTintColor: MaterialStatePropertyAll(context.color.onPrimaryBG),
                elevation: const MaterialStatePropertyAll(0),
                controller: controller,
                // constraints: const BoxConstraints(
                //   maxHeight: 45,
                //   minHeight: 45,
                // ),
                padding: const MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(horizontal: 16.0)),
                onTap: () async {
                  if (widget.searchOnTap && _init == false) {
                    children = await widget.onChanged?.call("a") ?? [];
                  }
                  fildContent = controller.value.text;
                  controller.openView();
                  widget.searchController.selection =
                      TextSelection.fromPosition(TextPosition(offset: widget.searchController.value.text.length, affinity: TextAffinity.upstream));
                },
                onChanged: (_) {
                  controller.openView();
                },
                leading: const Icon(Icomoon.search_normal),
              );
            },
            suggestionsBuilder: (BuildContext conte, SearchController controller) async {
              final String value = controller.value.text;
              if (value.isEmpty && children.isNotEmpty && _init) {
                if (widget.searchOnTap) return children;
                return children = [];
              }
              if (fildContent != value && _init == true) {
                await debounce.startTimer(
                    value: controller.value.text,
                    onComplete: () async {
                      children = await widget.onChanged?.call(value) ?? [];
                      fildContent = value;
                    },
                    lenght: 3);
              }
              _init = true;

              return children;
            }),
      ],
    );
  }
}
