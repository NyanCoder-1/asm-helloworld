section .text
    extern GetStdHandle     ; void* GetStdHandle(int nStdHandle)
    extern WriteFile        ; char WriteFile(void* hFile, const void* lpBuffer, int nNumberOfBytesToWrite, _Out_opt_ int* lpNumberOfBytesWritten, _In_out_opt_ OVERLAPPED* lpOverlapped)
    extern ExitProcess      ; void ExitProcess(unsigned int uExitCode)
    global _start

_start:
    sub rsp, 38h

    ; STD_OUTPUT_HANDLE = ((DWORD)-11)
    mov rcx, -11      ;nStdHandle = STD_OUTPUT_HANDLE
    call GetStdHandle

    mov rcx, rax                    ;hFile
    lea rdx, [message]              ;lpBuffer
    lea r8, [message_end-message]   ;nNumberOfBytesToWrite
    xor r9d, r9d                    ;lpNumberOfBytesWritten
    mov qword[rsp+20h], 0           ;lpOverlapped
    call WriteFile

    xor rcx, rcx     ;uExitCode
    call ExitProcess

    xor rax, rax
    add rsp, 38h
    ret

section .rodata
    message: db "Hello, World!!!", 10, 0
    message_end: