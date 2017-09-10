
def clampValues(inputList,minVal,maxVal):
    outList=[]
    for x in inputList:
        if x>maxVal:
            outList.append(maxVal)
        elif x<minVal:
            outList.append(minVal)
        else:
            outList.append(x)
    return outList
