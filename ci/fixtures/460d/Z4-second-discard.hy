// EXPECTED-VERDICT: ACCEPT
// discard-binding probe Z4-second-discard
const shared = map[string]int{"k": 1}

fn main() {
    const local = [1, 2]
    a := shared["k"]
    _ = a
    _ = local[0]
}
