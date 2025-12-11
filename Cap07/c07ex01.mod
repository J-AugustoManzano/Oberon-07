MODULE c07ex01;

IMPORT In, Out, SYSTEM;

TYPE
  TipoPessoa = RECORD
    nome: ARRAY 55 OF CHAR;
    idade: INTEGER
  END;

VAR
  pessoa: POINTER TO TipoPessoa;
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

PROCEDURE ExibePonteiro(ponteiro: POINTER TO TipoPessoa);
VAR
  endMemoria: INTEGER;
  textoEnderecoHex: ARRAY 9 OF CHAR;
BEGIN
  endMemoria := SYSTEM.VAL(INTEGER, ponteiro);
  Out.String("0x");
  Hex(endMemoria, textoEnderecoHex, 8);
  Out.String(textoEnderecoHex);
  Out.Ln;
END ExibePonteiro;

BEGIN
  NEW(pessoa);

  pessoa^.nome := "Ada Lovelace";
  pessoa^.idade := 36;

  Out.String("Nome ..................: ");
  Out.String(pessoa^.nome); Out.Ln;
  Out.String("Idade .................: ");
  Out.Int(pessoa^.idade, 0); Out.Ln;

  Out.Ln;
  Out.String("Endereco do registro ..: ");
  ExibePonteiro(pessoa);

  Out.Ln;
  Out.String("Tecle algo para encerrar... ");
  In.Char(pausa)
END c07ex01.
