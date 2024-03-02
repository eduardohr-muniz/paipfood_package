class PersonModel {
  String nome;
  int idade;

  PersonModel({
    this.nome = '',
    this.idade = 0,
  });

  String get nomeIdade => "$nome ($idade)";

  void updateName(String name) {
    if (idade < 18) return;
    nome = name;
  }
}
