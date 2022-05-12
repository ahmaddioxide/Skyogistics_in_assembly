include hw.lib
.model small
.stack 2000h
.data
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
FILENAME DB "FILE.TXT", 0
HUNDRED_COUNT DB 0
TWOHUNDRED_COUNT DB 0
SIXTYRS DB 0
NINTYRS DB 0
THIRTYRS DB 0
FIFTYRS DB 0
TWENTYRS DB 0
PROMTENTERYOURDETAILS DB 10,13,'            |ENTER YOUR DELIVERY DETAILS|$'
THANKYOU DB 10,13,'******** THANK YOU FOR SHOPPING WITH SkyLgistics********',10,13,10,13,'******** | YOUR ODER WILL BE DELIVERED SOON |********$'
AHMAD DB 10,13,'-> MUHAMMAD AHMAD MAHMOOD *200785$'
WALEED DB 10,13,'-> MUHAMMAD WALEED *200834$'
USAMA DB 10,13,'-> CH. USAMA HAYAT *200884$'
PRESSENTER DB 10,13,'        PRESS ENTER TO LOGIN$'
LOGINPAGE DB 10,13,'          LOGIN$'
ENTERPASSWORD DB 10,13,'  |ENTER PASSWORD : $'
ENTERAGAIN DB 10,13,'   |ENTER AGAIN ! $'
PASSWORDINCORRECT DB 10,13,' | PASSWORD INCORRECT: $'
DEFAULTPASSWORD DB 'admin'
PASSWORD DB 5 dup(' ')
ENTERNAME DB 10,13,'->|ENTER YOUR NAME : $'
ENTERHOMEADDRESS DB '->|ENTER YOUR HOME ADDRESS : $'
ENTERPHONE DB '->|ENTER YOUR PHONE : $'
hcorrected DB '0000'
promtNAME DB '->|NAME : '
promtADDRESS DB '->|ADDRESS : '
promtPHONENO DB '->|PHONE : '
promtTotals DB '->TOTAL BILL : '
promtUpdatePasswords DB 10,13,'-> |0. UPDATE PASSWORD$'
promtENTERNEWPASSWORD DB 10,13,'|ENTER NEW PASSWORD (5 digit) : $'
promtPasswordUPDATESUCESSION DB 10,13,'->| Password UPDATED SUCCESSFULLY!',10,13,'LOGIN AGAIN$'


buffer byte 900 dup ('$')
erroropeningfile byte 0ah,"file error",'$'
handle word ?

MSG1 DB 10,13,'       Welcome to SkyLogistics$'
MSG2 DB 10,13,10,13,'Enter your Choice $'
USERNAME db 20 dup(' ')
ADDRESS db 30 dup(' ')
PHONE db 11 dup(' ')
TOTALBILL dW 6 dup(' ')
FILESPACE db 10,13
temp DW 0

MSG3 DB 10,13,'|              |1.Fruit & Vegetables                                |$' 
MSG4 DB 10,13,'|              |2.Personal Care                                     |$'
MSGS5 DB 10,13,'|              |3.Bakery & Dairy                                    |$'
MSG5 DB 10,13,'|              |4.Snacks                                            |$'
MSG6 DB 10,13,'|              |5.Dry Fruits                                        |$'
MSG7 DB 10,13,'|              |6.Drinks                                            |$'  
               
MSG8 DB 10,13,10,13,'***            |Choose your order from the List|             ***$'
;SGFruit & Vegetables  
MSG9 DB 10,13,'|             |1.Banana                                100/-         |$' ;breakfast
MSG10 DB 10,13,'|             |2.Orange                                100/-        |$'
MSG11 DB 10,13,'|             |3.Pomegranate                           100/-        |$'
MSG12 DB 10,13,'|             |4.Guava                                 100/-        |$'
MSG13 DB 10,13,'|             |5.Apples                                200/-        |$'
MSG14 DB 10,13,'|             |6.Carrots                               200/-        |$'
MSG15 DB 10,13,'|             |7.Reddish                               100/-        |$'
MSG16 DB 10,13,'|             |8.Peas                                  200/-        |$'
MSG17 DB 10,13,'|             |9.Potatoes                              200/-        |$'
;SGpersonal Car 
MSG25 DB 10,13,'|             |1.Pantene Shampoo 250ml                  100/-       |$' 
MSG26 DB 10,13,'|             |2.Gillete Fusion 3pcs                    100/-       |$' 
MSG27 DB 10,13,'|             |3.Safeguard 90gm                         200/-       |$' 
MSG28 DB 10,13,'|             |4.Cosmo Shaving Foam 400ml               200/-       |$'
MSG29 DB 10,13,'|             |5.Nivea Men Cool Kick ROll On            300/-       |$'
MSG30 DB 10,13,'|             |6.BOLD Deodrant 120ml                    300/-       |$'
MSG31 DB 10,13,'|             |7.Nivea Care Showergel 250ml             200/-       |$'
MSG32 DB 10,13,'|             |8.Colgate Miswak ToothPaste              100/-       |$'
MSG33 DB 10,13,'|             |9.Colgate Zig Zag Toothbrush             100/-       |$'
          
