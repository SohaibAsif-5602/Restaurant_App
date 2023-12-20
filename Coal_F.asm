.model small
.stack 100h     ;Stack

print macro m   ;Display Macro
 lea dx, m
 mov ah, 09
 int 21h
endm

add1 macro filenam , counter1

mov dx,offset filenam
mov al,2
mov ah,3dh
int 21h 
mov handle,ax

;read
MOV bx,handle 
MOV CX, lengthof buffer
mov dx,offset buffer
mov ah,3fh
int 21h
 ;add string
xor cx,cx
mov si,offset buffer
.while cx!=counter1
inc si
inc cx
.endw
print newdish
push cx
mov cx,13
mov [si],cx
inc si
mov cx,10
mov [si],cx
inc si
pop cx
inc counter1
.while al!=13
mov ah,01h
int 21h
mov [si],al
inc si
inc counter1
.endw
mov ah,3eh
mov bx,handle
int 21h
write_file filenam,counter1
	;WRITE IN FILE
	;	mov cx, counter       ; Number of bytes to write
     ;   mov bx, handle
	;	lea dx, buffer                ; Load offset of string which is to be written to file
	;	mov ah, 40h                 ; Write to file
	;	int 21h
;;;;;;;;;;;;;;;
;print
mov si,offset buffer
xor cx,cx
.while cx!=counter1
mov dx,[si]
mov ah,02h
int 21H
inc si
inc cx
mov ah,3eh
mov bx,handle
int 21h
.endw
endm

write_file macro m69 , counterr

lea dx, m69                 ; Load address of String “file”
mov al, 2                   ; Open file (read/write)
mov ah, 3dh                 ; Load File Handler and store in ax
int 21h
mov cx, counterr            ; Number of bytes to write
mov bx, ax                  ; Move file Handler to bx
lea dx, buffer              ; Load offset of string which is to be written to file
mov ah, 40h                 ; Write to file
int 21h
mov ah,3eh
mov bx,handle
int 21h

endm

print2 macro M9 , counter  ;Display Menus Using File Handling

mov dx,offset M9
mov al,2
mov ah,3dh
int 21h 
mov handle,ax

;read
MOV bx,handle 
MOV CX, lengthof buffer
mov dx,offset buffer
mov ah,3fh
INT 21h
;print
mov si,offset buffer
;counter
xor cx,cx
.while cx!=counter
mov dx,[si]
mov ah,02h
int 21H
inc si
inc cx
.endw
;close
mov ah,3eh
mov bx,handle
int 21h
endm


.DATA
count db 0
Row_poistion db 0
Column_poistion db 0
WELCOME DB 10,13,'Welcome To Desi Dhaba $',10,13 
M2 DB 10,13,10,13,'Das ki khana hi masera: $'
M3 DB 10,13,' 1.Nashta ' ,;m3
      10,13,' 2.Dupehr da khana ',;m4
      10,13,' 3.Raat da khana ',;m5
      10,13,' 4.Botal $' ;m7
names db 10,13,'COAL Project by: ',10,13,'Huzaifa Azhar',10,13,'Abdul Ahad',10,13,'Sohaib Asif',10,13,'$'
menu_main db 10,13,'Press 1 to Add an Item',
             10,13,'Press 2 to Update Menu',
             10,13,'Press 3 to Delete Item',
             10,13,'Press 4 to Search',
             10,13,'Enter Your Choice: $'
newdish db 10,13,'Enter new Entry: $'
additem db 10,13,'Press 1 to Add to breakfast',
             10,13,'Press 2 to add to lunch',
             10,13,'Press 3 to add dinner',
             10,13,'Press 4 to add drinks',
             10,13,'Enter Your Choice: $'
search_true db 10,13,'Dish found in the file',10,13,'$'
search_false db 10,13,'Dish not found in the file$'
update_choice db 10,13,'Enter Index of Dish to Update: $'
delete_choice db 10,13,'Enter Index of Dish to Delete: $'
search_choice db 10,13,'Enter Index of Dish to Search: $'
main_choice db 10,13,'Press 1 to Open Management',
               10,13,'Press 2 to Start Program',
               10,13,'Enter Your Choice: $'
