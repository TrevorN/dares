require 'data_mapper'

DataMapper.setup :default, {
  :adapter  => 'postgres',
  :host     => 'localhost',
  :database => 'dares',
  :user     => 'postgres',
}

class Dare
	include DataMapper::Resource

	property :id,		Serial		#This is our autoincrementing ID.
	property :title,	String		#The title of the dare.
	property :obca,		String		#This is the owner's bitcoid address.
	property :email,	String		#This is the owner's email address.
	property :target,	String		#This is what the owner needs to make it!
	property :response,	String		#The url to the youtube video, to be embedded.
	property :createdon,	DateTime	#The time that this dare was created.

	has n, :contributors
end

class Contributor
	include DataMapper::Resource

	property :id,		Serial		#This is our autoimcrementing ID.
	property :email,	String		#This is the contributors email
	property :cbca,		String		#This is the contributors bitcoin address
	property :pledge,	Decimal		#This is the amount they pledged
	
	belongs_to :dare
end

DataMapper.finalize
DataMapper.auto_upgrade!
