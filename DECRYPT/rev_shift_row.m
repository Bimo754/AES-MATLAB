function output_data = rev_shift_row(input_data)
    sz = size(input_data);
    output_data = input_data;

    for ii = 1:sz(1)
        output_data(ii, :) = circshift(input_data(ii, :), [0, (ii - 1)]);
    end
end
