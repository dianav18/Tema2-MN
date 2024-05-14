function [S, f, t] = spectrogram(signal, fs, window_size)
    % Ensure the signal is a column vector
    if isrow(signal)
        signal = signal';
    end

    % Calculate the number of windows
    signal_size = length(signal);  % Total number of samples in the signal
    number_of_windows = floor(signal_size / window_size);

    % Initialize the spectrogram matrix
    S = zeros(window_size/2 + 1, number_of_windows);

    % Prepare the Hanning window
    hann_window = hanning(window_size);

    % Compute the FFT for each window
    for i = 1:number_of_windows
        % Starting and ending indices for the signal segment
        start_idx = (i-1) * window_size + 1;
        end_idx = start_idx + window_size - 1;

        % Apply the Hanning window and compute the FFT
        windowed_signal = signal(start_idx:end_idx) .* hann_window;
        fft_result = fft(windowed_signal, 2 * window_size);

        % Store the magnitude of the FFT, only the first half
        S(:, i) = abs(fft_result(1:window_size/2 + 1));
    end

    % Calculate the frequency vector
    f = (0:window_size/2)' * (fs / (2 * window_size));

    % Calculate the time vector
    t = (0:number_of_windows-1)' * (window_size / fs);
end
