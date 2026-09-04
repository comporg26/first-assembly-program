# here is your first assembly program template.
# section text means whatever you write there will go to the code section
# of the resulting binary executable.

.section .text

# and this is the program entry point. global means sort of public.
# and whatever is marked as _start, it labels the entry point.
.global _start

_start:

    mov $40,  %rbx   # copies number 40 to the register RBX

	  # now you know how to copy constant numbers to registers
		# copy number 2 to the register RSI

		# here, go on:

		...............

		# now can you guess how to add whatever is in RBX to
		# whatever is in RSI?

		add .....  #  <--- yes, write here something. after "add" (:

		# now our program should exit. to exit we must do a system call.
		# we are not allowed to exit without it. you can try, it won't harm.
		# when we call a system call, syscall number should be in RAX.
		# syscall numbers are here: https://hackeradam.com/x86-64-linux-syscalls/
		# look for exit syscall number.

		mov ........   # what do you move to which register?

		# and RDI should contain the number we have calculated.
		# now copy that result to RDI:

		mov ............  # <--- yes, here

    # and now finally, drum roll: the interrupt! the instruction is just

		syscall

		# that's it. now follow the readme on how to compile, run and test it.