;SGBakery and dairy         
       
MSG18 DB 10,13,'|             |1.Olpers 1.5lt                          100/-        |$'
MSG19 DB 10,13,'|             |2.Dawn Bread Large                      100/-        |$'
MSG20 DB 10,13,'|             |3.Eggs Farm Freash                      200/-        |$' 
MSG21 DB 10,13,'|             |4.Olpers Cream 200ml                    200/-        |$'
MSG22 DB 10,13,'|             |5.Nautures Own White Oats               100/-        |$'
MSG23 DB 10,13,'|             |6.Dawn Break Bakar Khani                100/-        |$'
MSG34 DB 10,13,'|             |7.Adams Chadder Cheese                  300/-        |$'
MSG35 DB 10,13,'|             |8.Yougart 500gm                         300/-        |$'
MSG36 DB 10,13,'|             |9.Corn Flakes                           100/-        |$'
   
;SGsnack       
  
MSG41 DB 10,13,'|             |1.Lays                                   100/-        |$'
MSG42 DB 10,13,'|             |2.Cheetos 8                              200/-        |$'
MSG43 DB 10,13,'|             |3.Cadbury Dairy Milk                     300/-        |$'
MSG44 DB 10,13,'|             |4.Chick Pead 5 80gm                      300/-        |$'
;SGdry fruits||
MSG45 DB 10,13,'|             |1.almonds                                300/-         |$' 
MSG46 DB 10,13,'|             |2.Cashew                                 300/-         |$'
MSG47 DB 10,13,'|             |3.Peanuts                                300/-         |$'
MSG48 DB 10,13,'|             |4.Coconut                                200/-         |$'
;SGDrinks||
MSG49 DB 10,13,'|             |1.Coke                                    100/-       |$'
MSG50 DB 10,13,'|             |2.Pepsi Cans                              100/-       |$'
MSG51 DB 10,13,'|             |3.Nestle Nesfruita                        100/-       |$'
MSG52 DB 10,13,'|             |4.Peach Malt                              100/-       |$'
MSG53 DB 10,13,'|             |5.Nestle Cold Coffee                      100/-       |$'
MSG54 DB 10,13,'|             |6.Fanta                                   100/-       |$'

;SGINVALID
MSG55 DB 10,13,10,13,'             ------| INVALID INPUT :(|------$'
MSG56 DB 10,13,10,13,10,13,'                     | RUN PROGRAM AGAIN |$'

MSG57 DB 10,13,10,13,'          Please Select your order : $'
MSG58 DB 10,13,10,13,'    ->|ENTER Quantity : $'
MSG59 DB 10,13,10,13,'    ->|Your Total Bill for this Item : $'


QUANTITY DB ?
totalammount DW 0

MSG60 DB 10,13,10,13,'              | 1.To Go Back to Main Menu$'
MSG61 DB 10,13,10,13,'              | 2. Logout and Exit $'
;STARS

MSGR1 DB 10,13,'|                                                                   |$'
MSGR2 DB 10,13,'____________________________________________________________________$'

MSGR3 DB 10,13,'|                                                                   |$'
MSGR4 DB 10,13,'|                                                                   |$'
MSGR5 DB 10,13,'____________________________________________________________________$'

MSGR6 DB 10,13,'|                                                                   | $'
MSGR7 DB 10,13,'____________________________________________________________________$'

SSE DB 10,13,10,13,' $'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



