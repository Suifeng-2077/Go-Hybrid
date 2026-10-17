// isolation probe M6-no-reads
const shared_paren = (map[string]int{"k": 1})

fn main() {
    const local_paren = ([1, 2])
    _ = 1
}
