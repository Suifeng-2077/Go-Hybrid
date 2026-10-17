// EXPECTED-VERDICT: ACCEPT
// issue #429 reproducer 2, verbatim
// repro_interproc_const_mutate.hy
struct holder {
    m map[string]int
}

const shared_list = [holder{m: map[string]int{"k": 0}}]
const shared_nested = map[string]map[string]int{"a": map[string]int{"k": 0}}
const shared_map = map[string]int{"k": 0}

fn mutate_iter(xs []holder) {
    for _, h in xs {
        for i in 0..100000 {
            h.m["k"] = i
        }
    }
}

fn mutate_comma_ok(outer map[string]map[string]int) {
    inner, ok := outer["a"]
    if ok {
        inner["k"] = 1
    }
}

fn mutate_post_rebind(m map[string]int) {
    var m2 map[string]int = map[string]int{"k": 0}
    _ = m2
    f := fn() {
        m2["k"] = 2
    }
    m2 = m
    f()
}

fn worker(done chan int) {
    mutate_iter(shared_list)
    done <- 1
}

fn main() {
    done := make(chan int, 1)
    mutate_comma_ok(shared_nested)
    mutate_post_rebind(shared_map)
    task worker(done)
    mutate_iter(shared_list)
    _ = <-done
}
