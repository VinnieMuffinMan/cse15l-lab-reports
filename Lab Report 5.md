# Lab Report 4
This report will look at using a Bash script to automate the entirety of the CLDQ. The main script is shown below and consists of 2 parts, the initialization step and then the main task, both of which copy and run a script on the remote server.

### CLDQ.sh
```bash
scp InitStep.sh vmn004@ieng6.ucsd.edu:~/
# Step 1 & 2
ssh vmn004@ieng6.ucsd.edu "bash InitStep.sh"

scp MainSteps.sh vmn004@ieng6.ucsd.edu:~/
# Step 3 & 4
time ssh vmn004@ieng6.ucsd.edu "bash MainSteps.sh"

exit
```

## Step 1 & 2 - (Setup) Delete any existing forks of the repository you have on your account/Fork the repository
### InitStep.sh
```bash
if [[ -d 'lab7' ]] # check if lab7 directory exists
then
    rm -rf lab7
fi

git clone git@github.com:VinnieMuffinMan/lab7.git
cd lab7
# replace the ListExamples.java file with the original
curl -o ListExamples.java https://raw.githubusercontent.com/ucsd-cse15l-w23/lab7/main/ListExamples.java
# add and commit the original ListExamples.java file
git add ListExamples.java
git commit -m "Revert to original ListExamples.java"
git push
cd ..

# clean up
rm -rf lab7
rm "$0"
exit
```

In this initialization step, my script used scp to copy the InitStep script onto the remote server and run it. This script is meant to act like me resetting my fork of the original code. It does this by first cleaning any previous lab7 directories before cloning my repository. Then it downloads the original Java file using curl and then pushes that onto my fork with git commands. It then removes the directory and then the script itself.

## Step 3 - 9 The Main Script
### Step 3 & 4 - (The real deal) Start the timer!/Log into ieng6
Step 3 is done using the time command. The timer starts when I attempt to run the MainSteps.sh script on the remote server using the ssh command which is step 4.

### Step 5 - Clone your fork of the repository from your GitHub account
```bash
# Step 5
git clone git@github.com:VinnieMuffinMan/lab7.git
```
![Step 5](https://drive.google.com/uc?export=view&id=1iAIn-AQmiK7qudhFBzqPeg_tgYSS4Pi7)

Step 5 is done using the git clone command and the ssh address of the fork.

### Step 6 - Run the tests, demonstrating that they fail
```bash
# Step 6
cd lab7
javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java
java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore ListExamplesTests
```
![Step 6](https://drive.google.com/uc?export=view&id=1ShCwtEJa9xx6yL8x91JHK0ATe23GWCms)

Step 6 is done by moving into the lab7 directory and then compiling and running the tests to show that they fail.

### Step 7 - Edit the code file to fix the failing test
```bash
# Step 7
sed -i '43s/1/2/' ListExamples.java
```

Step 7 is done by using the sed command to replace the 1 with a 2 on line 43 of the ListExamples.java file. Let's break down this command. The -i flag is used to edit the file in place. The 43s/1/2/ part tells the command to go to line 43, where the bug is. The s is the substitute command and the /1/2/ part tells the command to replace the 1 with a 2. The / is used to separate the different search and replace terms. The last part of the command is the file name.

### Step 8 - Run the tests, demonstrating that they now succeed
```bash
# Step 8
javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java
java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore ListExamplesTests
```
![Step 8](https://drive.google.com/uc?export=view&id=1A5ixMfvWw_FNHV2mtgG69D_XgRfpd9Xg)

Step 8 is done by compiling and running the tests again to show that they now pass.

### Step 9 - Commit and push the resulting change to your GitHub account
```bash
# Step 9
git add ListExamples.java
git commit -m "Fixed bug in ListExamples.java"
git push

cd ~
rm "$0"
exit
```
![Step 9](https://drive.google.com/uc?export=view&id=13eqsXrm9FMinXSEK5iyLDayWhwhQtodK)

Step 9 is done by adding the file to git, committing, and pushing the changes. There is an extra part here to remove the script from the remote server as a final cleanup step.

## Final Time
![Final Time](https://drive.google.com/uc?export=view&id=1TLwDkdah5hXecQgL6kEHvVS5GoJMfh8k)

When I did this task for the previous report, I was able to get it down to about 20-30 seconds. Even with a text file up having all of the commands that I would need to run, I was still only able to get it down to about 15 seconds. Using this script, I was able to get it down to under 6 seconds. While an 8 second difference may not seem like much, it is over a 60% improvement. Imagine if there was a longer task or if someone who didn't have practice with these specific commands was trying to do this. This script would greatly improve how quickly they could get the task done and they would only need to run one command.