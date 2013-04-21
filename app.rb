class TestApplication < Sinatra::Application

	h = BitcoinRPC.new('http://bitcoinrpc:6Y1JbwY9MHxHwK2Y9mfaUWJXQiRyy941bVFVHJQDYa5F@127.0.0.1:8332')

	get '/' do
		erb :home
	end

	post '/' do
		title = params[:title],
		target = params[:target],
		email = params[:email],
		obca = params[:obca],

		#Do sanity checks on all of the inputs.
		flag = true
		#First check the bitcoin address.
		validCheck = h.validateaddress(obca)
		if !validCheck["isvalid"]
			flag = false
		end
		#Now lets check the validity of the email address.
		if !email.include? '@'
			flag = false
		end
		if flag
			@dare = Dare.create(
				:title => title,
				:target => target,
				:email => email,
				:obca => obca,
				:createdon => DateTime.now
			)
			@dare.save!
		end
		erb :home
	end

end 
