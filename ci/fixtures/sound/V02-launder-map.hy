// EXPECTED-VERDICT: ACCEPT
// soundness probe V02-launder-map
fn same(m map[string]int) map[string]int {
    return m
}

fn worker(m map[string]int) {
    m["task"] = 1
}

fn main() {
    m := map[string]int{}
    m2 := same(m)
    task worker(move m2)
    m["main"] = 2
    fmt.println("done")
}
