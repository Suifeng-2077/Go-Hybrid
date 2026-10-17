// issue #425 repro E3
fn main() {
    m := map[string]int{}
    fmt.println(cap(m))
}
