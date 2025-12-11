MODULE c02ex07;

IMPORT In, Out, S := SYSTEM;

VAR
  valor: BYTE;
  tempInt: INTEGER; 
  pausa: CHAR;

BEGIN
  Out.String("Entre um valor numerico: ");
  In.Int(tempInt);

  valor := S.VAL(BYTE, tempInt); 

  Out.String("Valor informado --> "); 
  Out.Int(S.VAL(INTEGER, valor), 0); Out.Ln;
  
  Out.Ln();
  Out.String("Tecle <Enter> para encerrar... ");
  In.Char(pausa)
END c02ex07.
