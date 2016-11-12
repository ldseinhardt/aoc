# Lê três inteiros e imprime a soma.
#
# Settings: Load delays  ON;  Branch delays ON
#           Exception file ON;  Pseudoinstructions ON
#

         .text
         .globl  main
main:
         jal     pread            # lê inteiro
         nop                      #
         move    $s0,$v0          # salva em $s0

         jal     pread            # lê inteiro
         nop                      #
         move    $s1,$v0          # salva em $s1

         jal     pread            # lê inteiro
         nop                      #
         move    $s2,$v0          # salva em $s2

         add     $s0,$s0,$s1      # computa soma
         add     $a0,$s0,$s2      # e coloca em $a0 para impressão

         li      $v0,1            # imprime a soma
         syscall

         li      $v0,10           # exit
         syscall


# subrotina pread -- lê um inteiro
#
# na entrada:
#    $ra -- endereço de retorno
#
# na saída:
#    $v0 -- inteiro lido

pread:
         la    $a0,prompt        # imprime string
         li    $v0,4             # código 4
         syscall

         li    $v0,5             # lê inteiro (retorno em $v0)
         syscall                 # código 5

         jr    $ra               # retorna
         nop                     #

         .data
prompt:  .asciiz "Digite um inteiro: "
