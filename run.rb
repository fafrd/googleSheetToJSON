#!/usr/bin/env ruby
# require 'pry'
require 'net/http'
require 'json'

sheetKey = "1sOiiSa2FkMQjkgDVUhnQW7pyAG1f3d9EMPzrQoox2oQ"
url = "https://spreadsheets.google.com/feeds/list/" + sheetKey + "/od6/public/values?alt=json"

def getTokens(url)
	uri = URI(url)
	respRaw = Net::HTTP.get(uri)
	respJSON = JSON.parse(respRaw)

	tokens = Hash.new
	for token in respJSON["feed"]["entry"]
		rawToken = token["content"]["$t"]
		cleanToken = /token: (.+),+|token: (.+)/.match(rawToken).captures.reject!(&:nil?)[0]
		tokens[token["title"]["$t"]] = cleanToken
	end

	return tokens
end

def composeJSON(tokens)
	data  = Array.new
	i = 0
	for token in tokens
		data[i] = {"address" => token[1], "symbol" => token[0], "decimal" => 0, "type" => "default"}
		i += 1
	end

	return data.to_json
end

tokens = getTokens(url)
json = composeJSON(tokens)
# binding.pry

puts json
