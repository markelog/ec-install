use std::process::{Command, Stdio};
use std::env;

fn main() {
  let tmp = env::temp_dir();
  let home = env::home_dir().unwrap();
  let cwd = env::current_dir().unwrap();

  let tmp_path = format!("{}", tmp.display());
  let install_path = format!("{}/scripts/install.sh", cwd.display());
  let exec_path = format!("{}/scripts/for-rust.sh", cwd.display());

  let ec_path = format!("{}/ec", &tmp_path);
  let ec_proxy_path = format!("{}/ec-proxy", &tmp_path);
  let cargo_path = format!("{}/.cargo/bin", home.display());

  Command::new(&install_path)
    .env("EC_DEST", &tmp_path)
    .env("EC_VERSION", "0.6.0")
    .status()
    .unwrap();

  Command::new(&exec_path)
    .stdout(Stdio::null())
    .stderr(Stdio::null())
    .stdin(Stdio::null())
    .args(&[&cargo_path, &ec_path, &ec_proxy_path])
    .spawn()
    .unwrap();
}
