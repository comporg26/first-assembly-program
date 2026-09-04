Hi there.

Today we are going to write some short and simple assembly code, which only adds two numbers and exits passing as exit status the result of the addition.

But first let's familiarize you with Unix environment.

# Navigation, running programs.

So, assuming you already logged in to the server, what you see is your shell's prompt. It looks like ```username@the:~$```

`the` is the hostname. full hostname is `the.hell.am`.
username is your username.
`~` is your current directory. `~` (tilda sign) always means your home directory.

`$` sign in shell prompt by convention (but that's convention, you can replace it with anything) means you are user, you have user privileges now. Not administrator (root) privileges.

Any time you want to go to your home directory, you can do

```
cd ~
```

let's try.

```
cd /
```

now you're in the upper directory. you can't go further up. It is called root directory. Because all other directories start here. Like the root of the tree.

Do

```
pwd
```

This shows your current directory.

```
ls
```

See?

Now do

```
ls -al
```

Now let's go back to your home directory. Remember tilda sign?

```
cd ~
```

and then again check what is your current directory.

```
pwd
```

That's your current directory. You are back home.

Now do

```
ls -al
```

You see, this is list of files.
And the list starts with `.` and `..`.

If you look in any directory, those files exist.

One dot means pointer to current directory.
Two dots mean pointer to the directory one level up.

Do

```
cd ..
```

then

```
pwd
```

See?

Now do

```
cd -
```

```
pwd
```

How did `cd` know where to return?

It looked in the list of environment variables.
Environment variables are your shell variables. Remember I said you are working in the shell?

Shell writes you a 'prompt' - that line with `$` sign, where you type your command.
Then it interprets what you have been written.

If you have been written `ls -al` then it calls the program `ls` and passes it `-al` arguments.

Where is the program `ls` located?

To find out, do

```
which ls
```

Now where did `which` command find out where to search for `ls` command?

Try to search for other commands. Commands as a rule just programs that are installed in your operating system.

```
which vim
```

Ok now type
```
env
```

Those are your environment variables currently.

Look, there is environment variable `OLDPWD` and environment variable `PATH`.

First always shows your previous (old) directory.
That's why `cd -` knows where to return. It reads form OLDPWD environment variable.

Do

```
echo $OLDPWD
```

And you'll read the variable.
Whenever you put $ sign in the beginning of the variable, you're reading from it.

And btw, not that i love this shell syntax. I have my problems with it.
But it is what it is.

And PATH contains directory paths, in those the shell will look for a program (command) you typed to execute it.

```
echo $PATH
```

If it's not found in the path, you'll get a message about it.

Now, let's run program that is called `true`.

```
which true
```

See it is located in `/bin/true`

Now run it:

```
true
```

And after it, lets read its exit status. It always returns 0.

```
echo $?
```

There is also program `false`.
Run it:

```
false
```

and then

```
echo $?
```

See?

# Actual work

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

