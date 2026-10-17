// EXPECTED-VERDICT: ACCEPT
// #399 sibling form Q5-nested
fn worker(m map[string]int) {
    m["task"]++
}

fn main() {
    shared := map[string]int{}
    var alias map[string]int
    if len(shared) == 0 {
        for i in 0..1 {
            if i == 0 {
                alias = shared
            }
        }
    }

    task worker(move alias)

    shared["main"]++
}
