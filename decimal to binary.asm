;8086 program to convert a 16 bit decimal number to binary 
    .MODEL SMALL 
    .STACK 100H 
    .DATA 
        d1 dw 16 
    .CODE 
        MAIN PROC FAR 
            MOV AX, 
    @DATA 
        MOV DS, 
    AX 
  
;load the value stored; 
in variable d1 
    mov ax, 
    d1 
  
;convert the value to binary; 
print the value 
    CALL PRINT 
  
;interrupt to exit
    MOV AH, 
    4CH INT 21H 
  
    MAIN ENDP 
        PRINT PROC 
  
;initilize count 
    mov cx, 
    0 mov dx, 0 label1:; 
if
    ax is zero 
        cmp ax, 
        0 je print1 
  
;initilize bx to 2 mov bx, 2 
  
;devide it by 2 
;to convert it to binary 
    div bx 
  
;push it in the stack 
    push dx 
  
;increment the count 
    inc cx 
  
;set dx to 0 
    xor dx, 
    dx 
        jmp label1 
            print1: 
  
;check if count 
;is greater than zero 
    cmp cx, 
    0 je exit
  
;pop the top of stack 
    pop dx 
  
;add 48 so that it 
;represents the ASCII 
;value of digits 
    add dx, 
    48 
  
;interrupt to print a 
;character 
    mov ah, 
    02h int 21h 
  
;decrease the count 
    dec cx 
        jmp print1 
            exit : ret 
                       PRINT ENDP 
                           END MAIN 