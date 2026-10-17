// EXPECTED-VERDICT: ACCEPT
// soundness probe V05-nested-holder
struct inner {
    m map[string]int
}

struct outer {
    i inner
}

fn worker(o outer) {
    o.i.m["task"] = 1
}

fn main() {
    live := map[string]int{}
    var o outer
    o.i.m = live
    task worker(move o)
    live["main"] = 2
    fmt.println("done")
}
