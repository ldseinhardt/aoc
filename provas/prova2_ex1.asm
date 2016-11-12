  .text
  .globl main
main:
  lui    $10,0x1001  # base
  addi   $10,$10,-1  # base -1
  ori    $1,$0,0x20  # letra anterior
  ori    $3,$0,0     # letra corrente
  ori    $2,$0,0x20  # espaço / diferença

loop:
  bne    $1,$2,n
  nop
  # altera_letra
  lbu    $3,0x1($10)
  nop

  beq    $3,$2,n
  nop

  sub    $3,$3,$2

  sb     $3,0x1($10)
  # fim altera_letra
n:
  addi   $10,$10,1
  lbu    $1,0($10)

  bne    $1,$0,loop
  nop

  # para fins de visualização com pseudo instructions
  # li  $v0,4
  # la  $a0,string
  # syscall

  .data
string: .asciiz "arquitetura e organizacao de computadores i"
