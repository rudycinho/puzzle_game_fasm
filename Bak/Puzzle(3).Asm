format PE GUI 4.0
entry inicio

include 'Win32a.inc'

ventana_1		equ		1
salir_btn		equ		1000
crear_btn		equ		1001
destruir_btn 	equ		1002

img_11_btn  	equ		2001
img_12_btn  	equ		2002
img_13_btn		equ		2003
img_21_btn		equ		2004
img_22_btn  	equ		2005
img_23_btn  	equ		2006
img_31_btn  	equ		2007
img_32_btn 	 	equ		2008
img_33_btn  	equ		2009

section '.data' data readable writeable

Ist  		dd 0
pWnd 		dd 0

clase_boton db 'BUTTON',0

;img_11_btn  dd 2001
;img_12_btn  dd 2002
;img_13_btn  dd 2003
;img_21_btn  dd 2004
;img_22_btn  dd 2005
;img_23_btn  dd 2006
;img_31_btn  dd 2007
;img_32_btn  dd 2008
;img_33_btn  dd 2009
 
section '.code' code readable executable

inicio:
	invoke GetModuleHandle,0
	mov [Ist],eax
	invoke DialogBoxParam,eax,ventana_1,0,DlgProc,0 
fin: 
	invoke ExitProcess,0

proc DlgProc,hWnd,uMsg,wParam,lParam
	push edi esi ebx
	
	mov eax,[uMsg]
	cmp	eax,WM_COMMAND
	je	jCOMMAND
	cmp	eax,WM_INITDIALOG
	je	jINITDIALOG
	cmp	eax,WM_CLOSE
	je	jCLOSE
	xor eax,eax
	jmp finish

jINITDIALOG:
	mov eax,[hWnd]
	mov [pWnd],eax
	
	
	
	mov eax,1
	jmp finish
	
jCOMMAND:
	mov eax,[wParam]
	cmp	eax,salir_btn
	je	salir
	cmp	eax,crear_btn
	je	crear
	cmp	eax,destruir_btn
	je	destruir
	cmp	eax,img_11_btn
	je	salir
	
	xor eax,eax
	jmp finish
	
salir:
	invoke SendMessage,[hWnd],WM_CLOSE,0,0
	mov eax,1
	jmp finish
	
init_buttons:
	invoke CreateWindowEx,0x00000000,clase_boton,0,0x50010080,0,0,30,30,[pWnd],img_11_btn,[Ist],0
	invoke CreateWindowEx,0x00000000,clase_boton,0,0x50010080,30,0,30,30,[pWnd],img_12_btn,[Ist],0
	invoke CreateWindowEx,0x00000000,clase_boton,0,0x50010080,60,0,30,30,[pWnd],img_13_btn,[Ist],0
	
	invoke CreateWindowEx,0x00000000,clase_boton,0,0x50010080,0,30,30,30,[pWnd],img_21_btn,[Ist],0
	invoke CreateWindowEx,0x00000000,clase_boton,0,0x50010080,30,30,30,30,[pWnd],img_22_btn,[Ist],0
	invoke CreateWindowEx,0x00000000,clase_boton,0,0x50010080,60,30,30,30,[pWnd],img_23_btn,[Ist],0
	
	invoke CreateWindowEx,0x00000000,clase_boton,0,0x50010080,0,60,30,30,[pWnd],img_31_btn,[Ist],0
	invoke CreateWindowEx,0x00000000,clase_boton,0,0x50010080,30,60,30,30,[pWnd],img_32_btn,[Ist],0
	invoke CreateWindowEx,0x00000000,clase_boton,0,0x50010080,60,60,30,30,[pWnd],img_33_btn,[Ist],0
	
	mov eax,1
	jmp finish

