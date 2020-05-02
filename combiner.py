
#enter the set for (x,y) values from shares received
x=[1,2,11,15,12] 
y=[126,703,419626,1438906,592663]

n=len(x)
	#get y value based on lagranges interpolation
yval=0
xval=0
for i in range(len(x)):
	p=1
	for j in range(len(x)):
		if i!=j:
			p*=(xval-x[j])/(x[i]-x[j])
	yval+=y[i]*p

print("Key = %0.2f"%(yval))