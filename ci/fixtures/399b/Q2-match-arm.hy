// EXPECTED-VERDICT: ACCEPT
// #399 sibling form Q2-match-arm
fn worker(m map[string]int) {
    m["task"]++
}

fn main() {
    shared := map[string]int{}
    var alias map[string]int
    match len(shared) {
        0 => { alias = shared }
        _ => { alias = shared }
    }

    task worker(move alias)

    shared["main"]++
}
