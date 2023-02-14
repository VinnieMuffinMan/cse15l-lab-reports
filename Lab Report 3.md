# Lab Report 3
The grep command has many useful command-line options to help the user find what they are looking for. All of these come from the [GNU Grep Manual](https://www.gnu.org/software/grep/manual/grep.html).

## --only-matching
This command-line option, also `-o`, only prints the matching parts of the words. Here are examples of a few.
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
In this example, we are trying to count how many times the string "the" shows up. Note that this will count words like "these" or other" since it is just looking for this string. Like the previous example, we used the pipe to count how many of these stings there are.

As you can see from these examples, this command-line option is useful for counting occurrences of something since you can pipe the sterilized strings into wc and have it count the number of words for you.

## --ignore-case
This command-line option, also `-i` or `-y`, ignores capitals when searching
### Example 1
```
$ grep -o -i "q" HistoryDublin.txt | wc
      7       7      14
```
In this example, we are trying to find all occurrences of the letter q, both upper and lower case. We are able to see that before, when we were counting the number of q's, we missed a capital one. 
### Example 2
```
$ grep -o -i "the" HistoryDublin.txt | wc
    255     255    1020
```
In this example, we are not only looking for the string "the", we also accommodate for any capitalization in the word. Before if it started with a capital "t", we wouldn't count it but now we do, hence the larger word count.

As you can see from these examples, combining the `-o` and `-i` flags then piping it into wc lets you count words like how `Ctrl + F` or `Cmd + F` works and just looks everywhere for the string without regard for case.

## --word-regexp
This command-line option, also `-w`, only looks for whole words matching the string.
### Example 1
```
$ grep -o -i -w "a" HistoryDublin.txt | wc
     54      54     108
```
In this example, we are searching for how many times the word 'a' is used rather than how many times the letter 'a' shows up.
### Example 2
```
$ grep -o -i -w "the" HistoryDublin.txt | wc
    200     200     800
```
We can now see that there are only 200 words in this file that matches the exact word "the", both upper and lower case. Any words that only contain the string "the" but aren't the full word are excluded.

As you can see from these examples, these three flag together can help you find how many of a specific word is in the file.

## --line-number
This command-line option, also `-n`, displays the line where the matches are found.
### Example 1
```
$ grep -n "place" HistoryDublin.txt
222:        erected in their place that are not admired today. However, Ireland has
```
In this example, we can see that the line that matches "place" is line 222 and we can now more easily find it in the file.
### Example 2
```
$ grep -n "Europe" HistoryDublin.txt
25:        Christianity and a Mission to Europe
41:        scholars out all over Europe. The importance of this phase of Irish
44:        base developed differently from the emerging Christian world in Europe
138:        Europe and England; the Georgian squares like Merrion Square in south
223:        always looked to Europe for friendship and support, and gradually it
224:        began to define itself as a European nation. It joined the European
233:        designated a European City of Culture. As capital of Europe’s fastest
235:        European city.
```
This can also be used with multiple occurrences to find the lines that matches this string. 


