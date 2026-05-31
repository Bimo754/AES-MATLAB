function output_data = convert_sq(input_data)
    input_data = input_data(:)';
    len = numel(input_data);
    m = ceil(sqrt(len));
    
    output_data = double(input_data);
    if numel(output_data) < m*m
        output_data(numel(output_data)+1 : m*m) = 124;
    end
    
    output_data = reshape(output_data, [m, m]);
end
