import numpy as np
import socket

print(f"my numpy version is {np.__version__}")
print(f"my numpy version is {np.version}")

def myfunc():
    print("hello")

def factorial(n):
    if n == 0:
        return 1
    else:
        return n * factorial(n - 1)

def main():
    try:
        n = int(input("Enter a number: "))
        if n < 0:
            print("Factorial is not defined for negative numbers.")
        else:
            result = factorial(n)
            print(f"The factorial of {n} is {result}")
    except ValueError:
        print("Please enter a valid integer.")

if __name__ == "__main__":
    main()
    myfunc()
