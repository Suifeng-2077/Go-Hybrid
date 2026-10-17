// EXPECTED-VERDICT: ACCEPT
// issue #399 probe P1-block-scope
fn worker(m map[string]int) {
    m["task"]++
}

fn main() {
    shared := map[string]int{}
    var alias map[string]int

    if len(shared) == 0 {
        alias = shared
    }

    task worker(move alias)

    shared["main"]++
}
