import ast

data= input("Dict object: ")

data=ast.literal_eval(data)
key=input("Key : ")

lt=[]

key=key.split("/")
for i in key:
  lt.append(i)

for i in lt:
  data=data[i]

print(data)