// final narrowing X3-door
const shared = map[string]int{"k": 1}
const other = [1, 2]

fn main() {
    _ = shared["k"]
    _ = other[0]
}
