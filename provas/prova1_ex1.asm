# $1 = valor a ser sacado
# $2 = notas de 10
# $3 = notas de 20
# $4 = notas de 50
# $5 = notas de 100
# $9 = rascunho (valores temporários)
# $10 = base

  .text
  .globl main
main:
  lui $10,0x1001  # carrega base
  lw  $1,0($10)   # carrega em $1 o valor a ser sacado

  # inicializa variaves notas
  ori  $2,$0,0
  ori  $3,$0,0
  ori  $4,$0,0
  ori  $5,$0,0

  # verifica se o valor é divisivel por 10
  ori  $9,$0,10
  div  $1,$9
  mfhi $9
  sll  $0,$0,0    # noop
  bne  $9,$0,fim  # finaliza o programa se valor não for divisivel por 10
  sll  $0,$0,0    # noop

# valor > 100
loop100:
  slti $9,$1,100
  bne  $9,$0,loop50
  sll  $0,$0,0    # noop
  ori  $9,$0,100
  sub  $1,$1,$9   # valor -= 100
  addi $5,$5,1    # nota100++
  j  loop100
  sll  $0,$0,0    # noop

# valor > 50
loop50:
  slti $9,$1,50
  bne  $9,$0,loop20
  sll  $0,$0,0    # noop
  ori  $9,$0,50
  sub  $1,$1,$9   # valor -= 50
  addi $4,$4,1    # nota50++
  j  loop50
  sll  $0,$0,0    # noop

# valor > 20
loop20:
  slti $9,$1,20
  bne  $9,$0,loop10
  sll  $0,$0,0    # noop
  ori  $9,$0,20
  sub  $1,$1,$9   # valor -= 20
  addi $3,$3,1    # nota20++
  j  loop20
  sll  $0,$0,0    # noop

# valor > 10
loop10:
  slti $9,$1,10
  bne  $9,$0,fim
  sll  $0,$0,0    # noop
  ori  $9,$0,10
  sub  $1,$1,$9   # valor -= 10
  addi $2,$2,1    # nota10++
  j  loop10
  sll  $0,$0,0    # noop

# salva na mémoria o número de notas
fim:
  sh  $2,4($10)
  sh  $3,6($10)
  sh  $4,8($10)
  sh  $5,10($10)

  .data
valor:  .word 190
n10:    .half 0
n20:    .half 0
n50:    .half 0
n100:   .half 0
