module Discipline  
  class Base    
    DISCIPLINE_CONFIG_FILE = File.expand_path("~/.discipline_config.yml")
    HOSTS_FILE = '/etc/hosts'
    DELIMITER_START = '# DISCIPLINE BLOCKED HOSTS START'
    DELIMITER_END = '# DISCIPLINE BLOCKED HOSTS END'
    
    def initialize
      begin
        @files = YAML.load(File.read(DISCIPLINE_CONFIG_FILE))
      rescue
        raise "Please create a valid config file at #{DISCIPLINE_CONFIG_FILE}"
      end
    end
    
    def on
      append = [clear_hosts_file]
      append << DELIMITER_START
      @files.each do |file|
        append << "0.0.0.0 #{file}"
      end
      append << DELIMITER_END
      
      write(append)
    end
    
    def off
      write([clear_hosts_file])
    end
    
    def clear_hosts_file
      hosts_file = File.read(HOSTS_FILE)
      hosts_file.gsub!(/#{DELIMITER_START}(.*)#{DELIMITER_END}/m, '')      
      hosts_file.strip
    end
    
    def write(append)
      File.open(HOSTS_FILE, 'w+') do |f| 
        f.puts append.join("\n")
      end
    end
  end
  
  class App < Thor
    include Thor::Actions

    desc "on", "Lock down this computer"
    def on
      base = Base.new
      base.on
    end

    desc "off", "Unlock this computer"
    def off
      base = Base.new
      base.off
    end
  end  
end