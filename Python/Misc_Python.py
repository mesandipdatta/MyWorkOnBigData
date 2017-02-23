import math

print("Hello, Python!");
mydict = ();
print('mydict');
str = "abcdefghijklmn";
print(str[2:]);

list = ['abcd', 786, 2.23, 'john', 70.2]

print(list[1:3])

dict = {}
dict['one'] = "This is one"
dict[2] = "This is two"

tinydict = {'name': 'john', 'code': 6734, 'dept': 'sales'}

print("======================")

print("Whats your name ?")
# string1 = input()
# print ("Hey : ", string1, "- How are you ?")

print("sin(30) =", math.sin(3));

a = "Hello"
b = "Python"

print("a[2:5]=", a[2:5])

print(r'C:\\nowhere')

list = ['physics', 'chemistry', 1997, 2000];

print("Value available at index 2 : ")
print(list[2])
list[2] = 2001;
print("New value available at index 2 : ")
print(list)

import time;

localtime = time.localtime(time.time())
print("Local current time :", localtime)

localtime = time.asctime(time.localtime(time.time()))
print("Local current time :", localtime)

import calendar

cal = calendar.month(2015, 11)
print("Here is the calendar: \n")
print(cal)


def changeme(mylist):
    "This changes a passed list into this function"
    print("Values inside the function: ", mylist)
    mylist.append([1, 2, 3, 4]);
    return


# Now you can call changeme function
mylist = [10, 20, 30];
changeme(mylist);
print("Values outside the function: ", mylist)

print("#=========================================================")


def printinfo(arg1, *vartuple):
    "This prints a variable passed arguments"
    print("Output is: ")
    print(arg1)
    for var1 in vartuple:
        print(var1)
    return;


# Now you can call printinfo function
printinfo(10)
printinfo(70, 60, 50, "hey", "wow")

print("#====================================================================")

Money = 2000


def AddMoney():
    # Uncomment the following line to fix the code:
    global Money
    Money = Money + 1


print(Money)
AddMoney()
print(Money)
# ===============================================
import sys
print("Pythonpath=", sys.path,"\n")

#===============================================
import math
#content = dir(math)
#print ("content=",content)
#===============================================
#localvalue=globals()
#print ("\n","localvalue=",localvalue)
#===============================================
#print("===========================================")
#str = eval(input("Enter your input: "))
#print ("Received input is : ", str)
#============================================
#name = input("What's your name? ")
#print("Nice to meet you " + name + "!")
#place = input("Where do you stay ? ")
#print("So, you stay in " + place + " Mr, " + name + "!")
#============================================
#str = 'Hello World!'
#print (str[2:] )
#================================================================
dict = {}
dict['one'] = "This is one"
dict[2]     = "This is two"
print (dict)

#==================================================================
count=1
name="Sandip"
print("Serial no %d = %s" %(1,'sandip'))
#==================================================================

para_str = """this is a long string that is made up of
several lines and non-printable characters such as
TAB ( \t ) and they will show up that way when displayed.
NEWLINEs within the string, whether explicitly given like
this within the brackets [ \n ], or just a NEWLINE within
the variable assignment will also show up.
"""
print (para_str)
#======================================================================

print (r'C:\\nowhere')

#=================================================================
a="hey"
print(a.capitalize())
#=================================
a=[1,2,3]
print("List length = ",len(a))
#====================================

dict = {'Name': 'Zara', 'Age': 7, 'Class': 'First'};
dict['Age'] = 8; # update existing entry
dict['School'] = "DPS School"; # Add new entry

print(dict)
#====================================

import time;

localtime = time.asctime( time.localtime(time.time()) )
print ("Local current time :", localtime)

#==========================================

print('===========================================')

def changeme( mylist ):
   "This changes a passed list into this function"
   mylist.append([1,2,3,4]);
   print ("Values inside the function: ", mylist)
   return

# Now you can call changeme function
mylist = [10,20,30];
print ("Values before function; call :", mylist)
changeme( mylist );
print ("Values outside the function: ", mylist)
#=========================================

import math

content = dir(math)

print (content)
#=========================================
print("=====================================")
print("name",_name_)