/*
 * File: my_list.rs
 * Created Time: 2023-03-11
 * Author: sjinzh (sjinzh@gmail.com)
 */

include!("../include/include.rs");

#[allow(dead_code)]
struct MyList {
    nums: Vec<i32>,
    capacity: usize,
    size: usize,
    extend_ratio: usize,
}

#[allow(unused,unused_comparisons)]
impl MyList {
    /* 构造方法 */
    pub fn new(capacity: usize) -> Self {
        let mut vec = Vec::new(); 
        vec.resize(capacity, 0);
        Self {
            nums: vec,
            capacity,
            size: 0,
            extend_ratio: 2,
        }
    }

    /* 获取列表长度（即当前元素数量）*/
    pub fn size(&self) -> usize {
        return self.size;
    }

    /* 获取列表容量 */
    pub fn capacity(&self) -> usize {
        return self.capacity;
    }

    /* 访问元素 */
    pub fn get(&self, index: usize) -> i32 {
        // 索引如果越界则抛出异常，下同
        if index < 0 || index >= self.size {panic!("索引越界")};
        return self.nums[index];
    }

    /* 更新元素 */
    pub fn set(&mut self, index: usize, num: i32) {
        if index < 0 || index >= self.size {panic!("索引越界")};
        self.nums[index] = num;
    }

    /* 尾部添加元素 */
    pub fn add(&mut self, num: i32) {
        // 元素数量超出容量时，触发扩容机制
        if self.size == self.capacity() {
            self.extend_capacity();
        }
        self.nums[self.size] = num;
        // 更新元素数量
        self.size += 1;
    }

    /* 中间插入元素 */
    pub fn insert(&mut self, index: usize, num: i32) {
        if index < 0 || index >= self.size() {panic!("索引越界")};
        // 元素数量超出容量时，触发扩容机制
        if self.size == self.capacity() {
            self.extend_capacity();
        }
        // 将索引 index 以及之后的元素都向后移动一位
        for j in (index..self.size).rev() {
            self.nums[j + 1] = self.nums[j];
        }
        self.nums[index] = num;
        // 更新元素数量
        self.size += 1;
    }

    /* 删除元素 */
    pub fn remove(&mut self, index: usize) -> i32 {
        if index < 0 || index >= self.size() {panic!("索引越界")};
        let num = self.nums[index];
        // 将索引 index 之后的元素都向前移动一位
        for j in (index..self.size - 1) {
            self.nums[j] = self.nums[j + 1];
        }
        // 更新元素数量
        self.size -= 1;
        // 返回被删除元素
        return num;
    }

    /* 列表扩容 */
    pub fn extend_capacity(&mut self) {
        let new_capacity = self.capacity * self.extend_ratio;
        self.nums.resize(new_capacity, 0);
        // 更新列表容量
        self.capacity = new_capacity;
    }

    /* 将列表转换为数组 */
    pub fn to_array(&mut self) -> Vec<i32> {
        let mut nums = Vec::new();
        for i in 0..self.size {
            nums.push(self.get(i));
        }
        nums
    }
}

/* Driver Code */
fn main() {
    /* 初始化列表 */
    let mut list = MyList::new(10);
    /* 尾部添加元素 */
    list.add(1);
    list.add(3);
    list.add(2);
    list.add(5);
    list.add(4);
    print!("列表 list = ");
    print_util::print_array(&list.to_array());
    print!(" ，容量 = {} ，长度 = {}", list.capacity(), list.size());

    /* 中间插入元素 */
    list.insert(3, 6);
    print!("\n在索引 3 处插入数字 6 ，得到 list = ");
    print_util::print_array(&list.to_array());

    /* 删除元素 */
    list.remove(3);
    print!("\n删除索引 3 处的元素，得到 list = ");
    print_util::print_array(&list.to_array());

    /* 访问元素 */
    let num = list.get(1);
    println!("\n访问索引 1 处的元素，得到 num = {num}");

    /* 更新元素 */
    list.set(1, 0);
    print!("将索引 1 处的元素更新为 0 ，得到 list = ");
    print_util::print_array(&list.to_array());

    /* 测试扩容机制 */
    for i in 0..10 {
        // 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
        list.add(i);
    }
    print!("\n扩容后的列表 list = ");
    print_util::print_array(&list.to_array());
    print!(" ，容量 = {} ，长度 = {}", list.capacity(), list.size());
}