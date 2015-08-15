require 'rubygems'
require 'json-schema'
require 'date'
def address
{
	first_name: 'Malcom',
	last_name: 'X',
	birthday: Date.today.rfc3339,
	address: {
	  street_address: '3840 Broadway',
	  city: 'New York City',
	  state: 'New York',
	  country: 'United States'
	}
}
end

def links
{links: {
    self: 'http://baseurl/tagged_manuscripts'
  }
}
end

def tagged_manuscript_data
	[{type: 'manuscripts',
	         id: '1',
	         attributes: {
			         accode: 'AA1001',
			         received_date: Date.today.rfc3339,
			         taxonomy: {
					         disciplines: [':id', ':id'],
					         concepts: [
							         {
									         facet: 'http://facet1',
									         id: 'http://concept1'
							         },
							         {
									         facet: 'http://facet1',
									         id: 'http://concept2'
							         }
					         ]
			         }
	         }
	        }
	]
end

def valid_schema?(schema,data)
	JSON::Validator.validate!(schema, data, strict: true)
end

puts tagged_manuscript_data

schema = "#{Dir.pwd}/tagged_manuscript_data_schema.json"

valid_schema?(schema,tagged_manuscript_data)