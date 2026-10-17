// narrowing probe N2-parens-file-const
const shared = (map[string]int{"k": 1})

fn main() {
    _ = shared["k"]
}