.code

 ;description
main PROC

    mov ax,@DATA
    mov DS,ax
    
;ORDERDETAILS
clc
WELCOME
clc
CLEAR
clc
loginagain:
LOGIN
START: 
clear


CLEAR

;ORDERDETAILS

EQUAL:
   
    WRITE MSG1

      
    
    call space
    WRITE MSGR2
      
      
    
    WRITE MSGR3
      
      


    WRITE MSG3
      
      
    
    WRITE MSG4
      
      
    
    WRITE MSGS5
      
      
    
    WRITE MSG5
      
      
    
    WRITE MSG6
      
      
    
    WRITE MSG7

    WRITE promtUpdatePasswords
      
      
    
    WRITE MSGR1
      
      
    
    WRITE MSGR2
      
      
    
    WRITE MSGR2
      
      
    
    WRITE MSG2
      
      

    ; Comparison and Getting into catagories 
    mov ah,1
    int 21h
    mov BH,al
    SUB BH,48
    
    MOV AX,06H
 INT 10H 
    CMP BH,1
    JE Fruits
    
    CMP BH,2
    JE PersonalCare   
    ; 
    CMP BH,3
    JE Bakkery 
    ;
    ;
    CMP BH,4
    JE Snacks
    ; 
     
    CMP BH,5
    JE Dryfruits
    ;
    CMP BH,6
    JE DRINKS

    CMP BH,0
    JE UPDATEPASSWORDL
    
    
    JMP INVALID



    Fruits:
;;printing fruits menu
    CLEAR
    
    WRITE MSG8    
      
      
    
   call space
    
    WRITE MSGR5
      
      
    
    
    WRITE MSGR5
      
      
    
    WRITE MSGR4
      
      
   
    WRITE MSG9     
      
       
    
    
    WRITE MSG10   
      
      
    
    WRITE MSG11
                 
       
    
    WRITE MSG12
                  
      
    
    
    WRITE MSG13           
      
      
    
    
    WRITE MSG14       
      
      
            
    
    WRITE MSG15
                  
      
            
            
    WRITE MSG16         
      
       
    
    WRITE MSG17          
      
    
    
    WRITE MSGR4
      
      
    
    WRITE MSGR5
      
      
    
    
    WRITE MSGR5
      
      
    
    
    WRITE MSG57              
      
       
    
    ;taking input of 
    mov ah,1
      int 21h
    mov bl,al
    SUB bl,48 

    
    CMP bl,1

    JE HUNDRED
    
    CMP bl,2
    JE HUNDRED
    
    CMP bl,3
    JE HUNDRED 
    
    CMP bl,4
    JE HUNDRED
    
    CMP bl,5
    JE T_HUNDRED
    
    CMP bl,6
    JE T_HUNDRED
    
    CMP bl,7
    JE HUNDRED
    
    CMP bl,8
    JE T_HUNDRED 
    
    CMP bl,9
    JE T_HUNDRED
    
    JMP INVALID 



    PersonalCare:
        CLEAR
;;printing personal care menu
                    
    WRITE MSG8
      
      
    
    
    
    call space
     
    WRITE MSGR5
      
      
    
     
    WRITE MSGR5
      
      
                  
    WRITE MSGR4
      
      
    
    
     
    
    WRITE MSG25               
      
       
  
    WRITE MSG26               
      
      
    
    WRITE MSG27               
      
        
    
    WRITE MSG28               
      
       
    
    WRITE MSG29               
      
                              
    
    
    WRITE MSG30               
      
       
    
    WRITE MSG31               
      
       
    
    WRITE MSG32               
      
        
    
    WRITE MSG33               
      
      
    

    
    WRITE MSGR4
      
      
                  
    WRITE MSGR5
      
      
    
    
    WRITE MSGR5
      
       
    
    
    WRITE MSG57              
      
       
    
    
    mov ah,1
      int 21h
    mov bl,al
    SUB bl,48 
    
    CMP bl,1
    JE HUNDRED
    
    CMP bl,2
    JE HUNDRED
    
    CMP bl,3
    JE T_HUNDRED
    
    CMP bl,4
    JE T_HUNDRED
    
    CMP bl,5
    JE THREE_HUNDRED
    
    CMP bl,6
    JE THREE_HUNDRED
    
    CMP bl,7
    JE T_HUNDRED
    
    CMP bl,8
    JE HUNDRED 
    
    CMP bl,9
    JE HUNDRED
   
    
    JMP INVALID

