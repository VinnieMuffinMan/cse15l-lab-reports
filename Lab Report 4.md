# Lab Report 4
This lab was meant to practice how to use things like tab and up arrows to help speed up things in bash. This is how I went about it step by step on my Windows machine.

## Step 1 - (Setup) Delete any existing forks of the repository you have on your account
![Step 1](https://drive.google.com/uc?export=view&id=1lfKDvjcQoo6wHiW8tkJLce8irQfCZfZl)

In this step, I just went into settings and scrolled all the way down. At the bottom, there is a `Delete this repository` button. I just clicked on it and typed in confirmation that it prompted me with and hit the big red button.

## Step 2 - (Setup) Fork the repository
![Step 2](https://drive.google.com/uc?export=view&id=18lHcAu_9evgE9q9ABz0W4qOHJYkZQtv8)

In this step, I just hit the fork button in the upper right corner of the GitHub website and made a fork.

## Step 3 - (The real deal) Start the timer!
![Step 3](https://drive.google.com/uc?export=view&id=1p1dkEyQrZukqA0LMaon3me44wNUHxhL5)

Here I started the timer on my phone.

## Step 4 - Log into ieng6
![Step 4](https://drive.google.com/uc?export=view&id=1VAdGZtV6RHgMpOB_MkNeQ7ZGPI4qAYfi)

Keys pressed: `ssh vmn004@ieng6.ucsd.edu<Enter>`

To log into ieng6, I used the ssh command with my account name on my own bash terminal.

## Step 5 - Clone your fork of the repository from your GitHub account
![Step 5](https://drive.google.com/uc?export=view&id=1cpAE92NxWBXk5vz2m1a5Jbqsa0w9FBmH)

Keys pressed: `git clone <RMB><Enter>`

To clone the fork, I first copied the ssh link on GitHub then went back to my Git Bash terminal to type the `git clone` command and paste using the right click and hitting enter to run it.

## Step 6 - Run the tests, demonstrating that they fail
![Step 6](https://drive.google.com/uc?export=view&id=1L3l-oUWtYgE2nOlwcrnk7_Qg2xp7yiXH)

Keys pressed: `cd l<Tab><Enter><Ctrl+R>javac<Enter><Ctrl+R>java <Enter>`

Now to run the tests, I first cd into the directory using ls and tab to autofill the name after l. Then I used the search feature to find my previous javac command. After that I used the search feature to find my java command. Note that I typed a space after java to get java not javac. 

## Step 7 - Edit the code file to fix the failing test
![Step 7](https://drive.google.com/uc?export=view&id=1bUJXhZVy6jpowEyV78MR-wDh2xcXwKIN)

Keys pressed: `nano L<Tab>.j<Tab><Enter>`

`<Ctrl+W>2 <<Enter><Ctrl+W><Enter><Down><Down><Left><Left><Left>`

`<Backspace>2<Ctrl+O><Enter><Ctrl+X>`

I first used nano and a few tab completes to get into the nano text editor. Since the class file also exists, I had to type in .j and tab again to get the right file for the nano editor. Afterwards, I used the search command and the quarry `2 <` twice to get as close as I can to the right place. Then I used the arrow keys to get to the place where the bug is and fixed it. Then I saved the file with `Ctrl+O`
 and exited with `Ctrl+X`.

## Step 8 - Run the tests, demonstrating that they now succeed
![Step 8](https://drive.google.com/uc?export=view&id=1CIdxA7oEdCN4puB_ACOvVlcKpCavdUnT)

Keys pressed: `<Up><Up><Up><Enter><Up><Up><Up><Enter>`

I used the command history to get the javac and java commands and ran them.

## Step 9 - Commit and push the resulting change to your GitHub account
![Step 9](https://drive.google.com/uc?export=view&id=13OXnXXte2R0nhYKRLfwkKYahP4ZERts1)

Keys pressed: `git add L<Tab>.j<Tab><Enter>git commit -m 'Fixed'<Enter>git push<Enter>`

I again used the tab to finish the ListExamples.java file. I then used the git commit command with the `-m` argument to insert my comment at the same time. I finally pushed with the git push command.