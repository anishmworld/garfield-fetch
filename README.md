# garfield-fetch
## This thingummy has two parts:
1. Powershell script to fetch garfield strips between dates and stores them in the folder it is launched in; And
2. A batch file launcher which hides the entrails and allows to set dates
## There are two main ways to use this:
Put the files in the folder you want the strips to be downloaded in.
1. You can use 'garfield-ext.bat', which, when run, will ask for the `Start Date` and `End Date`. The date input format is **YYYY-MM-DD**. Thus `21st March, 2017` will be `2017-03-21`. **This is recommended for most people.**
2. You can use 'garfield-int.bat', which has the `Start Date` and `End Date` defined within the file. Open the file in your favorite text editor and change the dates as you want before you run.
The oldest Garfield strip is on 19th June, 1978. Any dates before that wont work.
