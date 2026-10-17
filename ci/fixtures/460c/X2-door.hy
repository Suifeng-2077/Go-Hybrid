// final narrowing X2-door
const shared = map[string]int{"k": 1}

fn main() {
    local := [1, 2]
    _ = shared["k"]
    _ = local[0]
}
