# $1 = instrução
# $2 = opcode
# $3 = rs
# $4 = rd
# $5 = imediato
# $10 = base
  .text
  .globl main

main:
  lui $10,0x1001  # carrega base
  lw  $1,0($10)   # carrega em $1 a instrução de 32 bits

  # opcode, $2 = $1
  or  $2,$0,$1
  srl $2,$2,26

  # rs, $3 = $1
  or  $3,$0,$1
  sll $3,$3,6
  srl $3,$3,27

  # rd, $4 = $1
  or  $4,$0,$1
  sll $4,$4,11
  srl $4,$4,27

  # imediato, $5 = $1
  or  $5,$0,$1
  sll $5,$5,16
  srl $5,$5,16

  .data
inst:  .word 0x2194ABCD
