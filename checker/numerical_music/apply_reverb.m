function signal = apply_reverb(signal, impulse_response)
    impulse_response = stereo_to_mono(impulse_response);
    convolved_signal = fftconv(signal, impulse_response);
    max_val = max(abs(convolved_signal));
    if max_val > 0
        signal = convolved_signal / max_val;
    else
        signal = convolved_signal;
    end
    signal = signal(:);
end