Bakkery:
;printing bakkery menu
    CLEAR

    WRITE MSG8
                 
      
    
    call space
    
    
    WRITE MSGR5
      
      
    
    WRITE MSGR5
      
              
    
    WRITE MSGR4
      
      
    
    
    
    WRITE MSG18          
      
       
    
    WRITE MSG19
                      
      
    
    
    WRITE MSG20            
      
      
    
    WRITE MSG21
                        
        
    
    
    WRITE MSG22                
      
       
    
    
    WRITE MSG23                 
      
      
    
     
    WRITE MSG34                 
      
      
    
    
    WRITE MSG35                 
      
       
    
    WRITE MSG36                 
      
      
    
    
    
    WRITE MSGR4
      
      
    
    WRITE MSGR5     
      
      
    
    
    WRITE MSGR5
      
         
    
    
    
    
    WRITE MSG57              
      
       
    
    
    mov ah,1
      int 21h
    mov bl,al
    SUB bl,48 
    
    CMP bl,1
    JE HUNDRED
    
    CMP bl,2
    JE  HUNDRED
    
    CMP bl,3
    JE T_HUNDRED 
    
    CMP bl,4
    JE T_HUNDRED
    
    CMP bl,5
    JE HUNDRED
    
    CMP bl,6
    JE HUNDRED
    
    CMP bl,7
    JE THREE_HUNDRED
    
    CMP bl,8
    JE THREE_HUNDRED 
    
    CMP bl,9
    JE HUNDRED



SNACKS:
;printing snaks menu

    CLEAR

    WRITE MSG8
               
      
    
    call space

    WRITE MSGR7
      
      
    
    
    WRITE MSGR7
      
             
    
    WRITE MSGR6
      
      
    
    
    WRITE MSG41                
      
       
    
    WRITE MSG42                 
      
                               
    
    WRITE MSG43                 
      
      
    
    WRITE MSG44                 
      
      
    
    WRITE MSGR6
      
      
    
    
    WRITE MSGR7
      
             
    
    WRITE MSGR7
      
       
    
    WRITE MSG57              
      
       
    
    
    mov ah,1
      int 21h
    mov bl,al
    SUB bl,48 
    
    CMP bl,1
    JE HUNDRED
    
    CMP bl,2
    JE T_HUNDRED
    
    CMP bl,3
    JE THREE_HUNDRED
    
    CMP bl,4
    JE THREE_HUNDRED
    
    JMP INVALID




Dryfruits:
    CLEAR

  
    WRITE MSG8
             
    
    call space
    
    WRITE MSGR7
      
      
    
    
    WRITE MSGR7
      
             
    WRITE MSGR6
      
      
    
    WRITE MSG45                
      
       
    
    WRITE MSG46                 
      
                               
    
    WRITE MSG47                 
      
      
    
    WRITE MSG48                 
      
      
    
    
    WRITE MSGR6
      
      
    
    
    WRITE MSGR7
      
             
    
    WRITE MSGR7
      
      
    
    
    WRITE MSG57              
      
       
    
    
    mov ah,1
      int 21h
    mov bl,al
    SUB bl,48
     
    CMP bl,1
    JE THREE_HUNDRED
    CMP bl,2
    JE T_HUNDRED
    CMP bl,3
    JE T_HUNDRED
    CMP bl,4
    JE T_HUNDRED

    JMP INVALID



    DRINKS:  
    WRITE MSG8
                
       
    
    call space
    
    WRITE MSGR7
      
      
    
    
    WRITE MSGR7
      
             
    
    WRITE MSGR6
      
      
   
   
    WRITE MSG49                
      
       
    
    WRITE MSG50                 
      
                               
    
    WRITE MSG51                 
      
      
    
    WRITE MSG52                 
      
       
    
    WRITE MSG53                 
      
      
    
    WRITE MSG54                 
      
      
    
    WRITE MSGR6
      
      
    
    
    WRITE MSGR7
      
             
    
    WRITE MSGR7
      
      
    
    WRITE MSG57              
      
       
    
    
    mov ah,1
      int 21h
    mov bl,al
    SUB bl,48 
    
    CMP bl,1
    JE HUNDRED
    
    CMP bl,2
    JE HUNDRED
    
    CMP bl,3
    JE HUNDRED
    
    CMP bl,4
    JE HUNDRED
    
    CMP bl,5
    JE HUNDRED 
    
    CMP bl,6
    JE HUNDRED 
    
    JMP INVALID
    
    
    

    
    
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    
HUNDRED:
    mov bl,10
    WRITE MSG58              
      
       
    
    ;taking inout the quantity
    
    mov ah,1
    int 21h
    mov ah,0
    SUB al,48
