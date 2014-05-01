# encoding: utf-8
class MyApp < Sinatra::Application
	get "/" do
		@title = "Welcome to MyApp"	

    #Replace
    # @minified_css = "#{File.mtime('/public/blob.css').to_i}"
    # @minified_js = "#{File.mtime('/public/blob.js').to_i}"
    # @css = "style.css"
    # @js = "app.js"
		erb :main
	end
end