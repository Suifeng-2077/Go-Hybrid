// write-detection probe W4-write-plus-local-const-scalar
const shared = map[string]int{"k": 0}

fn main() {
    const local = 3
    _ = local
    shared["k"] = 1
}
