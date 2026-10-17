// EXPECTED-VERDICT: ACCEPT
// discard-binding probe Z5-no-const
fn main() {
    m := map[string]int{"k": 1}
    xs := [1, 2]
    _ = m["k"]
    _ = xs[0]
}
