def solve_euler_1():
    sum = 0
    for each in range(1,1001):
        if each % 3 == 0 or each % 5 == 0:
            sum += each
    return sum