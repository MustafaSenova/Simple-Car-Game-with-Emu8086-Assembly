; use 'a' and 'd' keys to move the car


#make_COM#

; COM file is loaded at CS:0100h
ORG 100h
.data
obstaclePos1 Dw 660
obstaclePos2 Dw 672
obstaclePos3 DW 20
obstaclePos4 DW 32


.code
main Proc
	
	mov ax,0b800h
	mov ds,ax
	
		
	jmp drawLine
	drawLine:
		leftLine:
			mov si,15
			loop1:
				mov [si],124
				add si,160
				cmp si,3855
				jle loop1
		midLine:
			mov si,26
			loop2:
				mov [si],124
				add si,320
				cmp si,3866
				jle loop2
		rightLine:
			mov si,39
			loop3:
				mov [si],124
				add si,160
				cmp si,3879
				jle loop3
				mov [3540],'#'
				jmp main_loop				
	
	main_loop:
		mov ax,0b800h
		mov ds,ax
		
		mov ah,00h
		int 16h
		cmp al,1Bh
		je exit
		cmp al,64h
		je moveRight
		cmp al,61h
		je moveLeft
		
	exit:
		mov ah,4Ch
		mov al,0
		int 21h
		
	moveRight:
		cmp [3552],'#'
		je generateObstacle
		mov [3540],' '
		mov [3552],'#'
		jmp generateObstacle
	moveLeft:
		cmp [3540],'#'
		je generateObstacle
		mov [3552],' '
		mov [3540],'#'
		jmp generateObstacle	
		
	generateObstacle:
		mov ax,@data
		mov ds,ax
		
		MOV AH, 00h         
   		INT 1AH      

   		mov  ax, dx
   		xor  dx, dx
   		mov  cx, 3    
   		div  cx       
		add  dl, '1'
		cmp dl,50
		je obstacle2
		cmp dl,49
		je obstacle1
	obstacle1:
		mov ax,@data
		mov ds,ax
		mov bx,obstaclePos1
		cmp bx,4180
		je obstacleRes1
		add obstaclePos1,320
		mov ax,0b800h
		mov ds,ax
		mov si,bx
		sub si,320
		mov [si],' '
		add si,320
		mov [si],64
		cmp si,1940
		jg obstacle3
		jmp main_loop
	obstacleRes1:
		mov obstaclePos1,660
		mov ax,0b800h
		mov ds,ax
		mov si,bx
		sub si,320
		mov [si],' '
		add si,320
		jmp main_loop	
	obstacle2:
		mov ax,@data
		mov ds,ax
		mov bx,obstaclePos2
		cmp bx,4192
		je obstacleRes2
		add obstaclePos2,320
		mov ax,0b800h
		mov ds,ax
		mov si,bx
		sub si,320
		mov [si],' '
		add si,320
		mov [si],64
		cmp si,1940
		jg obstacle4
		jmp main_loop
	obstacleRes2:
		mov obstaclePos2,672
		mov ax,0b800h
		mov ds,ax
		mov si,bx
		sub si,320
		mov [si],' '
		add si,320
		jmp main_loop	
	obstacle3:
		mov ax,@data
		mov ds,ax
		mov bx,obstaclePos3
		cmp bx,4180
		je obstacleRes3
		add obstaclePos3,320
		mov ax,0b800h
		mov ds,ax
		mov si,bx
		sub si,320
		mov [si],' '
		add si,320
		mov [si],64
		jmp main_loop
		
	obstacleRes3:
		mov obstaclePos3,20
		mov ax,0b800h
		mov ds,ax
		mov si,bx
		sub si,320
		mov [si],' '
		add si,320
		jmp main_loop	
	obstacle4:
		mov ax,@data
		mov ds,ax
		mov bx,obstaclePos4
		cmp bx,4192
		je obstacleRes4
		add obstaclePos4,320
		mov ax,0b800h
		mov ds,ax
		mov si,bx
		sub si,320
		mov [si],' '
		add si,320
		mov [si],64
		jmp main_loop
		
	obstacleRes4:
		mov obstaclePos4,32
		mov ax,0b800h
		mov ds,ax
		mov si,bx
		sub si,320
		mov [si],' '
		add si,320
		jmp main_loop			
		
				
				
main Endp