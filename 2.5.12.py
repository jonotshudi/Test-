names = []

name = None
while name != 'zzz':
    
    name = input('What is your name: ')
    
    if name != 'zzz':
        names.append(name)    

file = open('name.txt', 'a')

for name in names:
    file.write(name+"\n")

file.close()

file = open('name.txt', 'r')

for line in file: 

    print(line.strip()+",", end =" ")



import random

employees = []

employ = " melcom boody, jon rivers, mike skalam, bob bur, kill bill, altron rougeai, thanos themadetitan, henry cavil"

file = open("employee.txt", 'w')
file.write(employ)
file.close

file = open("employee.txt", 'r')

for line in file:
    employees.append(line.strip().split(","))

print(employees)

for e in employees:
    for i in e: 
        p = []

        l = random.choice(["Mrs","Mr"])
        p.append(i.split()) #splits the string at a wite space

        print(l +" "+p[0][1])

file.close()














