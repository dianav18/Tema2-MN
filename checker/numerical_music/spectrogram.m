function [S, f, t] = spectrogram(signal, fs, window_size)
    N = length(signal);
    num_windows = floor(N / window_size);
    
    S = zeros(window_size, num_windows);
    freq_vector = zeros(window_size, 1);
    time_vector = zeros(num_windows, 1);
    
    hann_window = hanning(window_size);
    
    for window_idx = 1:num_windows
        idx_start = (window_idx - 1) * window_size + 1;
        idx_end = idx_start + window_size - 1;
        window_data = signal(idx_start:idx_end);
        windowed_data = window_data .* hann_window;
        fft_output = fft(windowed_data, window_size * 2);
        fft_half = fft_output(1:window_size);
        S(:, window_idx) = abs(fft_half);
    endfor
    
    for idx_freq = 1:window_size
        freq_vector(idx_freq) = (idx_freq - 1) * (fs / (2 * window_size));
    endfor
    
    for idx_time = 1:num_windows
        time_vector(idx_time) = (idx_time - 1) * (window_size / fs);
    endfor
    
    f = freq_vector;
    t = time_vector;
endfunction
