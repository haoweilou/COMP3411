a = "TGPRGWTADEKIHI6OYNODONATES4LOCIINTB}FC4LURSDTHO_LO1IRYAEEIU_AM{NOPBAVNT_"
size = len(a)
bloct = size/6
i = 0
while i < bloct:
    j = 0
    while j < 6:
        print(a[i+j*12],end='')
        j+=1
    i+=1
