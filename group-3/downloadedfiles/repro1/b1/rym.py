def to_roman(num):
    rum={1:"I",5:"V",10:"X",50:"L",100:"C",500:"D",1000:"M"}
    num=str(num)
    delit=10 ** (len(num)-1)
    result=""
    char=""
    for i in num:
        i=int(i)
        if i==4:
            char=rum[delit]+rum[5*delit]
        elif i==5:
            char=rum[i*delit]
        elif i>5 and i<9:
            char=rum[5*delit]+rum[delit]*(i-5)
        elif i==9:
            char=rum[delit]+rum[delit*10]
        else:
            char=rum[delit]*i
        result=result+char
        delit=int(delit/10)
    return result
        

"""
III
IV
VIII
XIV
"""
def to_arab(num):
    rum={"I":1,"V":5,"X":10,"L":50,"C":100,"D":500,"M":1000}
    result=0
    preresult=0
    lastchar=num[0]
    count=0
    for i in num:
    
        if rum[lastchar] == rum[i] and count<=3:
            preresult=preresult+rum[i]
        elif rum[lastchar] < rum[i] and count<=1:
            preresult=rum[i]-preresult
        elif rum[lastchar] > rum[i] and count<=3:
            preresult=preresult+rum[i]
        else:
            preresult=0
            break
        count=count+1
        lastchar=i
        
            
         
        
        #result=result+char
        #count=count+1
    print(preresult)           

to_arab("XIV")












