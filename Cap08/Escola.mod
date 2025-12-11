MODULE Escola;

TYPE
  Aluno* = RECORD
    nome: ARRAY 64 OF CHAR; (* Campo-membro 'nome' *)
    media: REAL             (* Campo-membro 'media' *)
  END;

(* --- Getters (Procedimentos para obter valores) --- *)

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

PROCEDURE PegaMedia*(a: Aluno): REAL;
BEGIN
  RETURN a.media
END PegaMedia;

(* --- Setters (Procedimentos para definir valores) --- *)

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

PROCEDURE PoeMedia*(VAR a: Aluno; novaMedia: REAL);
BEGIN
  a.media := novaMedia
END PoeMedia;

END Escola.
