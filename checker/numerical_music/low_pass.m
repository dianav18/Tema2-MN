function signal = low_pass(signal, fs, cutoff_freq)
  X = fft(signal);
  f = (0:length(X)-1)*(fs/length(X));
  mask = f < cutoff_freq;
  X_filtered = X .* mask';
  signal = ifft(X_filtered);
  signal = signal / max(abs(signal));
  signal = signal(:);
endfunction

