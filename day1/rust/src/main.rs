use std::fs::File;
use std::io::prelude::*;
use std::collections::HashSet;

fn main() {
    let mut file = File::open("data/input.txt").unwrap();
    let mut content = String::new();
    file.read_to_string(&mut content).unwrap();

    println!("Result part 1: {}", part1(&content));
    println!("Result part 2: {}", part2(&content));
}

fn part1(content: &str) -> i32{
    let mut frequency = 0;
    for line in content.lines() {
        let change: i32 = line.parse().unwrap();
        frequency += change;
    }

    frequency
}

fn part2(content: &str) -> i32 {
    let mut frequency = 0;
    let mut seen_frequencies = HashSet::new();
    seen_frequencies.insert(0);

    loop {
        for line in content.lines() {
            let change: i32 = line.parse().unwrap();
            frequency += change;
            if seen_frequencies.contains(&frequency) {
                return frequency
            }
            seen_frequencies.insert(frequency);
        }
    }
}
