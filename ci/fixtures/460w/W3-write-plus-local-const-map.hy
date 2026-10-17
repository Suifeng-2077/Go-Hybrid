// write-detection probe W3-write-plus-local-const-map
const shared = map[string]int{"k": 0}

fn main() {
    const local = map[string]int{"k": 9}
    _ = local["k"]
    shared["k"] = 1
}
