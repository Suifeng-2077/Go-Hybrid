// isolation probe M2-file-no-parens
const shared_paren = map[string]int{"k": 1}

fn main() {
    const local_paren = ([1, 2])
    _ = shared_paren["k"]
    _ = local_paren[0]
}
