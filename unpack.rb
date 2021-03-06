GIT_DIR = __dir__
to = Dir.pwd
puts to
raise "Don't run from the git dir" if to == GIT_DIR
Dir.chdir(GIT_DIR) do
  system("git pull --all")
  system("git checkout master")
  branches = `git branch`.split(/\n/).map {|s| s.sub(/^\*?\s+/, '')}
  branches.each do |branch|
    dest = File.join(to, branch)
    Dir.mkdir(dest) unless File.exist?(dest)
    system "git archive #{branch} | tar -x -C #{dest}"
  end
end
 
