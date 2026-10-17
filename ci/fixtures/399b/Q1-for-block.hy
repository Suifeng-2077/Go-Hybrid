// EXPECTED-VERDICT: ACCEPT
// #399 sibling form Q1-for-block
fn worker(m map[string]int) {
    m["task"]++
}

fn main() {
    shared := map[string]int{}
    var alias map[string]int
    for i in 0..1 {
        if i == 0 {
            alias = shared
        }
    }

    task worker(move alias)

    shared["main"]++
}
