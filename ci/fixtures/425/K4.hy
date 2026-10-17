// issue #425 repro K4
fn main() {
    m := map[string]int{"a": 1}
    fmt.println(len(m))
}
