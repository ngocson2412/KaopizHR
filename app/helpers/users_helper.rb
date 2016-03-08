require 'net/http'
require 'json'
module UsersHelper
	def auth(code)
    host = YAML.load_file(Rails.root.join('config', 'settings.yml').to_s)[Rails.env]["host"]
	uri = URI("https://slack.com/api/oauth.access?client_id=2760961654.22987639603&client_secret=3213c7b05a20bdffdbfb1c42a94f1e2b&code=#{code}&redirect_uri=#{host}/report")
	res = 	Net::HTTP.get(uri)
	return JSON.parse(res)["access_token"]
    end

    def get_user(token)
    	uri=URI("https://slack.com/api/auth.test?token=#{token}")
    	res = Net::HTTP.get(uri)
    	return JSON.parse(res)
    end

    def post_report(text, token)
    	uri = URI("https://slack.com/api/chat.postMessage")
    	channel = "G0QQUSS8G"
    	res = Net::HTTP.post_form(uri, 'token'=>"#{token}", 'channel'=> "#{channel}", 'text' => "#{text}", 'as_user' => 'true')
    end

    def add_user(name,admin,token)
        User.create!(name: "#{name}", admin:to_boolean(admin), token:"#{token}" )
    end

    def to_boolean(string)
        string == 'true'
    end
end