mov CH,0
mov Cl,al
loopH:
inc HUNDRED_COUNT
add totalammount,100
loop loopH
  WRITE MSG59
     
     
     printtotalamount totalammount
  
    
    
    
       
    
    WRITE MSG60
      
      
    
    WRITE MSG61
      
      
    
    WRITE MSG2
      
       
    ;taking decison inout
    mov ah,1
      int 21h          
    SUB al,48
    
    
    
    CMP al,1
    JE START
    ;get order details if exit
    jmp GETORDERDETAILS
    
    JMP EXIT
    
    
    INVALID:
   
    WRITE MSG55
      
       
    
    
    WRITE MSG56 
      
       
    
    
    
    JMP EXIT 


    ;;;;;;;;;;;

     T_HUNDRED:
   
    mov bl,20
    WRITE MSG58              
      
       


    mov ah,1
      int 21h
    mov ah,0
    SUB al,48
mov CH,0
mov Cl,al

loopTH:
inc TWOHUNDRED_COUNT
add totalammount,200
loop loopTH
WRITE MSG59

;rointing total bill yet
mov ax,totalammount
		mov cx,0
		S_break2:
		  mov bl,10
		  div bl
		  mov dx,0
		  mov dl,ah
		  push dx
		  inc cx
		  mov ah,0
		  cmp al,0
		  je S_display2
		  jmp S_break2

		S_display2:
		pop dx
		add dx, 48
		mov ah,02
		int 21h
		loop S_display2





      
    
  
    
      
    WRITE MSG60
      
      
    
    WRITE MSG61
      
      
    
    WRITE MSG2
      
       
    
    mov ah,01h
    int 21h
    SUB al,48
    /
    
    
    CMP al,1
    JE START
    jmp GETORDERDETAILS
    JMP EXIT 
    


THREE_HUNDRED:
   
    mov bl,30
    WRITE MSG58              
      
       
    
    
    
    mov ah,1
      int 21h
    mov ah,0
    SUB al,48

mov CH,0
mov Cl,al

loopTHRH:
inc THIRTYRS
add totalammount,300
loop loopTHRH

WRITE MSG59


mov ax,totalammount
		mov cx,0
		S_break3:
		  mov bl,10
		  div bl
		  mov dx,0
		  mov dl,ah
		  push dx
		  inc cx
		  mov ah,0
		  cmp al,0
		  je S_display3
		  jmp S_break3

		S_display3:
		pop dx
		add dx, 48
		mov ah,02
		int 21h
		loop S_display3
     
    
  
    
    
      
    
    WRITE MSG60
      
      
    
    WRITE MSG61
      
      
    
    WRITE MSG2
      
       
    
    mov ah,1
      int 21h
    SUB al,48
    
    
    
    CMP al,1
    JE START
    jmp GETORDERDETAILS
    JMP EXIT
    
    
GETORDERDETAILS:
  ORDERDETAILS

  UPDATEPASSWORDL:

  WRITE promtENTERNEWPASSWORD
  mov si,offset DEFAULTPASSWORD
  mov cx,5
  lupdatepassword:
  mov ah,01h
  int 21h
  mov ah,0
  ;sub al,48
  mov [si],al
  inc si
  loop lupdatepassword
;WRITE DEFAULTPASSWORD

  WRITE promtPasswordUPDATESUCESSION
  jmp loginagain


 EXIT:

    
    mov ah,4CH
    int 21h

    

    
main ENDP
;description

LINEE PROC
    WRITE MSGR2
    mov ah,9
      int 21h

    ret
LINEE ENDP

space PROC

    WRITE SSE ;NEWLINE
    mov ah,9
      int 21h

    ret
space ENDP
end main