// EXPECTED-VERDICT: ACCEPT
// issue #429 reproducer 1, verbatim
// repro_const_return_race.hy
const shared = map[string]int{"k": 0}

fn get_shared() map[string]int {
    return shared
}

fn worker_ambient(done chan int) {
    m := get_shared()
    for i in 0..100000 {
        m["k"] = i
    }
    done <- 1
}

fn worker_moved(m map[string]int, done chan int) {
    for i in 0..100000 {
        m["k"] = i
    }
    done <- 1
}

fn main() {
    done := make(chan int, 2)

    // Path 1A: Zero map arguments at the spawn site — both tasks call
    // `get_shared()` and mutate the package-level `var shared` concurrently.
    task worker_ambient(done)
    m0 := get_shared()
    for i in 0..100000 {
        m0["k"] = i
    }
    _ = <-done

    // Path 1B: `get_shared()` erases `non_owned_origin` ("file-level `const shared`")
    // and `immutable: true`, so `move m1` bypasses HYB-E3004 and fails to freeze
    // `m2` / `shared` (HYB-E3003) or reject `m2["k"] = i` / `delete(get_shared(), "k")` (HYB-E3006).
    m1 := get_shared()
    m2 := get_shared()
    task worker_moved(move m1, done)
    for i in 0..100000 {
        m2["k"] = i
    }
    delete(get_shared(), "k")
    _ = <-done
}
