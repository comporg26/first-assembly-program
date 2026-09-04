Hi there.

Today we are going to write some short and simple assembly code, which only adds two numbers and exits passing as exit status the result of the addition.

Open the source code. I would say - with vim.
Yes, read vimtutor.
If you don't want to get the power at your fingertips, you can use nano editor.

so:

```
vim first.s
```

That's preferrable. Otherwise, okay, okay, get it, but it is not the most powerful, or flexible editor:

```
nano first.s
```

Then you'll have the source code.
Edit the file, save.
You should know for now how to save in vim. In nano, there are hints at the bottom of the screen. And there ^ sign means ctrl key.

Ok, you have edited it. Try to build it now.

Build process is in 2 steps.

First, you convert assembly file with extension .s to object file with extension .o

Next, you link obect file with extension .o into the binary executable.

Here's how you do it:

```
as -o something.o first.s
```

That will create a file something.o. Or assembler (as) will give you an error.

Next, link:

```
ld -o test.exe something.o
```

You see, I have intentionally used different names.
It is to show you that you are choosing the names. It would make sense, however, to follow some convention like this:

```
as -o first.o first.s
ld -o first first.o
```

That would be much better.

Now, let's hope the program `first` was built.
Then what you have to do, is to execute it.
In order to run a program from a current directory, you run it like this:

```
./first
```

Assuming the file name is `first` of course.

And after you ran it, you can now read the exit status of the program:

```
echo $?
```

Does it say `42` ?

Then that's it! You have completed your first lab! You have added 2 numbers, and was able to somehow be able to see the result. As a program exit status!

ACHTUNG!
DO NOT ADD binaries to the git repo.
Do git status
see which files have been changed.
DO NOT DO `git add *`
Instead you can do:

```
git commit -a -m "some message that you want to write as a commit message"
```

that message will appear in commit history.
that can be "add two numbers"
or "another attempt at adding two numbers"

Now do git log.
See history of commits?

Now do git push.

