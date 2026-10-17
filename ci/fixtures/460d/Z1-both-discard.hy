// EXPECTED-VERDICT: ACCEPT
// discard-binding probe Z1-both-discard
const shared = map[string]int{"k": 1}

fn main() {
    const local = [1, 2]
    _ = shared["k"]
    _ = local[0]
}
