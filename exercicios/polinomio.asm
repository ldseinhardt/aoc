## Programa que calcula  5x^2 -12x + 97
##
## Registradores:
##
## $10 base, endereço de x
## $11 x
## $12 resultado do polinomio
## $13 temporário

        .text
        .globl  main

main:
        lui   $10,0x1001     #  Base

        lw    $11,0($10)     #  Carrega x
        ori   $12,$0,97      #  Inicializa acumulador
                             #  durante o delay do lw

        ori   $13,$0,12      #  avalia segundo termo

        mult  $11,$13        #  12x
        mflo  $13            #  assume resultado de 32 bits
        subu  $12,$12,$13    #  acumulador = -12x + 97

                             #  avalia terceiro termo
        mult  $11,$11        #  x^2
        mflo  $11            #  assume resultado de 32 bits
        ori   $13,$0,5       #  5
        mult  $11,$13        #  5x^2
        mflo  $13            #
        addu  $12,$12,$13    #  acumulador = 5x^2-12x+97

        sw    $12,4($10)     #  Salva resultado em "polinomio"

        .data
x:           .word   17      #  Digite nessa linha o valor de x
polinomio:   .word   0       #  Resultado colocado aqui.
