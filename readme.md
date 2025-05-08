## Sobre o projeto

O presente trabalho consistiu no desenvolvimento de um processador MIPS monociclo para executar operações simples.

As operações são:

  - Salvar na memória (SW);
  - Carregar da memória (LW);
  - Soma entre registradores e salvar em algum registrador (ADD);
  - Subtração entre registradores e salvar em algum registrador (SUB);
  - Pular para alguma instrução caso dois registradores sejam iguais (BEQ);

Uma instrução foi adicionada para permitir os testes das instruções anteriores:
  - Salvar o valor do imediato no registrador
  - OPCODE 0b100000 (out 0b010100000)
  - RegDst         0 -> write register recebe o valor de instruction[20:16]
  - ALUSrc         1 -> Entrada B da ULA recebe o valor do imediato
  - MemtoReg       0 -> Entrada WriteData recebe o resultado da ULA
  - RegWrite       1 -> Permite a escrita nos registradores
  - MemRead        0 -> desabilita a leitura da memória de dados
  - MemWrite       0 -> desabilita a escrita da memória de dados
  - Branch         0 -> desabilita o branch
  - ALUOp[1:0] 2'b00 -> ULA realiza adição

## Algoritmo utilizado para teste

Um algoritmo simples foi desenvolvido para testar as instruções citadas anteriormente. Abaixo podemos verificar as instruções:

- 0x80010028 - Salva o valor 0x28 (40) no registrador 1
  - OPCODE 0b100000;
  - ReadRegister 1 0b00000;
  - WriteRegister 0b00001;
  - Imediato 0d40

- 0x80020014 - Salva o valor 0x14 (20) no registrador 2  
  - OPCODE 0b100000;
  - ReadRegister 1 0b00000;
  - WriteRegister 0b00002;
  - Imediato 0d20

- 0x80030003 - Salva o valor 0x03 (03) no registrador 3
  - OPCODE 0b100000;
  - ReadRegister 1 0b00000;
  - WriteRegister 0b00003;
  - Imediato 0d3

- 0xAC020002 - SW - Salva o valor do registrador 2 no endereço 2 da memória de dados
  - OPCODE 0b101011;
  - ReadRegister 1 0b00000;
  - ReadRegister 2 0b00002;
  - Imediato 0d2

- 0x8C140002 - LW - Salva o valor do endereço 2 da memória de dados no registrador 0x14 (20)
  - OPCODE 0b101011;
  - ReadRegister 1 0b00000;
  - WriteRegister 0b10100;
  - Imediato 0d2

- 0x0022D020 - ADD - Soma os valores nos registradores 1 e 2 e salva no registrador 26
  - OPCODE 0b000000;
  - ReadRegister 1 0b00001;
  - ReadRegister2 0b00010;
  - WriteRegister 0b11010;
  - Funct 0b100000

- 0x0023B022 - SUB - Subtrai os valores nos registradores 1 e 3 e salva no registrador 22
  - OPCODE 0b000000;
  - ReadRegister 1 0b00001;
  - ReadRegister2 0b00011;
  - WriteRegister 0b10110;
  - Funct 0b100010

- 0x0356B020 // ADD - soma os valores nos registradores 26 e 22 e salva no registrador 22
  - OPCODE 0b000000;
  - ReadRegister 1 0b11010;
  - ReadRegister2 0b10110;
  - WriteRegister 0b10110;
  - Funct 0b100000

- 0x1282FFFD // BEQ - volta três instruções (contando com essa), caso RegData A e B sejam iguais
  - OPCODE 0b000100;
  - ReadRegister 1 0b10100;
  - ReadRegister2 0b00010;
  - Imediato 0xFFFD (-3)

### Código Python

Para auxiliar no processo de rodar os algoritmos de teste do processador,foi desenvolvido um código em python. Este código executa uma conversão das instruções escritas em um arquivo em formato "txt" contendo as instruções em haxadecimal para um arquivo em formato SystemVerilog ("sv").

Este arquivo em formato sv ("instructions.sv") contém uma variável interna que é recebida pela memória de instruções. Com isso, para executar um código novo, apenas devemos alterar o arquivo "programdata.txt".

Foi criado um código em bash para executar o python e rodar o tb, bastando executar o comando "./run" no terminal.
