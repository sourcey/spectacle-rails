module Spectacle
  class DSL
    class << self

      # Install Spectacle using `npm`
      #
      # @return success
      #
      def install
        system 'npm install -g spectacle-docs'
      end

      # Generate Spectacle documentation
      #
      # @return success
      #
      def generate
        spectacle arguments
      end

      # Run the Spectacle shell command
      #
      # @param args the command line arguments to pass to spectacle
      #
      # @return success
      #
      def spectacle args
        # system "spectacle #{args}"
        system "cd #{Config.spectacle_lib_dir} && node bin/spectacle-cli #{args}"
      end

      # Generate Spectacle command line arguments
      #
      # @return string
      #
      def arguments
        s = '' #'-C '
        s += '-e ' if Config.embedded_mode
        s += "-l #{Config.logo_file} " if Config.logo_file
        s += Config.spec_file
      end

      # Replace paths in generated static documentation HTML
      #
      # @return success
      #
      def replace_static_asset_paths
        if Config.target_dir.include?('/public/')
          base_dir = Config.target_dir.match('/public(.*)')[1]
          html_path = "#{Config.target_dir}/index.html"
          contents = File.open(html_path, &:read)
          contents.gsub!('/images', base_dir + '/images')
          contents.gsub!('/stylesheets', base_dir + '/stylesheets')
          contents.gsub!('/javascripts', base_dir + '/javascripts')
          File.write(html_path, contents)
        end
      end

      # Copy generated static documentation HTML into the public folder
      #
      # @return success
      #
      def copy_static
        build_dir = "#{Config.spectacle_lib_dir}/public"

        # Prepare the target folder
        FileUtils.rm_rf Config.target_dir if File.exist?(Config.target_dir)
        FileUtils.mkdir_p Config.target_dir

        # Copy the SCSS files from the spectacle source tree to the
        # assets folder
        puts "Copying HTML from #{build_dir}/* to #{Config.target_dir}"
        FileUtils.copy_entry build_dir, Config.target_dir

        replace_static_asset_paths
      end

      # # Copy generated documentation HTML into the asset pipeline for dynamic
      # # inclusion.
      # #
      # # @return success
      # #
      # def copy_dynamic
      #   source_dir = "#{Config.spectacle_lib_dir}/app"
      #   build_dir = "#{Config.spectacle_lib_dir}/public"
      #
      #   gem_dir = File.expand_path File.join(File.dirname(__FILE__), '../../')
      #   views_dir = "#{gem_dir}/app/views/spectacle"
      #   assets_dir = "#{gem_dir}/vendor/assets"
      #
      #   # Prepare the assets pipeline
      #   FileUtils.mkdir_p views_dir
      #   FileUtils.mkdir_p "#{assets_dir}/stylesheets"
      #   FileUtils.mkdir_p "#{assets_dir}/javascripts"
      #
      #   # Copy compiled HTML to the views folder as a ERB partial.
      #   # This way it can be included in any page.
      #   puts "Copying HTML from #{build_dir}/index.html to #{views_dir}/_docs.html.erb"
      #   FileUtils.cp "#{build_dir}/index.html",
      #                "#{views_dir}/_docs.html.erb"
      #
      #   # Copy the SCSS files from the spectacle source tree to the
      #   # assets folder
      #   puts "Copying SCSS from #{source_dir}/stylesheets/* to #{assets_dir}/stylesheets"
      #   FileUtils.cp Dir.glob("#{source_dir}/stylesheets/*"),
      #                "#{assets_dir}/stylesheets"
      #
      #   # Copy the compiled CSS files. These can be used optionally instead
      #   # of SCSS files if no configuration is required.
      #   # FileUtils.cp "#{build_dir}/stylesheets/spectacle.css",
      #   #              "#{assets_dir}/stylesheets/spectacle.css"
      #   # FileUtils.cp "#{build_dir}/stylesheets/foundation.css",
      #   #               "#{assets_dir}/stylesheets/foundation.css"
      #
      #   # Copy the compiled JS files to the assets folder
      #   puts "Copying JS from #{build_dir}/javascripts/spectacle.js to #{assets_dir}/javascripts/spectacle.js"
      #   FileUtils.cp "#{build_dir}/javascripts/spectacle.js",
      #                "#{assets_dir}/javascripts/spectacle.js"
      #
      #   replace_static_asset_paths
      # end

      # # Identical to Open3.capture3, except that it rescues runtime errors
      # #
      # # @param env optional (as `Kernel.system')
      # # @param *cmd the command and its (auto-escaped) arguments
      # # @param opts optional a hash of options (as `Kernel.system')
      # #
      # # @return [stdout, stderr, success]
      # #
      # def sh *cmd
      #   begin
      #     stdout, stderr, status = Open3.capture3(*cmd)
      #     [stdout, stderr, status.success?]
      #   rescue
      #     [$/, $/, false]
      #   end
      # end
    end
  end
end
