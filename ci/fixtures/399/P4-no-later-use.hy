// EXPECTED-VERDICT: ACCEPT
// issue #399 probe P4-no-later-use
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

    _ = shared
}
