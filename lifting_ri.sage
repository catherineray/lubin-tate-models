from tqdm import tqdm

S.<u3> = PolynomialRing(GF(5))
L.<x> = PolynomialRing(S)
f = x^5 + u3*x^2 - u3*x
a = {}
a[0] = 2
P = 1000 #precision

memo = {}

for n in tqdm(range(P)):
  a[n+1] = f(a[n]).truncate(n+1)
print "Here is your lift:"
print a[P]
coeff = a[P].list()
print "coefficients for you madame"
print coeff
print len(coeff)


nonzero = []
for i, b in enumerate(coeff): 
  if b !=0:
    nonzero.append(i) 
print nonzero

diff = [j-i for i, j in zip(nonzero[:-1], nonzero[1:])]
print diff

def gen_mat(size, offset=0):
  rows = []
  for i in range(0, size): 
    cols = []
    for j in range(0, size):
      cols.append(coeff[offset + i + j])
    rows.append(cols)
  return matrix(GF(5),rows)

def get_det_range(size):
  for i, _ in enumerate(coeff):
    mat = gen_mat(size, i)
    det = mat.det()
    ker = mat.kernel()
    if det == 0:
      print ker
    #print('Matrix of size {} has det {} and kernel {}.'.format(size, det, ker))
    #print(mat)
    #print(det)
    if det != 0:
      if i !=0:
        print('{} matrices of size {} have det 0 in a row. Total: {}.'.format(i, size, i + size))
      return
  print('OH MY GOD')
  print('>>> We have ourselves a matrix.')
  print('>>> Size: {}'.format(size))

def main():
  max_size = 100
  for i in range(2, max_size + 1):
    get_det_range(i)

main()
