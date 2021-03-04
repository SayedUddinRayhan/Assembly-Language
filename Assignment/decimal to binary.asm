.model small
.stack
.data
	cad  db 9 dup (' '),'$' 
	var1 db ?                 
	num  db ?                 
  	aux  db ?                 

   	msg db 10,13, "Enter decimal number 0-99: $", 10, 13

.code
.startup

  	  mov ah,9
   	  lea dx,msg
   	  int 21h
  mov var1,0 
  mov ah,01h   
  int 21h      
  sub al,30h
  mov num,al

  mov al,num   
  mov bl,10
  mul bl
  mov aux,al

  mov var1,0   
  mov ah,01h
  int 21h      
  sub al,30h   


  	 add aux,al 
	 mov bl,aux
  	 mov num,bl

	mov ah,02h 
	mov dl,'='
   	int 21h

  	mov SI,6
  	L1:          
	xor Ah,Ah    
	mov Al,num
 
mov Bl,2
div Bl
mov var1,Ah
mov num,Al

mov dl,var1
add dl,30h

            mov cad[SI],dl

            cmp num,1 
	dec SI
            jne L1 
	je exit



           cmp num,0 
	jne L1
           je exit

           exit:

           mov dl,num    
	add dl,30h

           mov cad[SI],dl

           mov ah,09h
           lea Dx,cad
           int 21h

           mov ah,4ch
           int 21h
end 
