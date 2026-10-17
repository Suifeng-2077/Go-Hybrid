// EXPECTED-VERDICT: ACCEPT
// soundness probe V03-two-fields-one-map
struct pair {
    a map[string]int
    b map[string]int
}

fn worker(p pair) {
    p.a["task"] = 1
}

fn main() {
    live := map[string]int{}
    var p pair
    p.a = live
    p.b = map[string]int{}
    task worker(move p)
    live["main"] = 2
    fmt.println("done")
}
