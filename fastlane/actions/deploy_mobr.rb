module Fastlane
  module Actions
    module SharedValues
      DEPLOY_MOBR_CUSTOM_VALUE = :DEPLOY_MOBR_CUSTOM_VALUE
    end

    class DeployMobrAction
      @@releases_folder = "releases"
      @@api_key = ""
      @@api_user = ""
      @@app_id = ""
      @@platform_id = "1"
      @@base_url = "http://mobrelease.concretecorp.com.br"
      @@release_url = "#{@@base_url}/api/v1/release/?format=json&username=#{@@api_user}&api_key=#{@@api_key}"
      @@slug = ""

      def self.run(params)
        require 'rest_client'
        require 'json'

        RestClient.log = $stdout

        puts("Iniciando publicacao no Mobile Release");

        version_name = Time.now.strftime("%d-%m-%Y-%Hh-%Mm")
        upload_file(create_release(version_name))
        download_url(version_name)
      end
      def self.download_url(version_name)
        "#{@@base_url}/application/#{@@slug}/iphone/#{version_name}/"
      end

      def self.upload_file_url(release_id)
        "#{@@base_url}/api/v1/releasefile/#{release_id}/?format=json&username=#{@@api_user}&api_key=#{@@api_key}"
      end

      def self.create_release(version_name)
        json = {
          :application => "/api/v1/application/#{@@app_id}/",
          :platform => "/api/v1/platform/#{@@platform_id}/",
          :version => version_name,
          :release_notes => ""
        }
        puts("Criando release com url:#{@@release_url}")
        response = RestClient.post(@@release_url,json.to_json,:content_type => :json, :accept => :json)
        JSON.parse(response)['id']
      end

      def self.upload_file(release_id)
        url = upload_file_url(release_id)
        file_name = fetch_file_name
        puts("Fazendo upload do ipa :#{file_name} para url: #{url}")
        RestClient.post url, :file => File.new(file_name, 'rb')
      end

      def self.fetch_file_name
        Dir["#{@@releases_folder}/*.ipa"][0]
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "A short description with <= 80 characters of what this action does"
      end

      def self.available_options
        # Define all options your action supports.
        # The environment variable (last parameters) is optional, remove it if you don't need it
        # You can add as many parameters as you want
        [
          # ['path', 'Describe what this parameter is useful for', 'ENVIRONMENT_VARIABLE_NAME'],
          # ['second', 'Describe what this parameter is useful for']
        ]
      end

      def self.output
        # Define the shared values you are going to provide
        # Example
        [
          # ['NOVA_CUSTOM_VALUE', 'A description of what this value contains']
        ]
      end

      def self.author
        # So no one will ever forget your contribution to fastlane :) You are awesome btw!
        '[thiagolioy]'
      end
    end

  end
end
