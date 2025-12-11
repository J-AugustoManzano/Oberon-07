MODULE c02ex04;

IMPORT Out, In, Math;

VAR
  pi1, pi2 : REAL;
  pausa: CHAR;

BEGIN
  pi1 := 3.141592653589793;
  pi2 := 4.0 * Math.Arctan2(1.0, 1.0);

  Out.String("Valor pi1 ");
  Out.Fixed(pi1, 0, 10);
  Out.Ln();
  Out.String("Valor pi2 ");
  Out.Fixed(pi2, 0, 10);
  Out.Ln();

  Out.Ln();
  Out.String("Tecle <Enter> para finalizar... ");
  In.Char(pausa)
END c02ex04.
