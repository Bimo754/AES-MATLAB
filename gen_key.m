function crypt_key = gen_key(user_key)
    crypt_key = sum(double(user_key));
    crypt_key = fix((crypt_key + 27) / 3);
end
