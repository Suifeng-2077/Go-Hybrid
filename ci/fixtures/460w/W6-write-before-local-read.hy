// write-detection probe W6-write-before-local-read
const shared = map[string]int{"k": 0}

fn main() {
    shared["k"] = 1
    const local = [1, 2]
    _ = local[0]
}
