def isKeith(n: int) -> bool:
    """ Input : x = 197
        Output : Yes
        197 has 3 digits, so n = 3
        The number is Keith because it appears in the special
        sequence that has first three terms as 1, 9, 7 and 
        remaining terms evaluated using **sum of previous 3 terms**.
        1, 9, 7, 17, 33, 57, 107, 197, ....."""

    _n = n
    total = 0
    length_of_n = 0
    div, mod = 1_000, 0
    local_array = []

    while div > 0:
        div, mod = divmod(_n, 10)
        total += mod
        length_of_n += 1
        local_array.append(mod)
        _n = div

    local_array.reverse()
    num = 0
    while num <= n:
        num = sum(local_array[-3:])
        if num == n:
            return True

        local_array.append(num)

    return False


def main() -> None:
    print(isKeith(197))


if __name__ == '__main__':
    main()
