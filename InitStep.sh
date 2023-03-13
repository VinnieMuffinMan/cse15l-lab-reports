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