string DB 10,13,'3-Aur Khana hai? $' 
M8 DB 10,13,10,13,'Menu:  $'
M60 DB 10,13,10,13,'1.Go Back To Main Menu$'
M61 DB 10,13,'2.Rab Rakha$'
M57 DB 10,13,10,13,'Kia Khana Hai: $'
M58 DB 10,13,'Enter Quantity: $'
M59 DB 10,13,'Total Price: $'
endl DB 10,13,10,13,'$'
M55 DB 10,13,10,13,' invalid option selected $'
M56 DB 10,13,' Try Again $'
dinner_file DB "dinner.txt",0
drink_file DB "drinks.txt",0
nashta_file db "nashta.txt",0
lunch_file db "lunch.txt",0
edit_file db "edit.txt",0
index db ?
handle dw ?
buffer db 500 dup (?)

DRINK DB ?
QUANTITY DB ?
price db ?

nashtacounter dw 158
lunchcounter dw 230
dinnercounter dw 218
drinkcounter dw 103
editcounter dw 48

.CODE
main_menu proc

	mov ax, 0600h
	mov cx, 0000h
	mov dx, 2550h
	mov bh, 0F1h
	mov al, 0
	int 10h

;-------left side----------

mov Row_poistion, 7
mov Column_poistion,25


left:
	inc count
	MOV AH,2                ;SET CURSOR POSITION                 
	MOV DH,Row_poistion     ;SET ROW 
	MOV DL,Column_poistion  ;SET COLUMN
	INT 10H                 ;CALLING BIOS

	mov ah,09h
	mov al,'#'
	mov bh,0
	mov bl,02
	mov cx,1
	int 10h
	add Row_poistion,1
	
	cmp	count,10
	jbe left

;-------right side----------

mov Row_poistion, 7
mov Column_poistion, 53

mov count,0
right:
	inc count
	MOV AH,2                ;SET CURSOR POSITION                 
	MOV DH,Row_poistion     ;SET ROW 
	MOV DL,Column_poistion  ;SET COLUMN
	INT 10H                 ;CALLING BIOS

	mov ah,09h
	mov al,'#'
	mov bh,0
	mov bl,02
	mov cx,1
	int 10h
	add Row_poistion,1
	
	cmp	count,10
	jbe right

	add Row_poistion,1


;-------top side-----------

mov Row_poistion, 7
mov Column_poistion, 25

mov count,0
topp:
inc count
	MOV AH,2                ;SET CURSOR POSITION                 
	MOV DH,Row_poistion     ;SET ROW 
	MOV DL,Column_poistion  ;SET COLUMN
	INT 10H                 ;CALLING BIOS
	
	
	
	mov ah,09h
	mov al,'#'
	mov bh,0
	mov bl,02
	mov cx, 2
	int 10h
	add Column_poistion,1
	
	cmp	count,27
	jbe topp

;-------bottom side----------

mov Row_poistion, 17
mov Column_poistion, 25

mov count,0

bottom:
	inc count
	MOV AH,2                ;SET CURSOR POSITION                 
	MOV DH,Row_poistion     ;SET ROW 
	MOV DL,Column_poistion  ;SET COLUMN
	INT 10H                 ;CALLING BIOS

	mov ah,09h
	mov al,'#'
	mov bh,0
	mov bl,02
	mov cx,1
	int 10h
	add Column_poistion,1
	
	cmp	count,28
	jbe bottom
	
	

	
	
