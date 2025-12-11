MODULE c08ex02;

IMPORT In, Out, Escola2;

VAR
  aluno: Escola2.Aluno;
  nomeLido: ARRAY 64 OF CHAR;
  mediaLida: REAL;
  salaLida: INTEGER;
  pausa: CHAR;

BEGIN
  Out.String("--- Teste de POO Oberon-07");
  Out.String(" (Heranca com Sala) ---"); Out.Ln;
  Out.Ln;

  Out.String("Definindo nome do aluno ..: Joao Silva");
  Out.Ln;
  Escola2.PoeNome(aluno, "Joao Silva");
  Out.String("Definindo media do aluno .: 85.5");
  Out.Ln;
  Escola2.PoeMedia(aluno, 85.5);
  Out.String("Definindo sala do aluno ..: 101");
  Out.Ln;
  Escola2.PoeSala(aluno, 101);

  Out.Ln;

  Out.String("Obtendo nome do aluno ....: ");
  Escola2.PegaNome(aluno, nomeLido);
  Out.String(nomeLido); Out.Ln;

  Out.String("Obtendo media do aluno ...: ");
  mediaLida := Escola2.PegaMedia(aluno);
  Out.Fixed(mediaLida, 0, 1); Out.Ln;

  Out.String("Obtendo sala do aluno ....: ");
  salaLida := Escola2.PegaSala(aluno);
  Out.Int(salaLida, 0); Out.Ln;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa);
END c08ex02.
