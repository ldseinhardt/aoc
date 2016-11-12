  .text
  .globl main
main:

loop:
  # leitura de escala ($t1 = Escala)
  li   $v0,4
  la   $a0,prompt1
  syscall

  li   $v0,8
  la   $a0,read
  li   $a1,2
  syscall

  lbu  $t1,read

  # verifica se o usuário quer sair
  lbu  $t2,Q
  beq  $t1,$t2,end
  nop

  # leitura da medida ($t2 = Medida)
  li   $v0,4
  la   $a0,prompt2
  syscall

  li   $v0,5
  syscall
  la   $t2,($v0)

  # se Escala = P
  lbu  $t3,P
  bne  $t1,$t3,else
  nop

  li   $v0,4
  la   $a0,prompt3
  syscall

  #C = 28/11*P
  li   $t4,28
  # 28 * P
  mult $t4,$t2
  mflo $t4
  nop
  # C = (28 * P)/11
  li   $t5,11
  div  $t4,$t5
  mflo $a0

  j  endif
  nop

else:
  # SE Escala = C

  li   $v0,4
  la   $a0,prompt4
  syscall

  # P = 11/28*C
  li   $t4,11
  # 11 * C
  mult $t4,$t2
  mflo $t4
  nop
  # (11 * C)/28
  li   $t5,28
  div  $t4,$t5
  mflo $a0

endif:
  # Mostra resposta $a0
  li   $v0,1
  syscall

  j  loop
  nop

end:
  li   $v0,4
  la   $a0,prompt5
  syscall

  li   $v0,10
  syscall

  .data
prompt1:  .asciiz "\nDigite a escala (C ou P): "
prompt2:  .asciiz "\nDigite a medida: "
prompt3:  .asciiz "Medida em cm: "
prompt4:  .asciiz "Medida em pol: "
prompt5:  .asciiz "\nfim"
C:    .ascii "C"
P:    .ascii "P"
Q:    .ascii "Q"
read:  .space 2