mov Row_poistion, 12
mov Column_poistion,36
mov count,0

	
	MOV AH,2                ;SET CURSOR POSITION                 
	MOV DH,Row_poistion   ;SET ROW 
	inc Column_poistion
	MOV DL,Column_poistion  ;SET COLUMN
	INT 10H                 ;CALLING BIOS

	mov ah,09h
	mov al, 'D'
	mov bh,0
	mov bl,05
	mov cx,1
	int 10h
	
	MOV AH,2                ;SET CURSOR POSITION                 
	MOV DH,Row_poistion   	;SET ROW 
	inc Column_poistion
	MOV DL,Column_poistion  ;SET COLUMN
	INT 10H                 ;CALLING BIOS

	mov ah,09h
	mov al,'E'
	mov bh,0
	mov bl,05
	mov cx,1
	int 10h
	
	MOV AH,2                ;SET CURSOR POSITION                 
	MOV DH,Row_poistion  	 ;SET ROW 
	inc Column_poistion
	MOV DL,Column_poistion  ;SET COLUMN
	INT 10H  	;CALLING BIOS
	
	mov ah,09h
	mov al,'S'
	mov bh,0
	mov bl,05
	mov cx,1
	int 10h
	
	MOV AH,2                ;SET CURSOR POSITION                 
	MOV DH,Row_poistion  	 ;SET ROW 
	inc Column_poistion
	MOV DL,Column_poistion  ;SET COLUMN
	INT 10H 

	mov ah,09h
	mov al,'I'
	mov bh, 0
	mov bl,05
	mov cx,1
	int 10h
	
	
	mov Row_poistion, 13
	mov Column_poistion,35
	mov count,0

	
	MOV AH,2                ;SET CURSOR POSITION                 
	MOV DH,Row_poistion   ;SET ROW 
	inc Column_poistion
	MOV DL,Column_poistion  ;SET COLUMN
	INT 10H                 ;CALLING BIOS

	mov ah,09h
	mov al, 'D'
	mov bh,0
	mov bl,05
	mov cx,1
	int 10h
	
	MOV AH,2                ;SET CURSOR POSITION                 
	MOV DH,Row_poistion   	;SET ROW 
	inc Column_poistion
	MOV DL,Column_poistion  ;SET COLUMN
	INT 10H                 ;CALLING BIOS

	mov ah,09h
	mov al,'H'
	mov bh,0
	mov bl,05
	mov cx,1
	int 10h
	
	MOV AH,2                ;SET CURSOR POSITION                 
	MOV DH,Row_poistion  	 ;SET ROW 
	inc Column_poistion
	MOV DL,Column_poistion  ;SET COLUMN
	INT 10H  	;CALLING BIOS
	
	mov ah,09h
	mov al,'A'
	mov bh,0
	mov bl,05
	mov cx,1
	int 10h
	
	MOV AH,2                ;SET CURSOR POSITION                 
	MOV DH,Row_poistion  	 ;SET ROW 
	inc Column_poistion
	MOV DL,Column_poistion  ;SET COLUMN
	INT 10H 

	mov ah,09h
	mov al,'A'
	mov bh, 0
	mov bl,05
	mov cx,1
	int 10h
	
	MOV AH,2                ;SET CURSOR POSITION                 
	MOV DH,Row_poistion  	 ;SET ROW 
	inc Column_poistion
	MOV DL,Column_poistion  ;SET COLUMN
	INT 10H 

	mov ah,09h
	mov al,'B'
	mov bh, 0
	mov bl,05
	mov cx,1
	int 10h
	
	MOV AH,2                ;SET CURSOR POSITION                 
	MOV DH,Row_poistion  	 ;SET ROW 
	inc Column_poistion
	MOV DL,Column_poistion  ;SET COLUMN
	INT 10H 

	mov ah,09h
	mov al,'A'
	mov bh, 0
	mov bl,05
	mov cx,1
	int 10h
	
	
	
ret
main_menu endp
gui proc
	 MOV AX,@DATA
    MOV DS,AX
    mov ax, 1003h
    mov bl, 0
    int 10h
	;white left
	mov ax, 0600h
	mov cx, 0000h
	mov dx, 2510h
	mov bh, 0F1h
	mov al, 0
	int 10h
    ;green
	mov ax, 0600h
	mov cx, 0011h
	mov dx, 2550h
	mov bh, 20h
	mov al, 0
	int 10h
	;white right
    mov ax, 0600h
	mov cx, 0040h
	mov dx, 2550h
	mov bh, 0F1h
	mov al, 0
	int 10h

    mov ah,02
    mov bh,0
    mov dh,00
    mov dl,00
    int 10h

    ret
