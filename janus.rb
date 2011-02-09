dep 'janus' do
  requires 'MacVim.app', 'mvim helper', 'git'

  met?   { File.directory?(File.join(ENV["HOME"], ".vim", ".git")) }
  before { shell "for i in ~/.vim ~/.vimrc ~/.gvimrc; do [ -e $i ] && mv $i $i.old; done; exit 0" }
  meet   { shell 'git clone git://github.com/carlhuda/janus.git ~/.vim' }
  after  { shell "cd ~/.vim && rake && exit 0" }
end

dep 'mvim helper' do
  requires 'MacVim.app'

  met? { which 'mvim' }
  meet { shell "ln -sf  '~/.babushka/build/MacVim-snapshot-57.tbz/MacVim-snapshot-57/mvim' /usr/local/bin/mvim" }
end

dep 'MacVim.app' do
  source "https://github.com/downloads/b4winckler/macvim/MacVim-snapshot-57.tbz"
end
