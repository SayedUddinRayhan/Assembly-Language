include 'emu8086.inc'
.model small 
.stack 100h
.data
.code
main proc
    mov bx,0
    
    mov ah,1
    for1:
    int 21h
    
    cmp al,0dh
    je end_for1
    sub al,30h
    shl bx,1
    or bl,al
    jmp for1
    
    end_for1:
    printn
    printn
    
    mov ah,2
    add bl,30h
    mov dl,bl
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp