# Lab 1 Report
To connect to the remote ieng6 account, there are 3 main steps.
## Installing VScode
Getting VScode onto your machine is fairly simple. Just download the installer from their [website](https://code.visualstudio.com/) and follow the instructions.
After installing, you should see a screen similar to this:
![VScode](https://drive.google.com/uc?export=view&id=15cWfF2-iYD-AlOu3mg2itCsmFGJ7PDK1)
## Remotely Connecting
To actually connect, we will be using the Bash terminal.
### Getting Bash on Windows
If you are on Windows, you have to install Git from their [website](https://gitforwindows.org/) to get this terminal. After installing Git, you have to open this terminal in VScode. There is a chance that you want to still use your previous terminal so in VScode, hit `Ctrl + \`. Then open the command palet with `Ctrl + Shift + P`. Type in `Select Default Profile` and select `Git Bash`. Now on the terminal, you should have both terminals. As a side note, the down arrow to the right side of the + sign on the upper right side of the terminals tab allows you to open other terminals if they ever disappear. 
### Actually Connecting
Your account can be found on this website:

[https://sdacs.ucsd.edu/~icc/index.php](https://sdacs.ucsd.edu/~icc/index.php)

There should also be a link on that website to set your password. Use this command to connect to your account:
`ssh cs15lwi23{your own letters}@ieng6.ucsd.edu`
It will prompt for the password. Just keep in mind it won't show any feedback when you are typing. Just hit enter when you finish typing your password. Type `yes` when it prompts you if you want to continue connecting. This should never show up again (explanation [here](https://superuser.com/questions/421074/ssh-the-authenticity-of-host-host-cant-be-established/421084#421084)). For me when I connect, I will be using my UCSD account since I am still having issues of setting my password as of the writing of this article.
If everything goes right, you should see a screen like this but your account instead of `vmn004@ieng6.ucsd.edu`:
![Connected](https://drive.google.com/uc?export=view&id=1t6goYyjYodHp1kbO1YKCPwkhzTr5iza_)
## Trying Some Commands
Now that you are connected, you can try some commands. Here are a few:
-   `ls -a`
-   `cd ~`
-   `pwd`
-   `cat /home/linux/ieng6/cs15lwi23/public/hello.txt`
-   `mkdir {name}`
-   `rmdir {name}`

![Commands](https://drive.google.com/uc?export=view&id=1Q7lkLnPCpX_OSXe3pYViZmru3UVhoD47)

You can exit with `exit` or by hitting `Ctrl + D`.
