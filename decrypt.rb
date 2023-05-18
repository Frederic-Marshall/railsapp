require 'cgi'
require 'json'
require 'active_support'

def verify_and_decrypt_session_cookie(cookie, secret_key_base, session_key)
  cookie = CGI::unescape(cookie)
  salt   = 'authenticated encrypted cookie'
  encrypted_cookie_cipher = 'aes-256-gcm'
  serializer = ActiveSupport::MessageEncryptor::NullSerializer

  key_generator = ActiveSupport::KeyGenerator.new(secret_key_base, iterations: 1000)
  key_len = ActiveSupport::MessageEncryptor.key_len(encrypted_cookie_cipher)
  secret = key_generator.generate_key(salt, key_len)
  encryptor = ActiveSupport::MessageEncryptor.new(secret, cipher: encrypted_cookie_cipher, serializer: serializer)
  
  encryptor.decrypt_and_verify(cookie, purpose: "cookie.#{session_key}")
end

puts "---"
cookie = gets.chomp

puts "---"
secret_key_base = gets.chomp

puts "---"
session_key = gets.chomp

result = verify_and_decrypt_session_cookie(cookie, secret_key_base, session_key)

puts result.inspect