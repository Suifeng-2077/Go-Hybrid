// EXPECTED-VERDICT: ACCEPT
// #399 sibling form Q6-if-one-line
fn worker(m map[string]int) {
    m["task"]++
}

fn main() {
    shared := map[string]int{}
    var alias map[string]int
    if len(shared) == 0 { alias = shared }

    task worker(move alias)

    shared["main"]++
}
