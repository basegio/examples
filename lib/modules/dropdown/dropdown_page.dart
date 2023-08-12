import 'dart:math';

import 'package:flutter/material.dart';

class DropdownPage extends StatefulWidget {
  const DropdownPage({super.key});

  @override
  State<DropdownPage> createState() => _DropdownPageState();
}

class _DropdownPageState extends State<DropdownPage> {
  String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _Dropdown(
              label: name == null ? 'Selecione um nome' : name!,
              options: const [
                'Alessandro Baségio',
                'Renato da Costa',
              ],
              onChanged: (p0) {
                setState(() {
                  name = p0;
                });
              },
            ),
            const SizedBox(height: 16.0),
            Text(
              texts[Random().nextInt(texts.length)]
                  .replaceAll('{{nome}}', name ?? '{{nome}}'),
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  final texts = const [
    'Inspirando o Dia de {{nome}}: Olá, querido(a) {{nome}}! Hoje é um dia especial, repleto de possibilidades e oportunidades. Lembre-se de que cada momento é uma chance de crescer, aprender e se tornar a melhor versão de si mesmo(a). Às vezes, a vida pode apresentar desafios, mas a sua força interior é capaz de superá-los. Mantenha seus sonhos vivos, siga em frente com determinação e lembre-se de que estou aqui para apoiar você em sua jornada. Acredite em si mesmo(a) e permita que sua luz brilhe intensamente hoje e sempre.',
    'Uma Mensagem Especial para {{nome}}: Querido(a) {{nome}}, queria dedicar um momento para lembrá-lo(a) de quão incrível você é. Sua presença ilumina a vida daqueles ao seu redor e deixa uma marca positiva por onde passa. Lembre-se de que suas ações e palavras têm um impacto significativo, então continue sendo a pessoa gentil, generosa e amorosa que você é. Não importa quais obstáculos possam surgir, saiba que você tem a resiliência necessária para enfrentá-los. Mantenha seus sonhos vivos e persevere, pois o mundo é um lugar melhor com você nele.',
    'Explorando o Potencial de {{nome}}: Olá, {{nome}}! Hoje, quero convidá-lo(a) a refletir sobre o seu potencial ilimitado. Cada dia é uma página em branco que você pode preencher com suas experiências, paixões e conquistas. A jornada da vida é cheia de curvas e reviravoltas, mas é essa jornada que molda quem você é. Lembre-se de que o sucesso não é apenas medido por grandes realizações, mas também pelas pequenas vitórias e momentos significativos ao longo do caminho. À medida que você avança em direção aos seus objetivos, lembre-se de que estou aqui torcendo por você, acreditando em você e celebrando cada passo do seu percurso.',
    'Uma Mensagem de Empoderamento para {{nome}}: Querido(a) {{nome}}, hoje é um dia para celebrar a sua força interior e coragem. Você é uma pessoa incrível, capaz de enfrentar desafios de cabeça erguida e superar adversidades com determinação. Lembre-se de que as dificuldades podem servir como oportunidades de crescimento e aprendizado. Mantenha seus olhos fixos nos seus objetivos, pois cada passo que você dá te aproxima mais de alcançá-los. Sua jornada é única e valiosa, e eu acredito no seu poder de criar um futuro brilhante para si mesmo(a). Continue sendo a inspiração que você é.',
  ];
}

class _Dropdown extends StatelessWidget {
  final String label;
  final List<String> options;
  final Function(String?)? onChanged;
  const _Dropdown({
    required this.label,
    required this.options,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final RenderBox renderBox = context.findRenderObject() as RenderBox;
        final position = renderBox.localToGlobal(Offset.zero);
        showMenu(
          constraints: BoxConstraints.tightFor(
            width: renderBox.size.width,
          ),
          context: context,
          position: RelativeRect.fromLTRB(
            position.dx,
            position.dy + renderBox.size.height,
            position.dx,
            position.dy,
          ),
          items: options.map((e) {
            return PopupMenuItem(
              padding: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(e),
              ),
              onTap: () => onChanged?.call(e),
            );
          }).toList(),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
