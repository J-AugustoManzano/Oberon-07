MODULE Pessoas;

IMPORT Out, SYSTEM;

TYPE
  Pessoa* = POINTER TO PessoaDesc;
  PessoaDesc = RECORD
    nome: ARRAY 55 OF CHAR;
    idade: INTEGER;
    seguinte: Pessoa
  END;

VAR
  inicio: Pessoa;

PROCEDURE Hex
  (nr: INTEGER; VAR txtHex: ARRAY OF CHAR; larg: INTEGER);
VAR
  i, digito: INTEGER;
  tmpCarac: ARRAY 9 OF CHAR;
  pos: INTEGER;
  numDigitos: INTEGER;
BEGIN
  FOR pos := 0 TO LEN(tmpCarac) - 1 DO
    tmpCarac[pos] := 0X
  END;

  pos := LEN(tmpCarac) - 2;
  numDigitos := 0;

  IF (nr = 0) THEN
    tmpCarac[pos] := '0'; DEC(pos); INC(numDigitos);
  ELSE
    WHILE (nr > 0) DO
      digito := nr MOD 16;
      IF (digito < 10) THEN
        tmpCarac[pos] := CHR(ORD('0') + digito);
      ELSE
        tmpCarac[pos] := CHR(ORD('A') + digito - 10);
      END;
      nr := nr DIV 16;
      DEC(pos);
      INC(numDigitos);
    END;
  END;

  i := 0;

  WHILE (numDigitos < larg) & (i < LEN(txtHex) - 1) DO
    txtHex[i] := '0'; INC(i);
    INC(numDigitos);
  END;

  INC(pos);
  WHILE (pos < LEN(tmpCarac) - 1) &
    (tmpCarac[pos] # 0X) & (i < LEN(txtHex) - 1) DO
    txtHex[i] := tmpCarac[pos];
    INC(i);
    INC(pos);
  END;
  txtHex[i] := 0X;
END Hex;

(*
  Compara duas strings: retorna negativo se
  a < b, 0 se igual, positivo se a > b
*)
PROCEDURE CompareStrings(a, b: ARRAY OF CHAR): INTEGER;
VAR i: INTEGER;
BEGIN
  i := 0;
  WHILE (a[i] = b[i]) & (a[i] # 0X) DO
    INC(i)
  END;
  RETURN ORD(a[i]) - ORD(b[i])
END CompareStrings;

PROCEDURE Novo*(nome: ARRAY OF CHAR; idade: INTEGER);
VAR
  nova, atual, anterior: Pessoa;
BEGIN
  NEW(nova);
  nova^.nome := nome;
  nova^.idade := idade;
  nova^.seguinte := NIL;

  IF (inicio = NIL) OR (CompareStrings(nome, inicio^.nome) < 0) THEN
    nova^.seguinte := inicio;
    inicio := nova
  ELSE
    anterior := inicio;
    atual := inicio^.seguinte;

    WHILE (atual # NIL) & (CompareStrings(nome, atual^.nome) > 0) DO
      anterior := atual;
      atual := atual^.seguinte
    END;

    nova^.seguinte := atual;
    anterior^.seguinte := nova
  END
END Novo;

PROCEDURE Exibir*;
VAR
  atual: Pessoa;
  endereco: INTEGER;
  txtHex: ARRAY 9 OF CHAR;
BEGIN
  atual := inicio;
  WHILE (atual # NIL) DO
    Out.String("Nome .......: ");
    Out.String(atual^.nome); Out.Ln;

    Out.String("Idade ......: ");
    Out.Int(atual^.idade, 0); Out.Ln;

    endereco := SYSTEM.VAL(INTEGER, atual);
    Out.String("Endereco ...: 0x");
    Hex(endereco, txtHex, 8); 
    Out.String(txtHex); Out.Ln; 
    Out.Ln;

    atual := atual^.seguinte
  END
END Exibir;

END Pessoas.
