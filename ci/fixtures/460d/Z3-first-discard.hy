// EXPECTED-VERDICT: ACCEPT
// discard-binding probe Z3-first-discard
const shared = map[string]int{"k": 1}

fn main() {
    const local = [1, 2]
    _ = shared["k"]
    b := local[0]
    _ = b
}
