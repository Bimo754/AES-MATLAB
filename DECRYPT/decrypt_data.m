function final_data = decrypt_data(input_data, reps, user_key)
    if length(user_key) < 4
        error('Invalid Key: Minimum length is 4 characters.');
    end
    if isempty(input_data)
        error('Invalid Input: Data cannot be empty.');
    end

    % Core Initialization
    crypt_key = gen_key(user_key);
    
    % Pre-calculate polynomial key for performance
    rows = size(input_data, 1);
    poly_key = generate_poly_key(crypt_key, rows);

    % Reverse Initial Transformation
    final_data = remove_key(input_data, crypt_key);
    final_data = rev_shift_row(final_data);

    % Reverse Main Rounds
    for ii = 1:reps
        final_data = remove_key(final_data, crypt_key);
        final_data = rev_mix_col(final_data, poly_key);
        final_data = rev_shift_row(final_data);
    end

    % Final Reverse Transformation
    final_data = remove_key(final_data, crypt_key);
    final_data = convert_line(final_data);
    final_data = char(final_data);
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
