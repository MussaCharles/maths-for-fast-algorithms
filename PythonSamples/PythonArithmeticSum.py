
class NaiveSum:

    def compute(self,A1,n,d):
     #  Space complexity O(n), n = total terms
       allTerms = []

       currentTerm = A1
        # First creates all terms. Space complexity -> O(n)
       for _ in range(n):
            allTerms.append(currentTerm)
            currentTerm += d
        
        # Then compute the sum iteratively. Time complexity O(n), where n = count of all terms.
       sum = 0
       for term in allTerms:
            sum += term
        
       return sum


naivesum = NaiveSum()

naiveSum = naivesum.compute(1,100,1)

print("Got naive sum: ",naiveSum)