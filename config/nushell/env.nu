# Use starship
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu

$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

# Directories to search for scripts when calling source or use
# The default for this is $nu.default-config-dir/scripts
$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts') # add <nushell-config-dir>/scripts
]

# Directories to search for plugin binaries when calling register
# The default for this is $nu.default-config-dir/plugins
$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]

$env.STARSHIP_CONFIG = "/home/dupp/.config/starship/config.toml"
$env.EDITOR = "helix"
$env.BROWSER = "wslview"

$env.PATH = ($env.PATH | split row (char esep) | prepend '/home/dupp/go/bin')
$env.PATH = ($env.PATH | split row (char esep) | prepend '/home/dupp/')
$env.PATH = ($env.PATH | split row (char esep) | prepend 'local/bin')
$env.PATH = ($env.PATH | split row (char esep) | prepend 'cargo/bin')
$env.PATH = ($env.PATH | split row (char esep) | prepend '/home/dupp/bin')
$env.PATH = ($env.PATH | split row (char esep) | prepend '/home/dupp/.local/bin')
