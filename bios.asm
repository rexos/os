	;; 0x10 screen call interrupt
	;; times fills padding with 0s
	;; 0xaa55 BIOS terminator
[org 0x7c00]			;the boot loader will be loaded at address 0x7c00

mov bp, 0x8000
mov sp, bp

push '!'
push 't'
push 'o'
push 'o'
push 'B'
	
mov ah, 0x0e	;; 0x0e BIOS teletype routine

	
print:
	pop bx
	cmp bl, 0
	je end
	mov al, bl
	int 0x10
	jmp print
end:	
	jmp $	
	times 510-( $ - $$ ) db 0
	dw 0xaa55	