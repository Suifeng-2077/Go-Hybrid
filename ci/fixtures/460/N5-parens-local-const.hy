// narrowing probe N5-parens-local-const
fn main() {
    const local = ([1, 2])
    _ = local[0]
}
