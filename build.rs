use std::path::PathBuf;
use std::process::{Command, Stdio};
use std::env;

fn run_command(cmd: &str, env_vars: Vec<(&str, String)>, args: Vec<&str>) {
    let mut command = Command::new(cmd);

    for (key, value) in env_vars {
        command.env(key, value);
    }

    command
        .stdout(Stdio::null())
        .stderr(Stdio::null())
        .stdin(Stdio::null())
        .args(args)
        .spawn()
        .expect("Failed to run command");
}

fn main() {
    let tmp = env::temp_dir();
    let home = env::home_dir().expect("Failed to get home directory");
    let cwd = env::current_dir().expect("Failed to get current directory");

    let tmp_path = tmp.display().to_string();
    let install_path = format!("{}/scripts/install.sh", cwd.display());
    let exec_path = format!("{}/scripts/for-rust.sh", cwd.display());

    let ec_path = format!("{}/ec", &tmp_path);
    let ec_proxy_path = format!("{}/ec-proxy", &tmp_path);
    let cargo_path = format!("{}/.cargo/bin", home.display());

    run_command(&install_path, vec![("EC_DEST", tmp_path), ("EC_VERSION", "0.8.6".to_string())], vec![]);
    run_command(&exec_path, vec![], vec![&cargo_path, &ec_path, &ec_proxy_path]);
}
