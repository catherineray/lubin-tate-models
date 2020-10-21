from tqdm import tqdm

#tqdm is optional and just shows the progress of the computation, feel free to remove it here

S.<u3> = PolynomialRing(GF(5))
L.<x> = PolynomialRing(S)
#f = x^5 + u2*x^3 + u3*x^2 - (u2+u3)*x
f = x^5 + u3*x^2 - u3*x
s = {}
s[0] = 2
P = 500 #precision

memo = {}

#remove tqdm in the below line if you don't have tqdm installed

for n in tqdm(range(P)):
  s[n+1] = f(s[n]).truncate(n+1)
print s[P]
