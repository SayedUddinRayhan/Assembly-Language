.model small
.stack 100h
.data 

main_menu db ,0dh,0ah,"Calculator",0dh,0ah
 
     
    db "[[[########<<<<>>>>########]]]",0dh,0ah 
    db "Press 'a' for Addition",0dh,0ah
    db "Press 's' for Subtraction",0dh,0ah
    db "Press 'm' for Multiplication",0dh,0ah
    db "Press 'd' for Division",0dh,0ah
    db "Press 'e' for Exit",0dh,0ah 
    db "Press 'r' for Return main menu",0dh,0ah
    db "[[[########<<<<>>>>########]]]",0dh,0ah 
    db "Enter your choice: ",0dh,0ah,'$' 
    
    
    num1 db "Enter First Number: ",0dh,0ah,'$'
    num2 db ,0dh,0ah,"Enter Second Number",0dh,0ah,'$'
     
     
    add1 db ,0dh,0ah,"****<<<<ADDITION>>>>****",0dh,0ah,'$'
    sub1 db ,0dh,0ah,"****<<<<SUBTRACTION>>>>****",0dh,0ah,'$'
    mul1 db ,0dh,0ah,"****<<<<MUlTIPLICATION>>>>****",0dh,0ah,'$'
    div1 db ,0dh,0ah,"****<<<<DIVISION>>>>****",0dh,0ah,'$'
    ex db ,0dh,0ah,"Good Luck!!",0dh,0ah,'$'
    ans db ,0dh,0ah,"Answer: ",0dh,0ah,'$'
    continue db ,0dh,0ah,"Do you want to continue(y/n): ",0dh,0ah,'$'
    
    op1 db ?
    op2 db ? 
    Operand db ? 
    con db ?
    
.code
.startup
start:

    mov ah,09h
    mov dx,offset main_menu
    int 21h
    
    mov ah,01h
    int 21h
    
    mov operand,al
    mov al,operand
    cmp al,'a'
    je add
    cmp al,'s'
    je sub
    cmp al,'m'
    je mul
    cmp al,'d'
    je div
    cmp al,'r'
    je start
    cmp al,'e'
    je exit


    add:
        mov ah,09h
        mov dx,offset add1
        int 21h
        
        mov ah,09h
        mov dx,offset num1
        int 21h
        
        mov ah,01h
        int 21h
        mov op1,al
        
        mov ah,09h
        mov dx,offset num2
        int 21h
        
        mov ah,01h
        int 21h
        mov op2,al
        
        mov ah,09h
        mov dx,offset ans
        int 21h
        
        mov al,op1
        mov bl,op2
        add al,bl
        
        aas
        or ax,3030h
        mov ah,0eh
        int 10h
         
        mov ah,09h
        mov dx,offset continue
        int 21h
        
        mov ah,01h
        int 21h
        
        mov con,al
        mov al,con
        cmp al,'y'
        je start
        cmp al,'n'
        je exit
  
  
    sub:
        mov ah,09h
        mov dx,offset sub1
        int 21h
        
        mov ah,09h
        mov dx,offset num1
        int 21h
        
        mov ah,01h
        int 21h
        mov op1,al
        
        mov ah,09h
        mov dx,offset num2
        int 21h 
        
        mov ah,01h
        int 21h
        mov op2,al 
        
        mov ah,09h
        mov dx,offset ans
        int 21h  
        
        mov al, op1
        mov bl,op2
        sub al,bl 
        
        aas
        or ax,3030h
        mov ah,0eh
        int 10h
        
        mov ah,09h
        mov dx,offset continue
        int 21h 
    
        mov ah,01h
        int 21h
        mov con,al
        mov al,con
        cmp al,'y'
        je start
        cmp al,'n'
        je exit
  
  
    mul:
        mov ah,09h 
        mov dx,offset mul1
        int 21h 
        
        mov ah,09h
        mov dx,offset num1
        int 21h
        
        mov ah,01h
        int 21h
        sub al,30h
        mov op1,al
        
        mov ah,09h
        mov dx,offset num2
        int 21h
        
        mov ah,01h
        int 21h 
        sub al,30h
        mov op2,al
        
        mov ah,09h
        mov dx,offset ans
        int 21h
        
        mov al, op1
        mov bl,op2
        mul bl
        add al,30h
        
        mov ah,0eh
        int 10h
        
        mov ah,09h
        mov dx,offset continue
        int 21h 
    
        mov ah,01h
        int 21h
        mov con,al
        mov al,con
        cmp al,'y'
        je start
        cmp al,'n'
        je exit 


    div:
        mov ah,09h 
        mov dx,offset div1
        int 21h 
    
        mov ah,09h
        mov dx,offset num1
        int 21h
    
        mov ah,01h
        int 21h
        sub al,30h
        mov op1,al
    
        mov ah,09h
        mov dx,offset num2
        int 21h
     
        mov ah,01h
        int 21h
        sub al,30h
        mov op2,al
    
        mov ah,09h
        mov dx,offset ans
        int 21h   
    
        mov ax,0000h
        mov al, op1
        mov bl,op2
        div bl
        add al,30h 
        
        mov ah,0eh
        int 10h
        
        mov ah,09h
        mov dx,offset continue
        int 21h  
        
        mov ah,01h
        int 21h
        mov con,al
        mov al,con
        cmp al,'y'
        je start
        cmp al,'n'
        je exit 
 
 
    exit:
        mov ah,09h
        mov dx,offset ex
        int 21h
.exit
end
