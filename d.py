import random
import array
fopen = open("secret_shares.txt","w")
# n=2k-1 (5,9) secret sharing
# select prime no.
# p > n
#y=fx
k=5
key=int(input("Enter key = "))
n=2*k-1
# generate prime no > key
a=array.array('i',[])
p=int(input("Enter prime number greater then size of share = "))
# generate some x values
x=array.array('i',[])

y=array.array('i',[])

for i in range(n):
	m=random.randrange(1,50)
	x.append(m)
  
#print(len(x))

# 4 random nos for equation of line
for i in range(4):
	m=random.randrange(0,p-1)
	a.append(m)

#fx=key+a[0]*x+a[1]*x**2
# generate y values 

for i in range(len(x)):
	fx=key+(a[0]*x[i])+(a[1]*x[i]**2)+(a[2]*x[i]**3)++(a[3]*x[i]**4)
	y.append(fx)
	

for ssh in range(n):
	print("for x=%0.2f y=%0.2f" %(x[ssh],y[ssh]))
	fopen.write("("+str(x[ssh])+","+str(y[ssh])+")\n")









