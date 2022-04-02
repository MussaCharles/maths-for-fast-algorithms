# maths-for-fast-algorithms
Detailed explanations and implementations of various maths concepts which can help Software Engineers to write high performance code/algorithms backed with Unit Tests.

## Arithmetic Sequence & Geometric Sequence
### Arithmetic Sequence (Arithmetic Progression)
Arithmetic Sequence is a sequence of numbers having a common/constant difference.

 For example
*100,200,300......n* has a common difference of 100

By using [technics for summing an arithmetic sequence](https://en.wikipedia.org/wiki/Arithmetic_progression#:~:text=An%20alternate%20form%20results%20from%20re%2Dinserting%20the%20substitution%3A,%3A) **(Sn)** 
all we need to know is the first term **(Ao)** and the common difference **(d)**.

`Sn= n/2[2Ao + (n-1)d]`

for Example: 
Consider a list of natural numbers below: - 

`1,2,3,4,......................................1,000,000`

Using the naive approach to find the sum of the numbers would be to iterate through all numbers and add them one by one.

Here is an example of swift code for the naive approach.

This approach will given us `O(n)` run time. 

Swift sample code for this approach is as follows: 

```swift
var sum:Int = 0
for i in 1...1_000_000 {
    sum += i
}
```

Now let's try using technics for summing an arithmetic sequence to achive `O(1)` time complexity for summing a huge amount of numbers.

A swift implementation for summing from 1 to Million using Gauss's technic is as follows.
      
```swift
// Sn= n/2[2Ao + (n-1)d]
sum = 1_000_000 / 2 * (2 * 1 + (1_000_000 - 1) * 1)
```

Performance Tests
Note: Code snippet for this section can be run using Swift Playgrounds. You can find the source code [here](/blob/main/ArithmeticSequence.playground/Contents.swift)

  Enough talking let's test the performance of the above two implementations with varying different data sets. 
  We will try to increase the nth term and compare the run times.
  
  // TODO: - Write tests
      



### Geometric Sequence
