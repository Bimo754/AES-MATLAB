function final_data = encrypt_data(input_data, reps, user_key)
    if length(user_key) < 4
        error('Invalid Key: Minimum length is 4 characters.');
    end
    if isempty(input_data)
        error('Invalid Input: Data cannot be empty.');
    end
    
    % Core Initialization
    crypt_key = gen_key(user_key);
    final_data = convert_sq(input_data);
    
    % Pre-calculate polynomial key for performance
    rows = size(final_data, 1);
    poly_key = generate_poly_key(crypt_key, rows);

    % Initial Round
    final_data = add_key(final_data, crypt_key);

    % Main Rounds
    for ii = 1:reps
        final_data = shift_row(final_data);
        final_data = mix_col(final_data, poly_key);
        final_data = add_key(final_data, crypt_key);
    end

    % Final Round
    final_data = shift_row(final_data);
    final_data = add_key(final_data, crypt_key);
end

function poly_key = generate_poly_key(key, rows)
    tmp = double(key);
    poly_key = zeros(rows, 1);
    idx = 1;
    while idx <= rows
        digit = mod(fix(tmp), 10);
        if digit == 0, digit = 5; end
        poly_key(idx) = digit;
        tmp = tmp / 10;
        if tmp < 1 && idx < rows
            tmp = double(key) + idx;
        end
        idx = idx + 1;
    end
end
