import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paipfood_package/paipfood_package.dart';

/// Cria um campo de pesquisa personalizado.
///
/// [children] suaLista.map((value) => ListTile()).toList()
/// [onSelectedCallBack] é uma função de retorno de chamada que será chamada quando um item da lista for selecionado.
/// [obscureText] define se o texto digitado deve ser ocultado.
/// [suffixIcon] é um ícone exibido à direita do campo de pesquisa.
/// [prefixIcon] é um ícone exibido à esquerda do campo de pesquisa.
/// [label] é o rótulo do campo de pesquisa.
/// [hintText] é o texto de sugestão exibido quando o campo de pesquisa está vazio.
/// [list] é uma lista de itens a serem exibidos como sugestões de pesquisa.
/// [inputFormatters] é uma lista de formatação de entrada para aplicar ao campo de pesquisa.
/// [controller] é o controlador de texto para o campo de pesquisa.
/// [onChanged] é uma função de retorno de chamada que será chamada quando o texto do campo de pesquisa for alterado.
class CwSearchFild extends StatefulWidget {
  final void Function(dynamic)? onSelectedCallBack;
  final String? initialValue;
  final MenuController menuController;
  final double? maxheight;
  final double heightChild;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String label;
  final List<Widget>? children;
  final String? hintText;
  final List<dynamic> list;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final MaskInputController? maskUtils;
  final AutovalidateMode? autovalidateMode;

  const CwSearchFild({
    required this.label,
    required this.children,
    required this.list,
    required this.menuController,
    Key? key,
    this.initialValue,
    this.controller,
    this.onSelectedCallBack,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.inputFormatters,
    this.onChanged,
    this.maskUtils,
    this.autovalidateMode,
    this.heightChild = 50,
    this.maxheight = 350,
  }) : super(key: key);

  @override
  State<CwSearchFild> createState() => _CwSearchFildState();
}

class _CwSearchFildState extends State<CwSearchFild> {
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) widget.menuController.open();
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return MenuAnchor(
          alignmentOffset: const Offset(0, -7),
          menuChildren: [
            Material(
              elevation: 8,
              child: SizedBox(
                height: max(min((widget.children?.length ?? 0) * widget.heightChild, widget.maxheight ?? 350), 0),
                width: constraints.maxWidth,
                child: SingleChildScrollView(
                  child: Column(
                    children: widget.children ?? [],
                  ),
                ),
              ),
            )
          ],
          controller: widget.menuController,
          child: CwTextFormFild(
            initialValue: widget.initialValue,
            maskUtils: widget.maskUtils,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            controller: widget.controller,
            onChanged: widget.onChanged,
            label: widget.label,
            hintText: widget.hintText,
            focusNode: focusNode,
            autovalidateMode: widget.autovalidateMode,
          ),
        );
      },
    );
  }
}
