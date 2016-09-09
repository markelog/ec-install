use std::process::{Command, Stdio};
use std::env;

fn main() {
  let tmp = env::temp_dir();
  let home = env::home_dir().unwrap();

  let tmp_path = format!("{}", tmp.display());
  let ec_path = format!("{}/ec", &tmp_path);
  let cargo_path = format!("{}/.cargo/bin", home.display());

  Command::new("./install.sh")
    .env("EC_DEST", &tmp_path)
    .env("EC_VERSION", "0.0.1")
    .status()
    .unwrap();

  Command::new("./for-rust.sh")
    .stdout(Stdio::null())
    .stderr(Stdio::null())
    .stdin(Stdio::null())
    .args(&[&ec_path, &cargo_path])
    .spawn()
    .unwrap();
}
