function [x, y] = parse_data(filename)
    fileID = fopen(filename, 'r');
    
    if fileID == -1
        error('File cannot be opened: %s', filename);
    end

    n = fscanf(fileID, '%d', 1); 
    x = fscanf(fileID, '%d', n + 1);
    y = fscanf(fileID, '%d', n + 1);

    x = x(:);
    y = y(:); 

    fclose(fileID);
end
