# Adding Clang-15 to Ubuntu.

add the following lines to `/etc/apt/sources.list`
```yaml
deb http://apt.llvm.org/focal/ llvm-toolchain-focal-15 main
# deb-src http://apt.llvm.org/focal/ llvm-toolchain-focal-15 main
```

And then run this in the command line

```sh
$ sudo apt update && sudo apt install -y \
    clangd-15 \
    clang-15 \
    clang-format-15 \
    libomp-15-dev
```

The following lines is to change the default `clang++`, `clang`, `clang-format`, `clangd`

```sh
$ sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-15 100 \
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-15 100 \
sudo update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-15 100 \
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-15 100
```

# Using Clangd with VSCode

## Autocompleting ROS with Clangd VSCode
```sh
curr_ws=${HOME}/catkin_ws
catkin config --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1 # to generate compile_commands.json in all projects
jq -s 'map(.[])' ${curr_ws}/**/compile_commands.json > ${curr_ws}/compile_commands.json # To merge compile_commands.json on every projects to 1 file
```

You can add the above command like (https://github.com/ardiya/dotfiles/blob/4b91348d4a122c51f726123092d1dca5e14f8405/zsh/.zshrc#L95-L99)

## Installing and Setting up VSCode Extension
Install [Clangd VSCode Extension](https://marketplace.visualstudio.com/items?itemName=llvm-vs-code-extensions.vscode-clangd)

Copy [this file](.config/clangd/config.yaml) to `~/.config/clangd/config.yaml`

And add `--enable--config` in the `~/.config/Code/User/settings.json`'s `clangd.arguments`, for example:
```json
{
    "clangd.arguments": ["--print-options", "--background-index", "--malloc-trim", "--header-insertion=never", "--header-insertion-decorators", "--all-scopes-completion", "--completion-style=detailed", "--enable-config"]
}
```
