# add rbenv's bin/ to path
export PATH="{{ home_path }}/.rbenv/bin:$PATH"

# enable shims and autocompletion
eval "$(rbenv init -)"

