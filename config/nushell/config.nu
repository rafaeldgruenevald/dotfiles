alias core-ls = ls

alias core-cd = cd

alias core-cat = cat

alias cat = bat

def nix-switch [] {
  git add ~/.config/dotfiles/.
  home-manager switch --flake ~/.config/dotfiles/.
  let gen = home-manager generations | detect columns --no-headers --combine-columns 0..4 | first | flatten | get column0 | to text
  git commit -m $gen
  git push
}

$env.path ++= ["~/.emacs.d/bin"]
