MODULE c07ex02;

IMPORT Out, In, SYSTEM;

TYPE
  Pessoa = RECORD
    nome: ARRAY 55 OF CHAR;
    idade: INTEGER;
    seguinte: POINTER TO Pessoa
  END;

VAR
  p1, p2, p3: POINTER TO Pessoa;
  atual: POINTER TO Pessoa;
  pausa: CHAR;

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

PROCEDURE PrintPointer(p: POINTER TO Pessoa);
VAR
  endereco: INTEGER;
  textoEnderecoHex: ARRAY 9 OF CHAR;
BEGIN
  endereco := SYSTEM.VAL(INTEGER, p);
  Out.String("0x");
  Hex(endereco, textoEnderecoHex, 8);
  Out.String(textoEnderecoHex); Out.Ln;
END PrintPointer;

BEGIN
  NEW(p1); NEW(p2); NEW(p3);

  p1^.nome := "Ada Lovelace";
  p1^.idade := 36;
  p1^.seguinte := p2;

  p2^.nome := "Grace Hopper";
  p2^.idade := 85;
  p2^.seguinte := p3;

  p3^.nome := "Margaret Hamilton";
  p3^.idade := 38;
  p3^.seguinte := NIL;

  atual := p1;

  WHILE (atual # NIL) DO
    Out.String("Nome ......: ");
    Out.String(atual^.nome); Out.Ln;

    Out.String("Idade .....: ");
    Out.Int(atual^.idade, 0); Out.Ln;

    Out.String("Endereco ..: ");
    PrintPointer(atual); Out.Ln;

    atual := atual^.seguinte;
  END;

  Out.Ln;
  Out.String("Tecle algo para encerrar... ");
  In.Char(pausa)
END c07ex02.
