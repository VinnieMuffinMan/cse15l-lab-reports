scp InitStep.sh vmn004@ieng6.ucsd.edu:~/
# Step 1 & 2
ssh vmn004@ieng6.ucsd.edu "bash InitStep.sh"

scp MainSteps.sh vmn004@ieng6.ucsd.edu:~/
# Step 3 & 4
time ssh vmn004@ieng6.ucsd.edu "bash MainSteps.sh"

exit
