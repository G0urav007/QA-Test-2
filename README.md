# QA-Test-2
Log File Analyzer:
Create a script that analyzes web server logs  for
common patterns such as the number of 404 errors, the most requested
pages, or IP addresses with the most requests. The script should output a
summarized report.
 
 #  Explanation

   01 Usage Check: The script first checks if a log file is provided as an argument. If not, it prints the usage and exits.

   02 Log File Existence Check: It checks if the provided log file exists. If not, it prints an error message and exits.

   03 Report File: A report file is created with a timestamp in its name.

   04 Number of 404 Errors: It uses grep to find lines containing " 404 " and counts them using wc -l.

   05 Most Requested Pages: It extracts the requested page paths (7th field in the log format), sorts them, counts unique occurrences, sorts them in descending order, and prints the top 10.

   06 IP Addresses with the Most Requests: It extracts the IP addresses (1st field in the log format), sorts them, counts unique occurrences, sorts them in descending order, and prints the top 10.

   07 Top User Agents: It extracts the user agent strings (6th field in the log format when split by double quotes), sorts them, counts unique occurrences, sorts them in descending order, and prints the top 10.

   08 Report Output: The report is printed to the console and saved in the report file.
