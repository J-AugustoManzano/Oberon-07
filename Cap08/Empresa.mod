MODULE Empresa;

IMPORT Out;

TYPE
  FuncionarioPtr* = POINTER TO Funcionario;
  GerentePtr* = POINTER TO Gerente;

  Funcionario* = RECORD
    nome*: ARRAY 64 OF CHAR;
    salario*: REAL;
    calcularSalario*: PROCEDURE (f: FuncionarioPtr)
  END;

  Gerente* = RECORD (Funcionario)
    bonus: REAL
  END;

PROCEDURE CalcularSalarioFuncionario (f: FuncionarioPtr);
BEGIN
  Out.String("Salario de "); Out.String(f^.nome);
  Out.String(": R$ "); Out.Fixed(f^.salario, 0, 2); Out.Ln;
END CalcularSalarioFuncionario;

PROCEDURE CalcularSalarioGerente (f: FuncionarioPtr);
VAR g: GerentePtr;
    salarioTotal: REAL;
BEGIN
  ASSERT(f IS GerentePtr);
  g := f(GerentePtr);
  salarioTotal := g^.salario + g^.bonus;
  Out.String("Salario de "); Out.String(g^.nome);
  Out.String(" (Gerente): R$ ");
  Out.Fixed(salarioTotal, 0, 2); Out.Ln;
END CalcularSalarioGerente;

PROCEDURE InitFuncionario*(f: FuncionarioPtr;
  nome: ARRAY OF CHAR; salario: REAL);
VAR
  i: INTEGER;
BEGIN
  i := 0;
  WHILE (nome[i] # 0X) & (i < LEN(f^.nome) - 1) DO
    f^.nome[i] := nome[i];
    INC(i);
  END;
  f^.nome[i] := 0X;

  f^.salario := salario;
  f^.calcularSalario := CalcularSalarioFuncionario;
END InitFuncionario;

PROCEDURE InitGerente*(g: GerentePtr;
  nome: ARRAY OF CHAR; salario: REAL; bonus: REAL);
BEGIN
  InitFuncionario(g, nome, salario);
  g^.bonus := bonus;
  g^.calcularSalario := CalcularSalarioGerente;
END InitGerente;

END Empresa.
