# maths-for-fast-algorithms
A summary and list of resources covering maths concepts which can be very useful to achieve high performance algorithms. 

## Arithmetic Sequence & Geometric Sequence
### Arithmetic Sequence
Arithmetic Sequence is a sequence of numbers having a common difference. For example
*100,200,300......n*

By using [technics for summing an arithmetic sequence](https://en.wikipedia.org/wiki/Arithmetic_progression#:~:text=An%20alternate%20form%20results%20from%20re%2Dinserting%20the%20substitution%3A,%3A) **(Sn)** all we need to know is the first term **(Ao)**, last term **(An)** and the common difference**(d)**.

 S_n=\frac{n}{2}[ 2a_1 + (n-1)d]

Using technics for summing an arithmetic sequence we can achive **O(1)** time complexity for summing a huge amount of numbers ie Billions of numbers. Without this technics most implementations fall under **O(n)** run time.


### Geometric Sequence
