function AES()
    % AES - Programmatic Modern Cryptography GUI
    % 100% Code-based implementation
    
    addpath('ENCRYPT', 'DECRYPT');
    
    % --- Theme Settings ---
    colors = struct(...
        'bg',      [0.1, 0.1, 0.1], ...
        'input',   [0.15, 0.15, 0.15], ...
        'cyan',    [0, 1, 1], ...
        'green',   [0.2, 1, 0.2], ...
        'white',   [0.9, 0.9, 0.9], ...
        'red',     [0.3, 0.1, 0.1], ...
        'blue',    [0.1, 0.2, 0.3]);
    
    % --- Create Main Figure ---
    hFig = figure('Name', 'AES - Modern Cryptography', ...
                  'NumberTitle', 'off', ...
                  'MenuBar', 'none', ...
                  'Color', colors.bg, ...
                  'Units', 'normalized', ...
                  'Position', [0.2, 0.2, 0.6, 0.6], ...
                  'Resize', 'on');

    % --- Header Section ---
    uicontrol('Style', 'text', 'String', 'MATLAB AES-Inspired Encryption', ...
              'Units', 'normalized', 'Position', [0.1, 0.92, 0.8, 0.05], ...
              'BackgroundColor', colors.bg, 'ForegroundColor', colors.cyan, ...
              'FontSize', 18, 'FontWeight', 'bold', 'FontName', 'Consolas');
              
    uicontrol('Style', 'text', 'String', 'Mohamad Chahed - 23103091063', ...
              'Units', 'normalized', 'Position', [0.1, 0.87, 0.8, 0.03], ...
              'BackgroundColor', colors.bg, 'ForegroundColor', colors.white, ...
              'FontSize', 11, 'FontName', 'Consolas');

    % --- Data Input Section ---
    uicontrol('Style', 'text', 'String', 'DATA INPUT', ...
              'Units', 'normalized', 'Position', [0.075, 0.82, 0.2, 0.03], ...
              'BackgroundColor', colors.bg, 'ForegroundColor', colors.white, ...
              'HorizontalAlignment', 'left', 'FontName', 'Consolas');
              
    default_input = '[1322  1232  1390  1376  1386  1362  1370; 3500  4157  4301  4094  4103  4301  4157; 1232  1232  1400  1232  1398  1362  1398; 2204  2594  2204  2594  2204  2429  2604; 3806  4112  4157  4085  4238  3743  4085; 1398  1400  1390  1250  1386  1378  1232; 3768  3912  3728  3792  3848  3176  3784]';
    hInput = uicontrol('Style', 'edit', 'Max', 2, 'Min', 0, ...
                       'String', default_input, ...
                       'Units', 'normalized', 'Position', [0.075, 0.55, 0.85, 0.27], ...
                       'BackgroundColor', colors.input, 'ForegroundColor', colors.cyan, ...
                       'FontName', 'Consolas', 'FontSize', 10, 'HorizontalAlignment', 'left');

    % --- Control Section (Middle) ---
    ctrl_y = 0.45;
    ctrl_w = 0.18;
    ctrl_h = 0.05;
    gap = 0.04;
    start_x = (1 - (4*ctrl_w + 3*gap))/2;
    
    uicontrol('Style', 'text', 'String', 'Password', 'Units', 'normalized', ...
              'Position', [start_x, ctrl_y + ctrl_h + 0.015, ctrl_w, 0.02], ...
              'BackgroundColor', colors.bg, 'ForegroundColor', colors.white, 'FontName', 'Consolas');
              
    uicontrol('Style', 'text', 'String', 'Repetitions', 'Units', 'normalized', ...
              'Position', [start_x + (ctrl_w+gap), ctrl_y + ctrl_h + 0.015, ctrl_w, 0.02], ...
              'BackgroundColor', colors.bg, 'ForegroundColor', colors.white, 'FontName', 'Consolas');

    hPass = uicontrol('Style', 'edit', 'String', 'Password', 'Units', 'normalized', ...
                      'Position', [start_x, ctrl_y, ctrl_w, ctrl_h], ...
                      'BackgroundColor', colors.input, 'ForegroundColor', colors.cyan, 'FontName', 'Consolas');
                      
    hReps = uicontrol('Style', 'edit', 'String', '1', 'Units', 'normalized', ...
                      'Position', [start_x + (ctrl_w+gap), ctrl_y, ctrl_w, ctrl_h], ...
                      'BackgroundColor', colors.input, 'ForegroundColor', colors.cyan, 'FontName', 'Consolas');
    
    hEncryptBtn = uicontrol('Style', 'pushbutton', 'String', 'ENCRYPT', ...
              'Units', 'normalized', 'Position', [start_x + 2*(ctrl_w+gap), ctrl_y, ctrl_w, ctrl_h], ...
              'BackgroundColor', [0.2, 0.2, 0.2], 'ForegroundColor', colors.green, ...
              'FontWeight', 'bold', 'FontName', 'Consolas');
              
    hDecryptBtn = uicontrol('Style', 'pushbutton', 'String', 'DECRYPT', ...
              'Units', 'normalized', 'Position', [start_x + 3*(ctrl_w+gap), ctrl_y, ctrl_w, ctrl_h], ...
              'BackgroundColor', [0.2, 0.2, 0.2], 'ForegroundColor', colors.green, ...
              'FontWeight', 'bold', 'FontName', 'Consolas');

    % --- Output Section ---
    uicontrol('Style', 'text', 'String', 'DATA OUTPUT', ...
              'Units', 'normalized', 'Position', [0.075, 0.40, 0.2, 0.03], ...
              'BackgroundColor', colors.bg, 'ForegroundColor', colors.white, ...
              'HorizontalAlignment', 'left', 'FontName', 'Consolas');
              
    hOutput = uicontrol('Style', 'edit', 'Max', 2, 'Min', 0, ...
                        'Units', 'normalized', 'Position', [0.075, 0.12, 0.85, 0.27], ...
                        'BackgroundColor', colors.input, 'ForegroundColor', colors.cyan, ...
                        'FontName', 'Consolas', 'FontSize', 10, 'HorizontalAlignment', 'left', ...
                        'Enable', 'inactive');

    % --- Footer QoL Section ---
    footer_y = 0.04;
    footer_w = 0.15;
    footer_h = 0.06;
    f_gap = 0.02;
    f_start_x = (1 - (2*footer_w + f_gap))/2;
    
    hCopyBtn = uicontrol('Style', 'pushbutton', 'String', 'COPY', ...
              'Units', 'normalized', 'Position', [f_start_x, footer_y, footer_w, footer_h], ...
              'BackgroundColor', colors.blue, 'ForegroundColor', colors.cyan, ...
              'FontWeight', 'bold', 'FontName', 'Consolas');
              
    hClearBtn = uicontrol('Style', 'pushbutton', 'String', 'CLEAR', ...
              'Units', 'normalized', 'Position', [f_start_x + footer_w + f_gap, footer_y, footer_w, footer_h], ...
              'BackgroundColor', colors.red, 'ForegroundColor', [1, 0.4, 0.4], ...
              'FontWeight', 'bold', 'FontName', 'Consolas');

    % --- Assign Callbacks AFTER all handles are created ---
    set(hEncryptBtn, 'Callback', @(s,e) encrypt_cb());
    set(hDecryptBtn, 'Callback', @(s,e) decrypt_cb());
    set(hCopyBtn,    'Callback', @(s,e) copy_cb());
    set(hClearBtn,   'Callback', @(s,e) clear_cb());

    % --- Callback Functions ---
    function encrypt_cb()
        idata = get_input_str(hInput);
        ukey = get(hPass, 'String');
        urep = str2double(get(hReps, 'String'));
        if isnan(urep), urep = 1; end
        try
            odata = encrypt_data(idata, urep, ukey);
            set(hOutput, 'String', num2str(odata));
        catch ME
            errordlg(ME.message, 'Encryption Error');
        end
    end

    function decrypt_cb()
        idata = get_input_str(hInput);
        val = str2num(idata);
        if isempty(val)
            errordlg('Invalid input format. Decryption requires a numeric matrix (e.g., [1 2; 3 4]).', 'Input Error');
            return;
        end
        ukey = get(hPass, 'String');
        urep = str2double(get(hReps, 'String'));
        if isnan(urep), urep = 1; end
        try
            odata = decrypt_data(val, urep, ukey);
            set(hOutput, 'String', char(odata));
        catch ME
            errordlg(ME.message, 'Decryption Error');
        end
    end

    function str = get_input_str(h)
        str = get(h, 'String');
        if iscell(str)
            % Join multiple lines with newlines
            str = strjoin(str, newline);
        elseif ischar(str) && size(str, 1) > 1
            % Convert 2D char matrix to 1D string correctly (row-wise)
            str = strjoin(cellstr(str), newline);
        end
    end

    function clear_cb()
        set(hOutput, 'String', '');
    end

    function copy_cb()
        txt = get(hOutput, 'String');
        if isempty(txt), return; end
        if ischar(txt)
            if size(txt, 1) > 1
                rows = cellstr(txt);
                rows = strtrim(rows);
                txt = ['[', strjoin(rows, '; '), ']'];
            else
                val = str2num(txt);
                if ~isempty(val) && isnumeric(val)
                    txt = ['[', strtrim(txt), ']'];
                end
            end
        elseif iscell(txt)
            txt = ['[', strjoin(strtrim(txt), '; '), ']'];
        end
        final_txt = char(txt);
        if ~isempty(final_txt)
            clipboard('copy', final_txt(:)');
        end
    end
end
