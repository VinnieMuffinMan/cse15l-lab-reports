# Step 5
git clone git@github.com:VinnieMuffinMan/lab7.git

# Step 6
cd lab7
javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java
java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore ListExamplesTests

# Step 7
sed -i '43s/1/2/' ListExamples.java

# Step 8
javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java
java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore ListExamplesTests

# Step 9
git add ListExamples.java
git commit -m "Fixed bug in ListExamples.java"
git push

cd ~
rm "$0"
exit
