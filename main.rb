require 'sinatra'

def load_pictures
  Dir.glob("public/slideshow_pictures/*.{jpg,JPG}")
end

get '/' do
  @pictures = load_pictures
  erb :home
end

get'/uploads' do 
	erb :uploads
end

post "/uploads" do 
  File.open('public/slideshow_pictures/' + params['file'][:filename], "w") do |f|
    f.write(params['file'][:tempfile].read)
  end
  "Uploaded."
end

