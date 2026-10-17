// EXPECTED-VERDICT: ACCEPT
// issue #399 probe P2-flat-control
fn worker(m map[string]int) {
    m["task"]++
}

fn main() {
    shared := map[string]int{}
    var alias map[string]int

    alias = shared

    task worker(move alias)

    shared["main"]++
}
