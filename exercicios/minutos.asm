# Converte minutos para dias, horas e minutos.

  .text
  .globl  main

main:
    li      $v0,4       # imprime prompt
    la      $a0,prompt  #
    syscall
    li      $v0,5       # le minutos
    syscall

    li      $t1,1440    # 1440 minutos por dia
    div     $v0,$t1     # lo = dias; hi = resto

    mflo    $a0
    li      $v0,1       # imprime no. de
    syscall             # dias

    li      $v0,4       # imprime "dias"
    la      $a0,dias
    syscall

    mfhi    $t0         # resto dos minutos
    li      $t1,60      # minutos por hora
    div     $t0,$t1

    mflo    $a0
    li      $v0,1       # imprime no. de
    syscall             # horas

    li      $v0,4       # imprime
    la      $a0,horas   # "horas"
    syscall

    mfhi    $a0         # resto
    li      $v0,1       # imprime no. de
    syscall             # minutos

    li      $v0,4       # imprime
    la      $a0,minutos # "minutos"
    syscall

    li      $v0,10      # exit
    syscall

  .data
prompt:  .asciiz "Digite o número de minutos: "
dias:    .asciiz " dias, "
horas:   .asciiz " horas e "
minutos: .asciiz " minutos."
