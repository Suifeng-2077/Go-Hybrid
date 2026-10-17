// write-detection probe W1-direct-const-write
const shared = map[string]int{"k": 0}

fn main() {
    shared["k"] = 1
}
