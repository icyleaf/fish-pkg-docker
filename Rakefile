require 'awesome_print'


def parse_options(name, line, condition = nil, options = [])
  complete = ['complete', '-f', '-c', name]
  complete.push("-n", "'#{condition}'") unless condition.to_s.empty?

  options.each do |k, v|
    complete.push(k, v)
  end if complete.count > 0

  keys, desc = line.strip.split /\s{2,50}/
  keys.split(', ').each do |k|
    if k.include?'--'
      complete.push("-l", k.split("=")[0].gsub("-", ""))
    elsif k.include?'-'
      complete.push("-s", k.gsub("-", ""))
    end
  end

  complete.push("-d", "\"#{desc}\"")
  complete
end

def completion_options(name, line)
  parse_options(name, line, "__fish_docker_needs_command")
end

def completion_command(name, line)
  command = line.strip.split(/\s{2,10}/).first
  complete = parse_options(name, line, "__fish_docker_needs_command", {"-a": command})
  options = []

  output = `#{name} #{command} --help`.split("\n")
  output.select {|line| line.match(/^\s{2}-/) }.each do |line|
    options.push(parse_options(name, line, "__fish_docker_using_command #{command}"))
  end

  {
    command: command,
    complete: complete,
    options: options
  }
end

task :complete, :name do |task, options|
  name = options[:name] || 'docker'
  output = `#{name} --help`.split("\n")
  options = output.select {|line| line.match(/^\s{2,10}-/) }#.map {|s| s.strip.split(/\s{2,10}/)}
  commands = output.select { |line| line.match(/^\s{2,10}(\w+)\s/) }#.map {|s| s.strip.split(/\s{2,10}/)}

  puts "# Options"
  options.each do |line|
    puts completion_options(name, line).join(" ")
  end
  puts "\n"

  puts "# Subcommands"
  commands.each do |line|
    data = completion_command(name, line)
    puts "## #{data[:command]}"
    puts data[:complete].join(" ")
    data[:options].each do |complete|
      puts complete.join(" ")
    end
    puts "\n"
  end
end