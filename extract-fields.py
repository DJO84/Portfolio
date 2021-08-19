# Process HTML lines into something more useful
# David Olsen
# 13/08/2021 (Created)
# 18/08/2021 (Last Modified)

from datetime import datetime

# Variables that store the data from each record
date = ""     #Date that vulnerability reported
vulid = ""    #Vulnerability ID number
severity = "" #Severity
desc = ""     #Full description of vulnerability
output = ""   #Lines of processed data
total = 0     #Total number of records, used to add counter to each line in the output

# Variables that count each variable severity as we iterate through the records
crit = 0
high = 0
med = 0
low = 0
unknown = 0

#Open input file readonly and load whole file into memory
inputfile = open ("temp.dat", 'r')
lines = inputfile.readlines()
inputfile.close()

count = 0
for line in lines:
  #increment counter, make sure it's under 6 because input data is in 6 line blocks
  count = count + 1
  if (count > 6):
    count = 1

  #see which line we're up to and process accordingly
  if (count == 2): #this line contains vulnerability id
    start = line.find('>')
    start += 1
    end = line.find('<', start)
    vulid = line[start:end]
    
  elif (count == 3): #this line contains description
    start = line.find('>')
    start += 1
    end = line.find('<', start)
    desc = line[start:end]
    
  elif (count == 4): #this line contains date. Reformats date into YYYY-MM-dd
    start = line.find('>')
    start += 1
    end = line.find(';', start)
    dateTmp = datetime.strptime(line[start:end], '%B %d, %Y') #import websites yucky format
    date = dateTmp.strftime('%Y-%m-%d') #export as a string in a more usable YYYY-MM-dd type format
    
  elif (count == 6): #this line contains severity of vulnerability
    if ('CRITICAL' in line):
      severity = 'CRITICAL'
      crit += 1
    elif ('HIGH' in line):
      severity = 'HIGH'
      high += 1
    elif ('MEDIUM' in line):
      severity = 'MEDIUM'
      med += 1
    elif ('LOW' in line):
      severity = 'LOW'
      low += 1
    else:
      severity = 'UNKNOWN'
      unknown += 1
    
    #end of record. Format, with a row count and pipe separators
    total += 1
    output += str(total) + '|' + date + '|' + vulid + '|' + severity  + '|' + desc + "|\n"
    if (total > 19):
      break
    
# Output graph of records by severity to a file for later use
def get_stars(count):
  result = ""
  for x in range(count):
    result += "*"
  return result

stat_data  = "[Distribution of vulnerabilities by severity]\n\n"
stat_data += "Critical |" + get_stars(crit) + '\n'
stat_data += "    High |" + get_stars(high) + '\n'
stat_data += "  Medium |" + get_stars(med) + '\n'
stat_data += "     Low |" + get_stars(low) + '\n'
stat_data += " Unknown |" + get_stars(unknown) + '\n'
stat_data += "         +----^----^----^\n"
stat_data += "                   1    1\n"
stat_data += "         0    5    0    5\n\n" #Lining up a legend for bottom axis for easier counting

stat_file = open("stats.txt", "w")
stat_file.write(stat_data)
stat_file.close()

# Output all records to standard output
print (output)