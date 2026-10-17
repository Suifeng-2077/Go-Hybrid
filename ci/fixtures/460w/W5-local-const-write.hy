// write-detection probe W5-local-const-write
fn main() {
    const local = map[string]int{"k": 0}
    local["k"] = 1
}
