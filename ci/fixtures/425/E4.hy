// issue #425 repro E4
fn main() {
    xs := []int{1}
    delete(xs, 0)
    fmt.println(xs)
}