crear:
	invoke CreateWindowEx,0x00000000,clase_boton,0,0x50010080,0,0,30,30,[pWnd],img_11_btn,[Ist],0
	invoke CreateWindowEx,0x00000000,clase_boton,0,0x50010080,30,0,30,30,[pWnd],img_12_btn,[Ist],0
	invoke CreateWindowEx,0x00000000,clase_boton,0,0x50010080,60,0,30,30,[pWnd],img_13_btn,[Ist],0
	
	invoke CreateWindowEx,0x00000000,clase_boton,0,0x50010080,0,30,30,30,[pWnd],img_21_btn,[Ist],0
	invoke CreateWindowEx,0x00000000,clase_boton,0,0x50010080,30,30,30,30,[pWnd],img_22_btn,[Ist],0
	invoke CreateWindowEx,0x00000000,clase_boton,0,0x50010080,60,30,30,30,[pWnd],img_23_btn,[Ist],0
	
	invoke CreateWindowEx,0x00000000,clase_boton,0,0x50010080,0,60,30,30,[pWnd],img_31_btn,[Ist],0
	invoke CreateWindowEx,0x00000000,clase_boton,0,0x50010080,30,60,30,30,[pWnd],img_32_btn,[Ist],0
	invoke CreateWindowEx,0x00000000,clase_boton,0,0x50010080,60,60,30,30,[pWnd],img_33_btn,[Ist],0
	
	mov eax,1
	jmp finish

destruir:
	local b1:DWORD,b2:DWORD
	
	invoke GetDlgItem,[pWnd],img_11_btn
	mov [b1],eax
	invoke EnableWindow,[b1],FALSE
	
	;invoke GetDlgItem,[pWnd],img_11_btn
	;mov [b1],eax
	invoke ShowWindow,[b1],SW_HIDE

;	;invoke ShowWindow,[pWnd],SW_HIDE
;	invoke CreateWindowEx,0x00000000,clase_boton,0,0x50010080,100,0,30,30,[pWnd],img_11_btn,[Ist],0
;	invoke CreateWindowEx,0x00000000,clase_boton,0,0x08010080,130,0,30,30,[pWnd],img_12_btn,[Ist],0
;	invoke CreateWindowEx,0x00000000,clase_boton,0,0x50000000,160,0,30,30,[pWnd],img_13_btn,[Ist],0
;	
;	invoke CreateWindowEx,0x00000000,clase_boton,0,0x58010080,100,30,30,30,[pWnd],img_21_btn,[Ist],0
;	invoke CreateWindowEx,0x00000000,clase_boton,0,0x48010080,130,30,30,30,[pWnd],img_22_btn,[Ist],0
;	invoke CreateWindowEx,0x00000000,clase_boton,0,0x48010080,160,30,30,30,[pWnd],img_23_btn,[Ist],0
;	
;	invoke CreateWindowEx,0x00000000,clase_boton,0,0x48010080,100,60,30,30,[pWnd],img_31_btn,[Ist],0
;	invoke CreateWindowEx,0x00000000,clase_boton,0,0x48010080,130,60,30,30,[pWnd],img_32_btn,[Ist],0
;	invoke CreateWindowEx,0x00000000,clase_boton,0,0x48010080,160,60,30,30,[pWnd],img_33_btn,[Ist],0
	
	mov eax,1
	jmp finish
	
	mov eax,1
	jmp finish
	
jCLOSE:	
	invoke EndDialog,[hWnd],0
	mov eax,1
	
finish:
	pop ebx esi edi
	ret
endp

section '.idata' import data readable writeable
  ;otra forma para importar los procedimientos importando archivos INC
  library kernel32,'KERNEL32.DLL',user32,'USER32.DLL',gdi32,'GDI32.DLL'
  include 'api\kernel32.inc'
  include 'api\user32.inc'
  include 'api\gdi32.inc'

section '.rsrc' resource data readable
;especificamos todos los recursos
directory	RT_DIALOG,dialogs 
  ;especificaciones de la ventana 1 con sus respectivos items (botones,campo de texto)
  resource dialogs,ventana_1,LANG_ENGLISH+SUBLANG_DEFAULT,main_v
  dialog main_v,'Ventana 1',6,6,194,106,WS_OVERLAPPEDWINDOW + WS_VISIBLE + DS_CENTER,0x00000000
	dialogitem "Button","Salir",salir_btn,130,84,50,13,WS_CHILD + WS_TABSTOP + WS_VISIBLE,0x00000000
	dialogitem "Button","Destruir",destruir_btn,80,84,50,13,WS_CHILD + WS_TABSTOP + WS_VISIBLE,0x00000000
	dialogitem "Button","Crear",crear_btn,30,84,50,13,WS_CHILD + WS_TABSTOP + WS_VISIBLE,0x00000000
  enddialog
