# Lab Report 3
The grep command has many useful command-line options to help the user find what they are looking for.

## --only-matching
This command-line option, also `-o`, only prints the matching parts of the words.
### Example 1
```
$ grep -o "q" HistoryDublin.txt | wc
      6       6      12
```
In this example, we are trying to count how many times the character "q" shows up. grep pulls only the exact parts that match the "q" so if we were to just run `grep -o "q" HistoryDublin.txt`, we would see 6 q's printed. We then pipe this into the wc command and count how many of these lines there are.
### Example 2
```
$ grep -o "the" HistoryDublin.txt | wc
    217     217     868
```
In this example, we are trying to count how many times the string "the" shows up. Note that this will count words like "these" or other" since it is just looking for this string. Like the previous example, we used the pipe to count how many of these stings

As you can see from these examples, this command-line option acts like `Ctrl + F` or `Cmd + F` and just looks everywhere for the sting.

## --ignore-case
This command-line option, also `-i` or `-y`, ignores the case of the word
### Example 1

### Example 2

### Example 1
### Example 2

### Example 1
### Example 2
