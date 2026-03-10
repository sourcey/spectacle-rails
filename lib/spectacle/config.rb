module Spectacle
  class Config
    class << self
      # Path to the OpenAPI/Swagger spec file (JSON or YAML)
      attr_writer :spec_file
      def spec_file
        @spec_file || File.join(Rails.root, 'public/openapi.yaml')
      end

      # Output directory for generated docs
      attr_writer :output_dir
      def output_dir
        @output_dir || File.join(Rails.root, 'public/docs')
      end

      # Custom logo file path
      attr_writer :logo
      def logo
        @logo || nil
      end

      # Generate embeddable output (no <html>/<body> tags)
      attr_writer :embeddable
      def embeddable
        @embeddable || false
      end

      # Embed all assets into a single HTML file
      attr_writer :single_file
      def single_file
        @single_file || false
      end

      # Path to the spectacle CLI binary
      # Defaults to the globally installed `spectacle` command via npx
      attr_writer :spectacle_bin
      def spectacle_bin
        @spectacle_bin || 'npx spectacle'
      end

      def reset!
        @spec_file = nil
        @output_dir = nil
        @logo = nil
        @embeddable = nil
        @single_file = nil
        @spectacle_bin = nil
      end
    end
  end
end
