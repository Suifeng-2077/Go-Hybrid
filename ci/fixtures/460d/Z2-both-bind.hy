// EXPECTED-VERDICT: ACCEPT
// discard-binding probe Z2-both-bind
const shared = map[string]int{"k": 1}

fn main() {
    const local = [1, 2]
    a := shared["k"]
    b := local[0]
    _ = a
    _ = b
}
