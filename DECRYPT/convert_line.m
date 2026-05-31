function output_data = convert_line(input_data)
    output_data = input_data(:)';
    idx = find(output_data == 124, 1);
    if ~isempty(idx)
        output_data = output_data(1:idx-1);
    end
end