gui endp
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

call main_menu   ;desi dhaba screen
mov ah,01
int 21h
 
 upp:
 
 call gui        ;green  white background
 print names
 print main_choice
 mov ah,01h
 int 21h
 
 cmp al,'1'
 je manage
 cmp al,'2'
 je Top

 jmp upp
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 manage:
 print menu_main

mov ah,01h
int 21h

cmp al,'1'
je add_item
cmp al,'2'
je update_item
cmp al,'3'
je delete_item
cmp al,'4'
je search_item

jmp manage

add_item:
print additem
mov ah,01h
int 21H

cmp al,'1'
je breakadd
cmp al,'2'
je lunchadd
cmp al,'3'
je dinneradd
cmp al,'4'
je drinkadd

jmp manage

breakadd:
add1 nashta_file , nashtacounter
jmp upp
lunchadd:
add1 lunch_file , lunchcounter
jmp upp
dinneradd:
add1 dinner_file , dinnercounter
jmp upp
drinkadd:
add1 drink_file , drinkcounter
jmp upp

update_item:
print endl
print2 edit_file,editcounter
print update_choice
mov ah,01h
int 21h
mov index,al
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;s
;update1 macro file_name, counter
mov dx,offset edit_file
mov al,2
mov ah,3dh
int 21h 
mov handle,ax
;read
MOV bx,handle 
MOV CX, lengthof buffer
mov dx,offset buffer
mov ah,3fh
int 21h
 ;add string
xor cx,cx
mov si,offset buffer
.while cx!=editcounter
mov bl,[si]
cmp bl,index
je updatee
inc si
inc cx
.endw
jmp upp
updatee:
print newdish
.while cx!=editcounter
mov ah,01h
int 21h
cmp al,13
je downn
mov [si],al
inc si
inc cx
.endw
downn:
write_file edit_file,editcounter
;close
mov ah,3eh
mov bx,handle
int 21h
jmp upp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
delete_item:
print delete_choice
mov ah,01h
int 21h





mov index,al
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;s
;update1 macro file_name, counter
mov dx,offset edit_file
mov al,2
mov ah,3dh
int 21h 
mov handle,ax
;read
MOV bx,handle 
MOV CX, lengthof buffer
mov dx,offset buffer
mov ah,3fh
int 21h
 ;add string
xor cx,cx
mov si,offset buffer
.while cx!=editcounter
mov bl,[si]
cmp bl,index
je deletee
inc si
inc cx
.endw
jmp upp
deletee:
.while cx!=editcounter
mov bl,[si]
cmp bl,'-'
je downnn
mov bl,' '
mov [si],bl
inc si
inc cx
.endw
downnn:
mov bl,' '
mov [si],bl
write_file edit_file,editcounter
;close
mov ah,3eh
mov bx,handle
int 21h
jmp upp

search_item:
print search_choice
mov ah,01h
int 21h

mov index,al
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;s
;update1 macro file_name, counter

mov dx,offset edit_file
mov al,2
mov ah,3dh
int 21h 
mov handle,ax

;read
MOV bx,handle 
MOV CX, lengthof buffer
mov dx,offset buffer
mov ah,3fh
int 21h
 ;add string
