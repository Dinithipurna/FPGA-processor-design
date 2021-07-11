import numpy as np

count=0
with open('final.txt','r') as file:
    lines=file.readlines()
    matA=[]
    matB=[]
    matANS=[]
    for line in lines:
        if count==4:
            matA_row= int((line.split(':')[1]).strip())
        elif count==5:
            matA_col= int((line.split(':')[1]).strip())  
        elif count==6:
            matB_col= int((line.split(':')[1]).strip())
        elif count>6:
            count=0
            break 
        count+=1
    for line in lines: 
        if 7<=count<=(6+matA_row*matA_col):
            matA.append((line.split(':')[1]).strip())
        elif 7+matA_row*matA_col<=count<=6+matA_row*matA_col+matA_col*matB_col:
            matB.append((line.split(':')[1]).strip())
        elif 7+matA_row*matA_col+matA_col*matB_col<=count<=6+matA_row*matA_col+matA_col*matB_col+matA_row*matB_col:
            matANS.append((line.split(':')[1]).strip())
        count+=1
    matA= list(map(int,matA))
    matB= list(map(int,matB))
    matANS=list(map(int,matANS))
    

mat1=[]
mat2=[]
mat3=[]
for i in range(0,len(matA),matA_col):
    mat1.append(matA[i:i+matA_col])
for i in range(0,len(matB),matA_col):
    mat2.append(matB[i:i+matA_col])
for i in range(0,len(matANS),matB_col):
    mat3.append(matANS[i:i+matB_col])    
mat1 = np.array(mat1)
mat2 = np.array(mat2)
mat2 = mat2.transpose() 
matpros = np.matmul(mat1,mat2)
print(matpros)
print((matpros==mat3).all())