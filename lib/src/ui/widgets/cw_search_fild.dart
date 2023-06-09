part of 'package:paipfood_package/paipfood_package.dart';

class CwSearchFild extends StatefulWidget {
  final void Function(dynamic)? onSelectedCallBack;
  final MenuController? menuController;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String label;
  final List<Widget>? children;
  final String? hintText;
  final List<dynamic> list;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController controller;
  final void Function(String)? onChanged;

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

  const CwSearchFild({
    Key? key,
    this.onSelectedCallBack,
    this.menuController,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    required this.label,
    required this.children,
    this.hintText,
    required this.list,
    this.inputFormatters,
    required this.controller,
    this.onChanged,
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
      focusNode.hasFocus ? widget.menuController?.open() : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            MenuAnchor(
              alignmentOffset: const Offset(0, 1),
              menuChildren: [
                SizedBox(width: constraints.maxWidth),
                Column(
                  children: widget.children ?? [],
                )
              ],
              controller: widget.menuController,
              child: CwTextFormFild(
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.suffixIcon,
                controller: widget.controller,
                onChanged: widget.onChanged,
                srinkWrap: false,
                expanded: true,
                label: widget.label,
                hintText: widget.hintText,
                focusNode: focusNode,
              ),
            ),
            const CwSizedBox()
          ],
        );
      },
    );
  }
}
