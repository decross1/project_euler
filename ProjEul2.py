def solve_euler_2():
    list = [1,2]
    while list[-1] < 4000000:
        list.append(list[-1] + list[-2])
    sum = 0
    for each in range(len(list)):
        if list[each] % 2 == 0:
            sum += list[each]
    return sum