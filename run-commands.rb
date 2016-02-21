require 'pry'

def reset
  `rm -rf .git`
  `rm  *.txt`
  `echo "foo" > foo.txt`
  `git init`
  `git add foo.txt`
  `git commit -m "initial commit"`
end

lines = File.readlines('timmocs-commands.sh').map(&:chomp)
# puts lines
Dir.chdir("../timmocs_commands")
reset

lines.each do |line|
  if line == ''
    puts
  elsif line == 'reset'
    reset
  else
    begin

      line.gsub!(/\w+\~\d+/) { |x| `git rev-parse #{x}`.chomp.slice(0...7) }

      branch = `git rev-parse --abbrev-ref HEAD`.chomp
      puts "[#{branch}]: #{line}".chomp
      `#{line}`.tap do |output|
        print output unless output == ''
      end
    rescue Exception => e
      raise e, {error: e.to_s, line: line}
    end
  end
end


