MODULE c08ex01;

IMPORT In, Out, Escola;

VAR
  aluno: Escola.Aluno;
  nomeLido: ARRAY 64 OF CHAR;
  mediaLida: REAL;
  pausa: CHAR;

BEGIN
  Out.String("--- Teste de POO Oberon-07 ---"); Out.Ln;
  Out.Ln;

  Out.String("Definindo nome do aluno ..: Joao Silva"); Out.Ln;
  Escola.PoeNome(aluno, "Joao Silva");
  Out.String("Definindo media do aluno .: 85.5"); Out.Ln;
  Escola.PoeMedia(aluno, 85.5);

  Out.Ln;

  Out.String("Obtendo nome do aluno ....: ");
  Escola.PegaNome(aluno, nomeLido);
  Out.String(nomeLido); Out.Ln;

  Out.String("Obtendo media do aluno ...: ");
  mediaLida := Escola.PegaMedia(aluno);
  Out.Fixed(mediaLida, 0, 1); Out.Ln;

  Out.Ln;
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa);
END c08ex01.
