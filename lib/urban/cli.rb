require 'optparse'
require 'ostruct'
require 'urban/dictionary'

module Urban
  class CLI

    def initialize(args = ARGS)
      @options = parse(args)
    end

    # Main entry point to the CLI
    def run
      true
    end

    # result = args.first ? define(args.join(' ')) : random

    private
    # Parse options passed in from the CLI
    #
    # @param [Array<String>] args ARGV is the default
    # @return [Object] options in a struct
    def parse(args)
      options = OpenStruct.new
      opts = OptionParser.new do |o|
        o.banner = "Usage: urban [OPTION]... [PHRASE]"
        o.separator "Search http://urbandictionary.com for definitions"

        o.separator ''
        o.on('-l', '--list', 'List all definitions') do
          puts opts
          return nil
        end

        o.on('-r', '--random', 'Find random word on urban dictionary') do
          puts opts
          return nil
        end

        o.on('-h', '--help', 'Show this message') do
          puts opts
          return nil
        end

        o.on('--version', 'Show version') do
          puts opts.ver
          puts "Urban #{Urban::VERSION} (c) Thomas Miller"
          return nil
        end

      end
      opts.parse!(args)
      options
    end

  end
end
