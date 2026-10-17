// EXPECTED-VERDICT: ACCEPT
// #399 sibling form Q4-else-branch
fn worker(m map[string]int) {
    m["task"]++
}

fn main() {
    shared := map[string]int{}
    var alias map[string]int
    if len(shared) == 1 {
        alias = map[string]int{}
    } else {
        alias = shared
    }

    task worker(move alias)

    shared["main"]++
}
