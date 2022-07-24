

;HANGMAN GAME PROJECT -- CAT-3


data segment
 welcome_message db "                                      HANGMAN GAME$"
 lives_msg db "                                         LIVES:$"
 type_message db "                                         Type a letter: $"
 new_line db 13,10,"$"   
 win_message db "                                                YOU WIN!$"
 lose_message db "                                         YOU LOSE...BETTER LUCK NEXT TIME !!!$"
 space db "                                                 $"
 clue db "                                      CLUE:THIS IS A MUSICAL INSTRUMENT...$"
 ;word db "firefox$"
 discovered_word db 5 dup("-"),"$"
 word_size db 5
 lives db 5
 hits db 0
 errors db 0  
 s1 db 1,"piano$"      
 s2 db 2,"flute$"
 s3 db 3,"cello$" 
 s4 db 4,"tabla$"
 s5 db 5,"viola$"
 s6 db 6,"bongo$"  
 s7 db 7,"sitar$"
 s8 db 8,"organ$"
 s9 db 9,"brass$"
 r db 0h
ends

stack segment
 dw 128 dup(?)
ends

extra segment
 
ends

code segment
   
start:
 ;set segment registers                                            
 
 mov ax, data
 mov ds, ax
 mov ax, extra
 mov es, ax
 
wordl:
 
   MOV AH, 00h  
           
   INT 1AH            

   mov  ax, dx
   xor  dx, dx
   mov  cx, 9  
   div  cx       ; here dx contains the remainder of the division - from 0 to 9
   
   add  dl, '1'  ; to ascii from '0' to '9'
   mov r,dl
   mov ah, 2h   ; call interrupt to display a value in DL
   int 21h  
   
   mov bx,00
   lea si,s1
   mov bl,[si] 
   
   sub dl,30h
   cmp bl,dl
   je main_loop
   jmp c2

c2:  
   mov dl,r  
   mov bx,00
   lea si,s2
   mov bl,[si]
   
   sub dl,30h
   cmp bl,dl
   je main_loop
   jmp c3
 
c3:    
   mov dl,r
   mov bx,00
   lea si,s3
   mov bl,[si]
   
   sub dl,30h
   cmp bl,dl
   je main_loop
   jmp c4       
  
c4:    
   mov dl,r
   mov bx,00
   lea si,s4
   mov bl,[si]
   
   sub dl,30h
   cmp bl,dl
   je main_loop
   jmp c5


c5:    
   mov dl,r
   mov bx,00
   lea si,s5
   mov bl,[si]
   
   sub dl,30h
   cmp bl,dl
   je main_loop
   jmp c6
   
  
c6:    
   mov dl,r
   mov bx,00
   lea si,s6
   mov bl,[si]
   
   sub dl,30h
   cmp bl,dl
   je main_loop
   jmp c7 

c7:  
   mov dl,r  
   mov bx,00
   lea si,s7
   mov bl,[si]
   
   sub dl,30h
   cmp bl,dl
   je main_loop
   jmp c8

c8:  
   mov dl,r  
   mov bx,00
   lea si,s8
   mov bl,[si]
   
   sub dl,30h
   cmp bl,dl
   je main_loop
   jmp c9

c9:  
   mov dl,r  
   mov bx,00
   lea si,s9
   mov bl,[si]
   
   sub dl,30h
   cmp bl,dl
   je main_loop
   jmp exit 


   

main_loop:  
 
 lea dx, new_line  
 call print
 lea dx, new_line  
 call print
 lea dx, new_line  
 call print
 lea dx, new_line
 call print
 lea dx, new_line
 call print
 lea dx, new_line
 call print  
 lea dx, new_line
 call print  
 lea dx, new_line
 call print  
 lea dx, new_line  
 call print
 lea dx, new_line  
 call print
 lea dx, new_line  
 call print
 lea dx, new_line  
 call print          
             
 lea dx, welcome_message
 call print
 
 lea dx, new_line
 call print
 
 lea dx, new_line
 call print
 
 lea dx,lives_msg
 call print
 
 mov al,lives
 sub al,errors
 mov bl,100
 mov ah,00
 div bl
 
 mov dl,al
 mov cl,ah
 add dl,30h
 mov ah,02
 int 21h
 
 mov dl,cl
 add dl,30h
 mov ah,02
 int 21h
 
 lea dx,new_line  
 call print
 lea dx,new_line  
 call print
 lea dx,clue
 
 call print
 lea dx,new_line
 call print
 lea dx,new_line  
 call print
 lea dx,new_line  
 call print
 lea dx,space
 call print
 
 lea dx,discovered_word
 call print
 
 lea dx,new_line
 call print  
 lea dx,new_line
 call print
 
 call check                  ;checks the given char is in the word
 
 lea dx,type_message
 call print
 
 call read_keyboard
 call update
 
 call clear_screen
 
 loop main_loop
 
check:  

 mov bl, ds:[lives]
 mov bh, ds:[errors]
 cmp bl, bh
 je game_over
 
 mov bl, ds:[word_size]
 mov bh, ds:[hits]
 cmp bl, bh
 je game_win
 
 ret
 


