// EXPECTED-VERDICT: ACCEPT
// issue #399 probe P3-loop-race
fn worker(m map[string]int, done chan int) {
    for i in 0..100000 {
        m["task"] = i
    }
    done <- 1
}

fn main() {
    shared := map[string]int{}
    var alias map[string]int
    done := make(chan int, 1)

    if len(shared) == 0 {
        alias = shared
    }

    task worker(move alias, done)

    for i in 0..100000 {
        shared["main"] = i
    }
    _ = <-done
}
