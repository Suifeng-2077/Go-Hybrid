// EXPECTED-VERDICT: ACCEPT
// control for issue #429: a read-only caller of a const accessor must stay accepted
const shared = map[string]int{"k": 0}

fn get_shared() map[string]int {
    return shared
}

fn main() {
    m := get_shared()
    _ = m["k"]
}
