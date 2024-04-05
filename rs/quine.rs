const S: &str = "fn main() {\n    println!(\"const S: &str = {:?};\\n\\n{}\", S, S);\n}";

fn main() {
    println!("const S: &str = {:?};\n\n{}", S, S);
}
