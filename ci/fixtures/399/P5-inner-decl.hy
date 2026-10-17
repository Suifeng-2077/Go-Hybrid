// EXPECTED-VERDICT: ACCEPT
// issue #399 probe P5-inner-decl
fn worker(m map[string]int) {
    m["task"]++
}

fn main() {
    shared := map[string]int{}
    var alias map[string]int

    if len(shared) == 0 {
        inner := map[string]int{}
        alias = inner
    }

    task worker(move alias)

    shared["main"]++
}
