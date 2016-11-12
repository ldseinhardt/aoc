## Soma todos os inteiros, os inteiros positivos,
## e os inteiros negativos de um vetor.

## Registradores:
##  $8 -- cont
##  $9 -- ponteiro
## $10 -- valor atual
## $11 -- soma
## $12 -- soma dos negativos
## $13 -- soma dos positivos
## $14 -- flag pos/neg
## $15 -- tamanho do vetor

         .text
         .globl  main
# Inicilizações
main:    ori      $8,$0,0        #  cont = 0
         ori      $11,$0,0       #  soma = 0
         ori      $12,$0,0       #  neg = 0
         ori      $13,$0,0       #  pos = 0
         lui      $9,0x1001      #  aponta para TAMANHO

         lw       $15,0($9)      #  carrega TAMANHO
         addiu    $9,$9,4        #  aponta para primeira entrada

# enquanto  count < TAMANHO faça
loop:    beq      $8,$15,fim     #  cont == TAMANHO?
         sll      $0,$0,0        #  branch delay

# carrega entrada e adiciona à soma ($11)
         lw       $10,0($9)      #  carrega entrada
         sll      $0,$0,0        #  delay
         add      $11,$11,$10    #  soma

#  testa se neg. ou pos.
         slti     $14,$10,0x0    #  set $14 se neg
         bne      $14,$0,neg     #  branch se negativo
         sll      $0,$0,0        #  branch delay
         add      $13,$13,$10    #  positivo: soma a pos
         j        fimse
         sll      $0,$0,0        #  delay

neg:     add      $12,$12,$10    #  negativo: soma a neg

fimse:   addi     $8,$8,1        # cont++
         addi     $9,$9,4        # ponteiro++ (alinhado)
         j        loop
         sll      $0,$0,0        #  delay

# fim
fim:     sll      $0,$0,0

        .data
size:   .word  4
array:  .word  1, 2, -2, -1
