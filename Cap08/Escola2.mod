MODULE Escola2;

TYPE
  (* 1. Classe Base: Sala *)

  Sala* = RECORD
    numeroSala: INTEGER
  END;

  (* 2. Classe Aluno herdando de Sala *)

  Aluno* = RECORD (Sala) (* Aluno agora herda de Sala *)
    nome: ARRAY 64 OF CHAR;
    media: REAL
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

PROCEDURE PegaNome*(a: Aluno; VAR nomeRet: ARRAY OF CHAR);
VAR
  i: INTEGER;
BEGIN
  i := 0;
  WHILE (a.nome[i] # 0X) & (i < LEN(nomeRet) - 1) DO
    nomeRet[i] := a.nome[i];
    INC(i);
  END;
  nomeRet[i] := 0X;
END PegaNome;

PROCEDURE PoeMedia*(VAR a: Aluno; novaMedia: REAL);
BEGIN
  a.media := novaMedia
END PoeMedia;

PROCEDURE PegaMedia*(a: Aluno): REAL;
BEGIN
  RETURN a.media
END PegaMedia;

END Escola2.
