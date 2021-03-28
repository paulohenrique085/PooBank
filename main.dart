import 'dart:io';

class Banco {
  String _nome;
  int _senha;
  double _saldo = 0;

  //quando ultilizo "_" na frente da variável eu estou a protegendo e elas só
  //podem ser vistas naquele escopo da class, para
  //acessá-las ultilizo os métodos (get= mostra conteúdo) e (set=altera conteúdo)

  //aplicando métodos em _nome
  get gnome {
    return _nome;
  }

  set snome(String nome) {
    _nome = nome;
  }

  //aplicando métodos em _senha
  get gsenha {
    return _senha;
  }

  set ssenha(int senha) {
    _senha = senha;
  }

//aplicando métodos em _saldo
  get gsaldo {
    return _saldo;
  }

  set ssaldo(double valor) {
    _saldo = _saldo + valor;
  }

  //metodos ou comportamentos da classe

  void criarConta() {
    print('-- Digite seu nome:\n');
    snome = stdin.readLineSync();
    print('-- Informe sua senha:\n');
    ssenha = int.parse(stdin.readLineSync());
  }

  void depositar() {
    print('-- Informe o valor a ser depositado:\n');
    ssaldo = double.parse(stdin.readLineSync());
  }

  void sacar() {
    print('Informe o valor a ser sacado:\n');
    double saque = double.parse(stdin.readLineSync());

    if (gsaldo < saque || gsaldo <= 0) {
      print('Valor inválido\n');
    } else {
      //ssaldo= ssaldo-saque
      ssaldo = -saque;
    }
  }
}

Banco conta1 = Banco();

//função menu
void menu() {
  print('-- MENU PRINCIPAL--\n');
  print('1-Cadastrar usuário\n');
  print('2-Acessar conta\n');
  int opcao = int.parse(stdin.readLineSync());

  switch (opcao) {
    case 1:
      conta1.criarConta();
      break;
    case 2:
      verificacao();
      break;
    default:
  }
}

void verificacao() {
  print('Informe seu nome:\n');
  String nome = stdin.readLineSync();
  print('Informe sua senha:\n');
  int senha = int.parse(stdin.readLineSync());

  if (nome == conta1.gnome && senha == conta1.gsenha) {
    dentroDaconta();
  } else {
    print('Login inválido!\n');
  }
}

void dentroDaconta() {
  bool controle = true;
  while (controle) {
    print('-- BEM VINDO --');
    print('O QUE DESEJA FAZER?\n');
    print('1-SACAR\n');
    print('2-DEPOSITAR\n');
    print('3-VER SALDO\n');
    print('4-SAIR\n');
    int opc = int.parse(stdin.readLineSync());
    switch (opc) {
      case 1:
        conta1.sacar();
        break;
      case 2:
        conta1.depositar();
        break;
      case 3:
        print('Seu saldo é:${conta1.gsaldo}');
        break;
      case 4:
        main();
        break;
      default:
    }
  }
}

void main() {
  bool controle = true;
  while (controle) {
    menu();
  }
}
