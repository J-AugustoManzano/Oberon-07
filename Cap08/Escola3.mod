MODULE Escola3;

TYPE
  (* Classe Sala *)
  Sala* = RECORD
    numeroSala: INTEGER
  END;

  (* Classe Turma *)
  Turma* = RECORD
    codigoTurma: INTEGER
  END;

  (* Classe Aluno com COMPOSIÇÃO de Sala e Turma *)
  Aluno* = RECORD
    nome*: ARRAY 64 OF CHAR;
    media*: REAL;
    dadosSala*: Sala;
    dadosTurma*: Turma
  END;

(* Métodos para a classe Sala *)

PROCEDURE PoeSala*(VAR s: Sala; numero: INTEGER);
BEGIN
  s.numeroSala := numero
END PoeSala;

PROCEDURE PegaSala*(s: Sala): INTEGER;
BEGIN
  RETURN s.numeroSala
END PegaSala;

(* Métodos para a classe Turma *)

PROCEDURE PoeTurma*(VAR t: Turma; codigo: INTEGER);
BEGIN
  t.codigoTurma := codigo
END PoeTurma;

PROCEDURE PegaTurma*(t: Turma): INTEGER;
BEGIN
  RETURN t.codigoTurma
END PegaTurma;

(* Métodos para a classe Aluno *)

PROCEDURE PoeNome*(VAR a: Aluno; novoNome: ARRAY OF CHAR);
VAR
  i: INTEGER;
BEGIN
  i := 0;
  WHILE (novoNome[i] # 0X) & (i < LEN(a.nome) - 1) DO
    a.nome[i] := novoNome[i];
    INC(i);
  END;
  a.nome[i] := 0X;
END PoeNome;

PROCEDURE PegaNome*(a: Aluno; VAR nomeRetornado: ARRAY OF CHAR);
VAR
  i: INTEGER;
BEGIN
  i := 0;
  WHILE (a.nome[i] # 0X) & (i < LEN(nomeRetornado) - 1) DO
    nomeRetornado[i] := a.nome[i];
    INC(i);
  END;
  nomeRetornado[i] := 0X;
END PegaNome;

PROCEDURE PoeMedia*(VAR a: Aluno; novaMedia: REAL);
BEGIN
  a.media := novaMedia
END PoeMedia;

PROCEDURE PegaMedia*(a: Aluno): REAL;
BEGIN
  RETURN a.media
END PegaMedia;

END Escola3.
