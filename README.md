# GaussianPrimeField
Data structure implementing Gaussian Prime Field and operations on it

Example of using the module (output of "examples.jl")

```
~ % julia examples.jl 

a = 3₅
b = 2₅
a + b = 0₅
a - b = 1₅
a * b = 1₅
a / b = 4₅


Addition:
  + | 0₅ | 1₅ | 2₅ | 3₅ | 4₅ |
 0₅ | 0₅ | 1₅ | 2₅ | 3₅ | 4₅ |
 1₅ | 1₅ | 2₅ | 3₅ | 4₅ | 0₅ |
 2₅ | 2₅ | 3₅ | 4₅ | 0₅ | 1₅ |
 3₅ | 3₅ | 4₅ | 0₅ | 1₅ | 2₅ |
 4₅ | 4₅ | 0₅ | 1₅ | 2₅ | 3₅ |

Multiplication:
  * | 0₅ | 1₅ | 2₅ | 3₅ | 4₅ |
 0₅ | 0₅ | 0₅ | 0₅ | 0₅ | 0₅ |
 1₅ | 0₅ | 1₅ | 2₅ | 3₅ | 4₅ |
 2₅ | 0₅ | 2₅ | 4₅ | 1₅ | 3₅ |
 3₅ | 0₅ | 3₅ | 1₅ | 4₅ | 2₅ |
 4₅ | 0₅ | 4₅ | 3₅ | 2₅ | 1₅ |


x = Main.GPF.GP{5}[1₅ 2₅; 3₅ 4₅]
det(x) = 3₅
```