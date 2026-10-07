use math_operations::add;

#[test]
fn basic_addition() {
    assert_eq!(add(2, 3), 5);
}

#[test]
fn addition_with_negative_numbers() {
    assert_eq!(add(-2, -3), -5);
    assert_eq!(add(-2, 3), 1);
}

#[test]
fn addition_with_zero() {
    assert_eq!(add(0, 5), 5);
    assert_eq!(add(5, 0), 5);
    assert_eq!(add(0, 0), 0);
}
