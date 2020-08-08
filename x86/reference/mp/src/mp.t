#START _litmus_P1
	movl (%r8,%rdx),%eax
	movl (%rdi,%rdx),%ecx
#START _litmus_P0
	movl $1,(%rax,%rcx)
	movl $1,(%rdx,%rcx)
