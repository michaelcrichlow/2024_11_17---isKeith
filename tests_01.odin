package test

import "core:fmt"
import "core:math"
print :: fmt.println

main :: proc() {

	print(isKeith(197))
	// OUTPUT:
	// true
}


/* 
Input : x = 197
Output : Yes
197 has 3 digits, so n = 3
The number is Keith because it appears in the special
sequence that has first three terms as 1, 9, 7 and 
remaining terms evaluated using **sum of previous 3 terms**.
1, 9, 7, 17, 33, 57, 107, 197, ..... 
*/
isKeith :: proc(n: int) -> bool {
	_n := n
	total := 0
	div, mod := 1_000, 0
	local_array := make([dynamic]int)
	defer delete(local_array)

	for div > 0 {
		div, mod = math.divmod(_n, 10)
		total += mod
		append(&local_array, mod)
		_n = div
	}

	reverse(local_array[:])
	num := 0

	for num <= n {
		num = sum_iterable(local_array[len(local_array) - 3:])
		if num == n {
			return true
		}

		append(&local_array, num)
	}

	return false
}
