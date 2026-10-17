// EXPECTED-VERDICT: ACCEPT
// soundness probe V06-copy-then-move
struct holder {
    m map[string]int
}

fn worker(h holder) {
    h.m["task"] = 1
}

fn main() {
    live := map[string]int{}
    var a holder
    a.m = live
    b := a
    task worker(move b)
    live["main"] = 2
    fmt.println("done")
}
