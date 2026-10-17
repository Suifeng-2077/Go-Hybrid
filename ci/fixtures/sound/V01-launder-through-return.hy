// EXPECTED-VERDICT: ACCEPT
// soundness probe V01-launder-through-return
struct holder {
    m map[string]int
}

fn identity(h holder) holder {
    return h
}

fn worker(h holder) {
    h.m["task"] = 1
}

fn main() {
    var h holder
    h.m = map[string]int{}
    h2 := identity(h)
    task worker(move h2)
    h.m["main"] = 2
    fmt.println("done")
}
