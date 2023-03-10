/*
 * File: print_util.rs
 * Created Time: 2023-02-05
 * Author: sjinzh (sjinzh@gmail.com)
 */

use std::fmt::Display;
use std::collections::{HashMap, LinkedList};
use crate::ListNode;
use std::rc::Rc;
use std::cell::RefCell;

/* Print an array */
pub fn print_array<T: Display>(nums: &[T]) {
    print!("[");
    if nums.len() > 0 {
        for (i, num) in nums.iter().enumerate() {
            print!("{}{}", num, if i == nums.len() - 1 {"]"} else {", "} );
        }
    } else {
        print!("]");
    }
}

/* Print a hash map */
pub fn print_hash_map<TKey: Display, TValue: Display>(map: &HashMap<TKey, TValue>) {
    for (key, value) in map {
        println!("{key} -> {value}");
    }
}

/* Print a queue or deque */
pub fn print_queue<T: Display>(queue: &LinkedList<T>) {
    print!("[");
    let iter = queue.iter();
    for (i, data) in iter.enumerate() {
        print!("{}{}", data, if i == queue.len() - 1 {"]"} else {", "} );
    }
}

/* Print a linked list */
pub fn print_linked_list<T: Display>(head: &Rc<RefCell<ListNode<T>>>) {
    print!("{}{}", head.borrow().val, if head.borrow().next.is_none() {"\n"} else {"->"});
    if let Some(node) = &head.borrow().next {
        return print_linked_list(node);
    }
}