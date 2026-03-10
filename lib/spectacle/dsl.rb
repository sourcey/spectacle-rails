module Spectacle
  class DSL
    class << self

      # Install spectacle-docs via npm
      #
      # @return [Boolean] success
      #
      def install
        system 'npm install -g spectacle-docs'
      end

      # Generate documentation from the configured spec file
      #
      # @return [Boolean] success
      #
      def generate
        cmd = build_command
        puts "Running: #{cmd}"
        system cmd
      end

      # Validate the spec file without generating output
      #
      # @return [Boolean] success
      #
      def validate
        system "#{Config.spectacle_bin} validate #{Config.spec_file}"
      end

      private

      # Build the spectacle CLI command string
      #
      # @return [String] the full command
      #
      def build_command
        args = ['build']
        args << Config.spec_file
        args << "-o #{Config.output_dir}"
        args << '--embed' if Config.embeddable
        args << '--single-file' if Config.single_file
        args << "--logo #{Config.logo}" if Config.logo
        args << '--quiet'

        "#{Config.spectacle_bin} #{args.join(' ')}"
      end
    end
  end
end
