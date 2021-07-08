load("__common__.sage")

def generator():
    #Pick How many vectors in R4
    n=choice([4,5,6])

    #Pick if yes a spanning set or no
    span = choice([False,True])

    if span:
        A=simple_random_matrix_of_rank(4,rows=4,columns=n)
    else:
        A=simple_random_matrix_of_rank(choice([2,3]),rows=4,columns=n)

    xs=[var("x_"+str(i+1)) for i in range(0,n)]
    vectorComb = linearCombination(xs,[column_matrix(v) for v in A.columns()])

    return {
      "spans": span,
      "vecset": vectorSet(A.columns()),
      "vecComb": vectorComb,
      "prompt": choice([True,False]),
      "matrix": A,
      "rref": A.rref(),
    }