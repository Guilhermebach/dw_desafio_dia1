class Menu {
  final int id;
  final String nome;
  final double preco;

  Menu({
    this.id,
    this.nome,
    this.preco,
  });

  Menu.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nome = json['nome'],
        preco = json['preco'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'preco': preco,
    };
  }
}