xor cx,cx
mov si,offset buffer
.while cx!=editcounter
mov bl,[si]
cmp bl,index
je searche
inc si
inc cx
.endw
print search_false
jmp upp
searche:
print search_true
.while cx!=editcounter
mov bl,[si]
cmp bl,'-'
je downnnn
mov dx,[si]
mov ah,02h
int 21h
inc si
inc cx
.endw
downnnn:
mov ah,3eh
mov bx,handle
int 21h
mov ah,01h
int 21h
jmp upp


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
TOP:
call gui

 print WELCOME        ;weclome
 
 print endl ;NEWLINE
 mov price,'0'
 
 print M3 ; breakfast
 print M2 ; choice
 
 
 MOV AH,1 ; input
 INT 21H
 MOV BH,AL
 SUB BH,48
 
 CMP BH,1
 JE BREAKFAST
 
 CMP BH,2
 JE LUNCH 
 
 CMP BH,3
 JE DINNER 
 
 CMP BH,4
 JE DRINKS
 JMP INVALID
 
 BREAKFAST:
 print endl
 print2 nashta_file,nashtacounter
 print M57
 
 MOV AH,1
 INT 21H
 MOV BL,AL
 SUB BL,48

 push bx
 call gui
 pop bx

 CMP BL,1
 JE TEN
 
 CMP BL,2
 JE TEN
 
 CMP BL,3
 JE TEN 
 
 CMP BL,4
 JE TEN
 
 CMP BL,5
 JE TWENTY
 
 CMP BL,6
 JE TWENTY
 
 CMP BL,7
 JE TEN
 
 CMP BL,8
 JE TWENTY 
 
 CMP BL,9
 JE SIXTY

 JMP INVALID
 
 FOURTY:
 
 MOV BL,4
 
 print M58
 
 
 
 MOV AH,1
 INT 21H
 SUB AL,48
 
 MUL BL 
 AAM 
 
 MOV CX,AX 
 ADD CH,48
 ADD CL,48
 
 
 print M59
 
 MOV AH,2
 MOV DL,CH
 INT 21H
 
 
 MOV DL,CL
 INT 21H
 
 MOV DL,'0'
 INT 21H
 
 ;FOR /- PRINT
 MOV DL,47
 INT 21H
 MOV DL,45
 INT 21H
 
 ;GO BACK TO MAIN MENU
 
 print M60
 
 print M61
 
 print string
 
 print M2
 
 MOV AH,1
 INT 21H
 SUB AL,48
 
 
 
 CMP AL,1
 JE TOP
 cmp Al,2
 JE BreakFast
 
 JMP EXIT
 
 FIFTY:
 
 MOV BL,4
 
 print M58
 
 MOV AH,1
 INT 21H
 SUB AL,48
 
 MUL BL 
 AAM 
 
 MOV CX,AX 
 ADD CH,48
 ADD CL,48
 
 print M59
 
 MOV AH,2
 MOV DL,CH
 INT 21H
 
 
 MOV DL,CL
 INT 21H
 
 MOV DL,'0'
 INT 21H 
 
 
 ;FOR /- PRINT
 MOV DL,47
 INT 21H
 MOV DL,45
 INT 21H
 
 
 ;GO BACK TO MAIN MENU
 
 print M60
 
 print M61
 
 print M2
 
 MOV AH,1
 INT 21H
 SUB AL,48 ;MAIN MENU
 
 
 
 CMP AL,1
 JE TOP
 
 JMP EXIT
 
 SEVENTY:
 
 MOV BL,7
 
 print M58
 
 
 
 MOV AH,1
 INT 21H
 SUB AL,48
 
 
 
 MUL BL 
 AAM 
 
 MOV CX,AX 
 ADD CH,48
 ADD CL,48
 
 
 print M59
 
 MOV AH,2
 MOV DL,CH
 INT 21H
 
 
 MOV DL,CL
 INT 21H
 
 MOV DL,'0'
 INT 21H 
 
 
 ;FOR /- PRINT
 MOV DL,47
 INT 21H
 MOV DL,45
 INT 21H
 
 ;GO BACK TO MAIN MENU 
 
 print M60
 
 print M61
 
 print M2
 
 MOV AH,1
 INT 21H
 SUB AL,48
 
 
 
 CMP AL,1
 JE TOP
 
 JMP EXIT
 
 EIGHTY:
 
 MOV BL,8
 print M58
 
 MOV AH,1
 INT 21H
 SUB AL,48
 
 
 
 MUL BL 
 AAM 
 
 MOV CX,AX 
 ADD CH,48
 ADD CL,48
 
 
 print M59
 
 MOV AH,2
 MOV DL,CH
 INT 21H
 
 
 MOV DL,CL
 INT 21H
 
 MOV DL,'0'
 INT 21H
 
 ;FOR /- PRINT
 MOV DL,47
 INT 21H
 MOV DL,45
 INT 21H
 
 ;GO BACK TO MAIN MENU
 
 print M60
 
 print M61
 
 print M2
 
 MOV AH,1
 INT 21H
 SUB AL,48
 
 
 
 CMP AL,1
 JE TOP
 
 JMP EXIT 
 
 JMP EXIT
 
 LUNCH:
 
 print M8
 
 print endl
 
 print2 lunch_file,lunchcounter
 
 print M57 
 
 
 MOV AH,1
 INT 21H
 MOV BL,AL
 SUB BL,48 
 push bx
 call gui
 pop bx
 CMP BL,1
 JE NINETY
 
 CMP BL,2
 JE NINETY
 
 CMP BL,3
 JE THIRTY
 
 CMP BL,4
 JE NINETY
 
 CMP BL,5
 JE NINETY
 
 CMP BL,6
 JE TEN
 
 CMP BL,7
 JE THIRTY
 
 CMP BL,8
 JE THIRTY 
 
 CMP BL,9
 JE THIRTY
 
 JMP INVALID
 
 TEN:
 MOV BL,1
 print M58
 
 MOV AH,1
 INT 21H
 SUB AL,48
 
 MUL BL 
 AAM 
 
 MOV CX,AX 
 ADD CH,48
 ADD CL,48
 
 print M59 
 
 MOV AH,2
 MOV DL,CH
 INT 21H
 
 MOV DL,CL
 INT 21H
 
 MOV DL,'0'
 INT 21H 
 
 ;FOR /- PRINT
 
 MOV DL,47
 INT 21H
 MOV DL,45
 INT 21H
 
 ;GO BACK TO MAIn menu
 print M60
 print M61
 print string
 print M2
 
 MOV AH,1
 INT 21H 
 SUB AL,48
 
 CMP AL,1
 JE TOP
 cmp Al,3
 JE breakFast
 
 JMP EXIT
 
 TWENTY:
 
 MOV BL,2
 print M58
 
 MOV AH,1
 INT 21H
 SUB AL,48
 
 MUL BL 
 AAM 
 
 MOV CX,AX 
 ADD CH,48
 ADD CL,48
 
 print M59
 
 MOV AH,2
 MOV DL,CH
 INT 21H
 
 
 MOV DL,CL
 INT 21H
 
 MOV DL,'0'
 INT 21H
 
 ;FOR /- PRINT
 MOV DL,47
 INT 21H
 MOV DL,45
 INT 21H
 
 ;GO BACK TO MAIN MENU
 print M60
 
 print M61
 
 
 print M2
 
 MOV AH,1
 INT 21H
 SUB AL,48
 
 
 
 CMP AL,1
 JE TOP
 
 JMP EXIT 
 
 THIRTY:
 
 MOV BL,3
 print M58
 
 
 
 MOV AH,1
 INT 21H
 SUB AL,48
 
 
 
 MUL BL 
 AAM 
 
 MOV CX,AX 
 ADD CH,48
 ADD CL,48
 
 
 print M59
 
 MOV AH,2
 MOV DL,CH
 INT 21H
 
 
 MOV DL,CL
 INT 21H
 
 MOV DL,'0'
 INT 21H 
 
 ;FOR /- PRINT
 MOV DL,47
 INT 21H
 MOV DL,45
 INT 21H
 
 ;GO BACK TO MAIN MENU
 
 print M60
 
 print M61
 
 
 print string
 
 
 print M2 
 
 MOV AH,1
 INT 21H
 SUB AL,48
 
 
 
 CMP AL,1
 JE TOP
 cmp al,3
 je breakfast
 JMP EXIT
 
 
 SIXTY: 
 
 MOV BL,6
 
 print M58 
 
 
 
 MOV AH,1
 INT 21H
 SUB AL,48
 
 
 
 MUL BL 
 AAM 
 
 MOV CX,AX 
 ADD CH,48
 ADD CL,48
 
 
 print M59
 
 MOV AH,2
 MOV DL,CH
 INT 21H
 
 
 MOV DL,CL
 INT 21H
 
 MOV DL,'0'
 INT 21H 
 
 ;FOR /- PRINT
 MOV DL,47
 INT 21H
 MOV DL,45
 INT 21H
 
 ;GO BACK TO MAIN MENU 
 
 print M60 
 print M61
 print M2
 print string
 
 MOV AH,1
 INT 21H
 SUB AL,48
 
 
 
 CMP AL,1
 JE TOP
 cmp al,3
 je breakfast
 JMP EXIT
 
 
 NINETY:
 MOV BL,9
 
 print M58 
 
 
 
 MOV AH,1
 INT 21H
 SUB AL,48
 
 
 
 MUL BL 
 AAM 
 
 MOV CX,AX 
 ADD CH,48
 ADD CL,48
 
 
 print M59

 MOV AH,2
 MOV DL,CH
 INT 21H
 
 
 MOV DL,CL
 INT 21H
 
 MOV DL,'0'
 INT 21H
 
 ;FOR /- PRINT
 MOV DL,47
 INT 21H
 MOV DL,45
 INT 21H 
 
 ;GO BACK TO MAIN MENU
 
 print M60
 
 print M61
 
 print M2 
 
 MOV AH,1
 INT 21H
 SUB AL,48
 
 
 
 CMP AL,1
 JE TOP
 
 JMP EXIT 

 
 JMP EXIT 

 
 DINNER:

 print M8
 print endl
 print2 dinner_file,dinnercounter
 
 
 
 print M57
 
 MOV AH,1
 INT 21H
 MOV BL,AL
 SUB BL,48 
 push bx
 call gui
 pop bx
 CMP BL,1
 JE SIXTY
 
 CMP BL,2
 JE EIGHTY
 
 CMP BL,3
 JE EIGHTY 
 
 CMP BL,4
 JE FOURTY
 
 CMP BL,5
 JE FIFTY
 
 CMP BL,6
 JE SEVENTY
 
 CMP BL,7
 JE SIXTY
 
 CMP BL,8
 JE SIXTY 
 
 CMP BL,9
 JE SIXTY
 
 FOURTY1:
 MOV BL,4
 print M58
 
 
 
 MOV AH,1
 INT 21H
 SUB AL,48
 
 
 
 MUL BL 
 AAM 
 
 MOV CX,AX 
 ADD CH,48
 ADD CL,48
 
 
 print M59
 
 MOV AH,2
 MOV DL,CH
 INT 21H
 
 
 MOV DL,CL
 INT 21H
 
 MOV DL,'0'
 INT 21H
 
 ;FOR /- PRINT
 MOV DL,47
 INT 21H
 MOV DL,45
 INT 21H
 
 ;GO BACK TO MAIN MENU
 
 print M60
 
 print M61
 
 print M2 ;MAIN MENU
 
 MOV AH,1
 INT 21H
 SUB AL,48
 
 
 
 CMP AL,1
 JE TOP
 
 JMP EXIT
 
 
 
 FIFTY1:
 MOV BL,4
 print M58
 
 
 
 MOV AH,1
 INT 21H
 SUB AL,48
 
 
 
 MUL BL 
 AAM 
 
 MOV CX,AX 
 ADD CH,48
 ADD CL,48
 
 
 print M59
 
 MOV AH,2
 MOV DL,CH
 INT 21H
 
 
 MOV DL,CL
 INT 21H
 
 MOV DL,'0'
 INT 21H 
 
 
 ;FOR /- PRINT
 MOV DL,47
 INT 21H
 MOV DL,45
 INT 21H
 
 
 ;GO BACK TO MAIN MENU
 
 print M60
 
 print M61
 
 print M2 
 
 MOV AH,1
 INT 21H
 SUB AL,48 ;MAIN MENU
 
 
 
 CMP AL,1
 JE TOP
 
 JMP EXIT
 
 SIXTY1: 
 
 MOV BL,6
 
 print M58
 
 
 
 MOV AH,1
 INT 21H
 SUB AL,48
 
 
 
 MUL BL 
 AAM 
 
 MOV CX,AX 
 ADD CH,48
 ADD CL,48
 
 
 print M59
 
 MOV AH,2
 MOV DL,CH
 INT 21H
 
 
 MOV DL,CL
 INT 21H
 
 MOV DL,'0'
 INT 21H 
 
 ;FOR /- PRINT
 MOV DL,47
 INT 21H
 MOV DL,45
 INT 21H
 
 ;GO BACK TO MAIN MENU 
 
 print M60
 
 print M61 ;MAIN MENU
 
 print M2 
 
 MOV AH,1
 INT 21H
 SUB AL,48
 
 
 
 CMP AL,1
 JE TOP
 
 JMP EXIT 
 
 
 
 
 SEVENTY1:
 MOV BL,7
 print M58
 
 
 
 MOV AH,1
 INT 21H
 SUB AL,48
 
 
 
 MUL BL 
 AAM 
 
 MOV CX,AX 
 ADD CH,48
 ADD CL,48
 
 
 print M59
 
 MOV AH,2
 MOV DL,CH
 INT 21H
 
 
 MOV DL,CL
 INT 21H
 
 MOV DL,'0'
 INT 21H 
 
 
 ;FOR /- PRINT
 MOV DL,47
 INT 21H
 MOV DL,45
 INT 21H
 
 ;GO BACK TO MAIN MENU 
 
 print M60
 
 print M61
 
 print M2 ;MAIN MENU
 
 MOV AH,1
 INT 21H
 SUB AL,48
 
 
 
 CMP AL,1
 JE TOP
 
 JMP EXIT
 
 EIGHTY1:
 MOV BL,8
 print M58
 
 
 
 MOV AH,1
 INT 21H
 SUB AL,48
 
 
 
 MUL BL 
 AAM 
 
 MOV CX,AX 
 ADD CH,48
 ADD CL,48
 
 
 print M59
 
 MOV AH,2
 MOV DL,CH
 INT 21H
 
 
 MOV DL,CL
 INT 21H
 
 MOV DL,'0'
 INT 21H
 
 ;FOR /- PRINT
 MOV DL,47
 INT 21H
 MOV DL,45
 INT 21H
 
 print M60
 print M61
 print M2
 
 MOV AH,1
 INT 21H
 SUB AL,48
 
 CMP AL,1
 JE TOP
 
 JMP EXIT 
 
 JMP EXIT
 
 DRINKS: 
 print M8 
 print endl
 print2 drink_file,drinkcounter
 print M57
 
 MOV AH,1
 INT 21H
 MOV BL,AL
 SUB BL,48 
  push bx
  call gui
  pop bx
 CMP BL,1
 JE SOFTDRINK
 
 CMP BL,2
 JE LASCHI
 
 CMP BL,3
 JE BORHANI
 
 CMP BL,4
 JE LABANG
 
 CMP BL,5
 JE COFFEE 
 
 CMP BL,6
 JE TEA 
 
 JMP INVALID
 
 SOFTDRINK:
 MOV BL,8
 JMP COMMON
 
 LASCHI:
 MOV BL,6
 JMP COMMON
 
 BORHANI:
 MOV BL,9
 JMP COMMON
 
 LABANG:
 MOV BL,9
 JMP COMMON
 
 COFFEE:
 MOV BL,7
 JMP COMMON
 
 TEA:
 MOV BL,5
 JMP COMMON
 
 COMMON: 
 print M58
 
 MOV AH,1
 INT 21H
 SUB AL,48
 
 MUL BL 
 AAM 
 
 MOV CX,AX 
 ADD CH,48
 ADD CL,48
 
 print M59
 
 MOV AH,2
 MOV DL,CH
 INT 21H
  
 MOV DL,CL
 INT 21H 

 MOV DL,47
 INT 21H
 MOV DL,45
 INT 21H
 
 print M60
 print M61
 print M2 
 
 MOV AH,1
 INT 21H
 SUB AL,48
 CMP AL,1
 
 JE TOP
 
 JMP EXIT
 
 INVALID:
 
 print M55
 print M56 

jmp exit

exit:
 
mov ah,4ch
int 21h

main endp
end main