update:
     
 mov si,00  
 cmp r,'1'
 je load1
 cmp r,'2'
 je load2
 cmp r,'3'
 je load3  
 cmp r,'4'
 je load4 
 cmp r,'5'
 je load5 
 cmp r,'6'
 je load6  
 cmp r,'7'
 je load7
 cmp r,'8'
 je load8
 cmp r,'9'
 je load9 
 
 
     
     
load1:
 
 lea si,s1
 inc si
 lea di,discovered_word
 mov bx,0 
 jmp update_loop
 
load2:

 lea si,s2
 inc si
 lea di,discovered_word
 mov bx,0 
 jmp update_loop
 
load3:
 lea si,s3
 inc si
 lea di,discovered_word
 mov bx,0  
 jmp update_loop  

 
load4:
 lea si,s4
 inc si
 lea di,discovered_word
 mov bx,0  
 jmp update_loop    
 
 
load5:
 lea si,s5
 inc si
 lea di,discovered_word
 mov bx,0  
 jmp update_loop  

 
load6:
 lea si,s6
 inc si
 lea di,discovered_word
 mov bx,0  
 jmp update_loop  

load7:
 lea si,s7
 inc si
 lea di,discovered_word
 mov bx,0  
 jmp update_loop
 
load8:
 lea si,s8
 inc si
 lea di,discovered_word
 mov bx,0  
 jmp update_loop
 
load9:
 lea si,s9
 inc si
 lea di,discovered_word
 mov bx,0  
 jmp update_loop



 
update_loop:
 cmp ds:[si], "$"
 je end_word
 
 cmp ds:[di], al            ;check if letter is already taken
 je increment
 
 cmp ds:[si], al            ; check if letter is on the word
 je equals
 
increment:
 inc si
 inc di  
 jmp update_loop
 
equals:
 mov ds:[di], al   ;if given char is in word
 inc hits
 mov bx, 1
 jmp increment
 
end_word:
 cmp bx, 1
 je end_update
 
 inc errors        ;char not in word increment errors
 mov ah,00h        ; to enlarge the output screen
 mov al,12h
 int 10h  
 
 
end_update:
 ret

game_over:
 lea dx, lose_message
 call print
 jmp exit

game_win:
 lea dx, win_message
 call print
 jmp exit
 
clear_screen: ; get and set video mode
 mov ah, 0fh
 int 10h
 
 
 mov ah, 0
 int 10h         ; if error belongs to respective numbers call the parts of the man
 
 cmp errors,1
 je  head
 cmp errors,2
 je headbody  
 cmp errors,3
 je headbodyhand
 cmp errors,4
 je headleg
 cmp errors,5
 je hangg1
 ret
 
 
read_keyboard: ; read keyborad and return in al
  mov ah, 1
  int 21h
  ret
 
print:
  mov ah, 9
  int 21h
  ret

headbody:
  call head
  call body
  ret
 

headbodyhand:
  call head
  call body
  call hand
  ret  

headleg:
  call head
  call body
  call hand
  call leg
  ret

hangg1:
  call head
  call body
  call hand
  call leg
  call hang
  ret
               

 
exit:
   mov ax, 4c00h ; exit to operating system.
   int 21h
   
 
                 
head:
     
;mov ah,0
;mov al,13h
;int 10h
mov ah,0ch      ; drawing right eye
mov al,30
mov cx,20
mov dx,30
int 10h

                 
mov ah,0ch
mov al,30
mov cx,20
mov dx,31
int 10h  

mov ah,0ch       ; drawing left eye
mov al,30
mov cx,10
mov dx,30
int 10h

                     
mov ah,0ch
mov al,30
mov cx,10
mov dx,30
int 10h

mov ah,0ch
mov al,60  ;set line colour
mov cx,5
mov dx,20
int 10h


mov bx,20

fline:       ;horizontal line
int 10h
inc cx
dec bx
jnz fline

mov bx,20

sline:           ; vertical line
int 10h
inc dx
dec bx
jnz sline

mov bx,20

tline:               ;horizontal line
int 10h
dec cx
dec bx
jnz tline

mov bx,20         ;vertical line

foline:
int 10h
dec dx
dec bx
jnz foline

ret

body:
mov cx,14        ;setting row pixel for body
mov dx,43        ;setting column pixel
mov bx,40

scline:
int 10h
inc dx
dec bx
jnz scline
ret


proc hand
mov cx,4    ; ---->  <-----
mov dx,60   ;|
mov bx,20

hline:
int 10h
inc cx
dec bx
jnz hline

ret

   
leg:

mov cx,0        ;setting row pixel for leg
mov dx,97       ;setting column pixel

lline:

int 10h
inc cx
dec dx
cmp cx,0
cmp dx,83
jnz lline  

mov cx,16           ;setting row pixel
mov dx,83

rline:
int 10h
inc cx
inc dx
cmp cx,16
cmp dx,97
jnz rline
ret



hang:
mov cx,20          ;setting row pixel for hanging
mov dx,6           ;setting column pixel
mov bx,10          ; line size

hangline:
int 10h
inc dx
dec bx
jnz hangline    

mov cx,20          ;setting row pixel
mov dx,6           ;setting column pixel
mov bx,20

hangline1:
int 10h
inc cx
dec bx
jnz hangline1  

mov cx,40               ;setting row pixel
mov dx,7                ;setting column pixel
mov bx,80

hangline2:
int 10h
inc dx
dec bx
jnz hangline2

ret

 
 
code ends

end start