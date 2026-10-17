// EXPECTED-VERDICT: ACCEPT
// soundness probe V04-slice-of-map
fn worker(xs []map[string]int) {
    xs[0]["task"] = 1
}

fn main() {
    live := map[string]int{}
    xs := []map[string]int{live}
    task worker(move xs)
    live["main"] = 2
    fmt.println("done")
}
