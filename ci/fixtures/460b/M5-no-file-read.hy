// isolation probe M5-no-file-read
const shared_paren = (map[string]int{"k": 1})

fn main() {
    const local_paren = ([1, 2])
    _ = local_paren[0]
}
