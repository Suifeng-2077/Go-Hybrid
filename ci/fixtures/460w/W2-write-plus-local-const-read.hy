// write-detection probe W2-write-plus-local-const-read
const shared = map[string]int{"k": 0}

fn main() {
    const local = [1, 2]
    _ = local[0]
    shared["k"] = 1
}
