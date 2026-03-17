.globl main
.data             
prompt: .asciiz "Enter time (1-24): "    #ask for time
morningMsg: .asciiz "It is morning.\n"    #morning text
noonMsg: .asciiz "It is noon.\n"         #noon text
afternoonMsg: .asciiz "It is afternoon.\n"   #afternoon text

.text 
main:
    #print question
    la $a0, prompt    
    li $v0, 4        #print string  
    syscall          

    #get input
    li $v0, 5       
    syscall         
    move $t0, $v0   #save number

    #figure out what time it is
    ble $t0, 11, morning   #if 11 or less = morning
    beq $t0, 12, noon      #if 12 = noon
    b afternoon            #else = afternoon

morning:
    la $a0, morningMsg   
    li $v0, 4          
    syscall            
    b exit             

noon:
    la $a0, noonMsg    
    li $v0, 4         
    syscall           
    b exit            

afternoon:
    la $a0, afternoonMsg
    li $v0, 4
    syscall

exit:
    li $v0, 10      #quit program
    syscall