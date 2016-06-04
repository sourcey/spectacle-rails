module Spectacle
  class Config
    class << self
      attr_writer :spec_file
      def spec_file
        @spec_file || File.join(Rails.root, 'public/swagger.json')
      end

      attr_writer :target_dir
      def target_dir
        @target_dir || File.join(Rails.root, 'public/v1/docs')
      end

      attr_writer :logo_file
      def logo_file
        @logo_file || nil
      end

      attr_writer :embedded_mode
      def embedded_mode
        @embedded_mode || false
      end

      # Get the Spectacle library directory
      #
      # @return path
      #
      attr_writer :spectacle_lib_dir
      def spectacle_lib_dir
        return @spectacle_lib_dir if @spectacle_lib_dir
        if Gem.win_platform?
          File.join(node_prefix, 'node_modules', 'spectacle-docs')
        else
          File.join(node_prefix, 'lib', 'node_modules', 'spectacle-docs')
        end
      end

      # # Get the Spectacle bin directory
      # #
      # # @return path
      # #
      # def spectacle_bin_path
      #   return @spectacle_bin_path if @spectacle_bin_path
      #   if Gem.win_platform?
      #     File.join(node_prefix, 'bin', 'spectacle')
      #   else
      #     File.join(node_prefix, 'spectacle')
      #   end
      # end

      # Get the Node.js install prefix
      #
      # @return path
      #
      def node_prefix
        `npm config get prefix`.strip
      end
    end
  end
end
