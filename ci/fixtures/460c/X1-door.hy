// final narrowing X1-door
const shared = map[string]int{"k": 1}

fn main() {
    const local = [1, 2]
    _ = shared["k"]
    _ = len(local)
}
