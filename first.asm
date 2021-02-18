.model small    
.stack 200h
.data
    ;where all the variable will be declared
.code
    ;code segment

        main proc ;int main
            
            ;statement
            
            mov ah , 4ch
            int 21h
        main endp
end main