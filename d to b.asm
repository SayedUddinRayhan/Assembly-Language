.model small
.stack
.data
                             ;Variables used:

   cad  db 9 dup (' '),'$'   ;Cad will contain the chain of bits
   var1 db ?                 ;Var1 will be used to conver number
   num  db ?                 ;variable for input number
   aux  db ?                 ;auxiliary  variable

   msg db 10,13, "Enter decimal number 0-99: $", 10, 13

.code
.startup

   mov ah,9
   lea dx,msg
   int 21h      ;Shows first message

   mov var1,0   ;Initializes var1 value to 0
   mov ah,01h   ;Int to obtain input
   int 21h      
   sub al,30h   ; Ascii code value to real decimal value conversion (subtracts 48d)
   mov num,al   ;Input number from AL is moved to variable num

   mov al,num   
   mov bl,10    ;10 is stored in bl
   mul bl       ;Number to convert is multiplied by 10
   mov aux,al   ;aux variable is assigned the result

   mov var1,0   ;We obtain the second user number input
   mov ah,01h
   int 21h      
   sub al,30h   


   add aux,al   ;We add aux to the previous number multiplied by 10
   mov bl,aux   ;Doesn't need to be multiplied
   mov num,bl   ;result is stored in BL

   mov ah,02h   ;Prints '=' sign symbol after decimal input 
   mov dl,'='
   int 21h

   mov SI,6     ;Cycles where we use long division (Divide by 2)
   L1:          ;L1  label

      xor Ah,Ah    ;Resets AH 
      mov Al,num
      mov Bl,2
      div Bl
      mov var1,Ah
      mov num,Al

      mov dl,var1
      add dl,30h

      mov cad[SI],dl;Concatenates results

      cmp num,1 ;Compares num with 1
      dec SI
      jne L1   ;L1 loops until it goes through the all numbers
       je exit   ;exits loop



      cmp num,0 ;Compares num with 0
       jne L1
        je exit

   exit:          ;exit label

      mov dl,num    ;prints the chain in binary
      add dl,30h

      mov cad[SI],dl

      mov ah,09h
      lea Dx,cad
      int 21h

      mov ah,4ch
      int 21h
end  