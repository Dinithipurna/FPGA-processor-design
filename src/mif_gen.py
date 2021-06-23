import mif
import numpy as np

with open("DRAM.txt",'r') as file:
    mem_list=[]
    temp=[]
    matB=[]
    lines = file.readlines()

    count=0
    for line in lines:
        if count==0:
            no_cores = int(line.strip())
            mem_list.append([no_cores])
        elif (count==1):
            for x in line.split(','):
                mem_list.append([int(x)])
        elif 2<=count<=mem_list[1][0]+1:
            for x in line.split(','):
                mem_list.append([int(x)])
        else:
            temp.append([int(x) for x in line.split(',')])
  
        count+=1
    
    for i in temp:
        matB+=i

    for j in range(0,mem_list[3][0]):
        for i in range(j,len(matB),mem_list[3][0]):
            mem_list.append([matB[i]])


mem=np.array(mem_list,dtype=np.uint8)
mem_unpack = np.unpackbits(mem,axis=1)
mem_init =np.flip(mem_unpack,axis=1)
str = mif.dumps(mem_init,width=8,address_radix='UNS',data_radix='UNS')


file = open("DRAM_sample.mif", "wt")
file.write(str)
file.close()