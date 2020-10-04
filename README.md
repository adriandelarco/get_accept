# GetAccept [![Gem Version](https://badge.fury.io/rb/get_accept.svg)](https://badge.fury.io/rb/get_accept)

GetAccept is Ruby wrapper around the API for the GetAccept eSignature service. Documentation for request and response data can be found at https://app.getaccept.com/api/


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'get_accept'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install get_accept

## Usage

Get an API token

```ruby
      token = GetAccept::Api.get_token({
              email: 	  'getaccept_user@mailinator.com',
              password: 'password',
              client_id: 'a8j23', # Optional
              entity_id: 'asjklf' # Optional. Your GetAccept customer id. Useful if ou belong to multiple organizations using GetAccept.
      })

      #=> 	
            {
          	    "access_token": "ACCESS_TOKEN", # JWT
          	    "expires_in": 1209600 # 2 weeks in seconds
          	}

```

Insantiate your client

```ruby
  api = GetAccept::Api.new({
                        	  token: 'ACCESS_TOKEN',
                          })
```

Now you can call endpoints with methods matching the resource names:

```ruby
api.document.all

# =>   
      [
          {
      	    "id": "qnerhxyp"
      	    "name": "The big proposal",
      	    "status": "sent",
      	    "value": 90000,
      	    "company_name": "Customer A",
      	    "sender_name": "Elon Musk",
      	    "created_at": "2015-10-21T14:42",
      	    "recipients": [
      	      {
      	        "first_name": "Dave",
      	        "last_name": "Nelson",
      	        "email": "dave@crowdengine.com",
      	        "thumb_url": "https://media.getaccept.com/contact/b3221e55cd0d1c7e6bdf45fa4aa0a259.png",
      	        "company_name": "Customer A"
      	      }
      	    ]
      	  },
      	  ...
       ]
```

```ruby
api.document.create({
                  		"name": "Test Document name",
                  		"file_ids": "562480bb1c86d.pdf,562120db1d23e.pdf",
                  		"file_content": "",
                  		"file_url": "",
                  		"type": "sales",
                  		"value": 9400,
                  		"external_id": "doc_19953",
                  		"company_name": "Tesla Motors Inc.",
                  		"company_number": "54-114492",

                  		"recipients": [{
                  			"email": "samir.smajic@getaccept.com",
                  			"first_name": "Samir",
                  			"last_name": "Smajic",
                  			"mobile": "+467012345678",
                  			"role": "signer",
                  			"order_num": 0,
                  			"verify_qna": true,
                  			"verify_qna_open": true,
                  			"verify_qna_sign": false,
                  			"verify_qna_question": "Enter personal ID-number",
                  			"verify_qna_answer": "720102-3456",
                  			"verify_sms": true,
                  			"verify_sms_open": false,
                  			"verify_sms_sign": true
                  		}],
                  		"is_signing_biometric": false,
                  		"is_signing_initials": true,
                  		"expiration_date": "2015-12-01",
                  		"is_reminder_sending": true,
                  		"is_signing_forward": true,
                  		"is_sms_sending": false,
                  		"is_automatic_sending": false,
                  		"custom_fields": [
                  			{ "id": "x129dba", "value": "Freemont"},
                  			{ "name": "Delivery state", "value": "CA"}
                  		]
                  	})

# =>
    {
  	  "id": "xy45za9",
  	  "name": "The big proposal",
  	  "external_id": "p_1552",
  	  "value": 8400,
  	  "type": "sales",
  	  "tags": "",
  	  "company_name": "Justin Productions",
  	  "company_id": "8nj6hvkn",
  	  "company_logo_url": "",
  	  "is_selfsign": false,
  	  "is_signing_biometric": false,
  	  "is_signing_initials": false,
  	  "is_private": false,
  	  "status": "viewed",
  	  "send_date": "2015-10-21T14:42",
  	  "sign_date": null,
  	  "user_id": "jxpv735n",
  	  "email_send_template_id": "d18nabcx",
  	  "email_send_subject": "Sending you the proposal",
  	  "email_send_message": "",
  	  "is_signing": true,
  	  "is_signing_order": false,
  	  "is_video": false,
  	  "expiration_date": "2015-12-29",
  	  "is_scheduled_sending": false,
  	  "scheduled_sending_time": "",
  	  "is_reminder_sending": true,
  	  "video_id": 0,
  	  "thumb_url": "https://media.getaccept.com/preview/aw8nkenx/n24uxxwn.png",
  	  "preview_url": "https://app.getaccept.com/v/a64uqvwn/x8gea49p/a/12f87050ec8f3d8a2e12b4569",
  	  "recipients": [
  	        {
  	            "fullname": "Sam Tester",
  	            "first_name": "Sam",
  	            "last_name": "Tester",
  	            "email": "sam.tester@getaccept.com",
  	            "mobile": "+467012345678",
  	            "thumb_url": "",
  	            "role": "signer",
  	            "order_num": "1"
  	        }
  	    ]
  	}
```

Browse the code in the lib/resources folder to get an idea of what methods are available.

## Error handling

## Error Handling
API response codes in the 400 range will raise a GetAccept::RequestError, while 500+ will raise a GetAccept::ServerError.

Errors the following attributes, populated based on what the API returns:

```ruby
@response_code = data[:response_code]
@response_body = data[:response_body]
@message = data[:message]
@type = data[:type]
@errors = data[:errors]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/crowdengine/get_accept. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

Please include tests with your pull requests.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
