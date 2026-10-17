// narrowing probe N1-no-parens-file-const
const shared = map[string]int{"k": 1}

fn main() {
    _ = shared["k"]
}
