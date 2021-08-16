#Assignment 13 

#**PART 1**

myList1 = [1,2,3,4,5,6,7,8]
print(myList1)

myList2 = (myList1[1:8])
print(myList2)
myList2.append(13)
print(myList2)
myList2.pop(3)

myList3 = myList2 
print(myList3) 

#**PART 2**

#count(sub,[start,[end]]) - method returns the number of occurrences of a substring in the given string.
# define string
string = "Videogames are very fun"
substring = "e"

count = string.count(substring, 15, 23) #this is counting from string #15 to #23 which only has 1 occurance of the letter 'e' which is string #16
print("The count is:", count)

#-------------------------------------------------

#endswith(suffix,[start,[end]]) - returns True if the string ends with the specified suffix, otherwise return False.
beach = "I love the beach"

# start parameter: 2
# "I love the beach" string is searched
result = beach.endswith('love the beach', 2)
print(result)

result = beach.endswith('the beach', 9, 19) #returns false because the string values are incorrect, for true value they should be <=7,>=16
print(result)

result = beach.endswith('love the beach', 1, 16)
# returns True because 'love the beach' are string values 2-15 so if you put <=2 and =>16 it's true
print(result)


#-------------------------------------------------

#find/index(sub,[start,[end]]) - method returns the index of a substring inside the string (if found). If the substring is not found, it raises an exception.
statement = 'Going to the park tomorrow'

result = statement.index('ark')
print("Substring 'ark':", result) #should return 14 - it's counting every single letter and whitespace from 0 to whatever value
#G is 0, a is #14 in the statement.

#result = statement.index('forest')
#print("Substring 'forest':", result)#Should show error, due to there not being a 'forest' in the string statement

#-------------------------------------------------

#isalnum() -  True if all characters in the string are alphanumeric (either alphabets or numbers). If not, it returns False.
name1 = "John Doe"
print(name1.isalnum()) #returns false due to the whitespace between john and doe.

#-------------------------------------------------

#isalpha() - method returns True if all the characters are alphabet letters (a-z).
var1 = "Company"
x = var1.isalpha()
print(x) # should print out True since they are all alphabetical letters

#-------------------------------------------------

#isdigit() - The isdigit() method returns True if all the characters are digits, otherwise False.
var2 = "12B44"
z = var2.isdigit()
print(z) # Should return false since there's a letter in var2

#-------------------------------------------------

#islower() - The islower() method returns True if all the characters are in lower case, otherwise False.
text4 = "is this in lower case"
j = text4.islower() #should return true becuase they are all in lower-case
print(j)

#-------------------------------------------------

#isspace() - The isspace() method returns True if all the characters in a string are whitespaces, otherwise False.
var22 = "   "
b = var22.isspace()
print(b) # Should print true due to there only being white space

#-------------------------------------------------

#istitle() - The istitle() method returns True if all words in a text start with a upper case letter, AND the rest of the word are lower case letters, otherwise False.
text = "Good Morning Fellow Students"
v = text.istitle()
print(v) #should return true

#-------------------------------------------------

#isupper()- The isupper() method returns True if all the characters are in upper case, otherwise False.
text = "ALL UPPERCASE "
g = text.isupper()
print(g) #should return true

#-------------------------------------------------

#join() - The join() method takes all items in an iterable and joins them into one string.
myExample = ("Lisa", "Arin", "Macey", "Jiho")
h = "-".join(myExample) #this prints the space between the lines, can replace it with " "
print(h)

#-------------------------------------------------

#lower() - The lower() method returns a string where all characters are lower case.
text = "GOOD AFTERNOON EVERYBODY"
x = text.lower()
print(x) #should print text all lower-cased

#-------------------------------------------------

#replace(old,new[,count]) - method replaces each matching occurrence of the old character/text in the string with the new character/text.
song = 'cold, cold heart'
# replacing 'cold' with 'red'
print(song.replace('cold', 'red'))
song = "It's storming, it's pouring, it's storming, it's pouring, it's storming, it's pouring"
# replacing only two occurences of 'storming'
print(song.replace('storming', "raining", 2))

#-------------------------------------------------

#split([sep[,maxsplit]]) - The split() method breaks up a string at the specified separator and returns a list of strings.
watercompanies = 'Poland Spring: Dasani: Nestle: Fiji'
# splits at ':'
print(watercompanies.split(':')) # should print ['Poland Spring', ' Dasani', ' Nestle', ' Fiji']

#-------------------------------------------------

#splitlines([keepends]) - The splitlines() method splits the string at line breaks and returns a list of lines in the string.
h2ocompanies = 'Poland\nDasani\r\nNestle\rFiji'
print(h2ocompanies.splitlines())
print(h2ocompanies.splitlines(True)) #This can make a new line for a list

#-------------------------------------------------

#startswith(prefix[,start[,end]])-  method returns True if a string starts with the specified prefix(string). If not, it returns False
text = "Python is easy to learn."
result = text.startswith('is easy') #Should return false, will return true if you begin with Python is easy...
print(result)

#-------------------------------------------------

#strip([chars]) -  returns a copy of the string by removing both the leading and the trailing characters (based on the string argument passed).
string = '  all this extra whitespace   ' #removes excess whitespace
print(string.strip())

#-------------------------------------------------

#upper() - The upper() method returns a string where all characters are in upper case.
example22 = "this should print as uppercase"
a = example22.upper()
print(a) #prints text as ALL uppercase letters


#**PART 3**

group = "Me
print(group)
