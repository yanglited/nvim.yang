import socket

#import numpy as np

# print(f"my numpy version is {np.__version__}")
# print(f"my numpy version is {np.version}")


class PaymentProcessor:
    def __init__(self, name):
        self.name = name

    def pay(self, amount):
        print(f"{self.name} is paying {amount}")

    def __del__(self):
        print(f"{self.name} is being deleted")


def quickSort(arr):
    print("calling quickSort")
    # Base case or terminating case
    if len(arr) <= 1:
        return arr

    # Recursive case
    pivot = arr[len(arr) // 2] # Select the middle element as the pivot
    left = [x for x in arr if x < pivot] # Elements less than the pivot
    middle = [x for x in arr if x == pivot] # Elements equal to the pivot
    right = [x for x in arr if x > pivot] # Elements greater than the pivot
    # Recursively sort the subarrays
    return quickSort(left) + middle + quickSort(right)


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
    processor = PaymentProcessor("John")
    processor.pay(10)

    my_array = [1, 2, 3, 4, 5]
    my_array = [3, 5, 77, 9, 10, 11, 2, 3, 4, 5]
    print(my_array)
    my_array =quickSort(my_array)
    print(my_array)
