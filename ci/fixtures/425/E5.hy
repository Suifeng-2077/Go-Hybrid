// issue #425 repro E5
fn main() {
    x := 5
    x = append(x, 1)
    fmt.println(x)
}
