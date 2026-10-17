// EXPECTED-VERDICT: ACCEPT
// #399 sibling form Q3-bare-block
fn worker(m map[string]int) {
    m["task"]++
}

fn main() {
    shared := map[string]int{}
    var alias map[string]int
    {
        alias = shared
    }

    task worker(move alias)

    shared["main"]++
}
