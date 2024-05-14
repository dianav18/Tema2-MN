function x = oscillator(freq, fs, dur, A, D, S, R)
    t = 0:1/fs:dur;
    t = t(1:end-1);

    x = sin(2*pi*freq*t);

    attack_samples = floor(A * fs);
    decay_samples = floor(D * fs);
    release_samples = floor(R * fs);
    total_samples = length(t);
    sustain_samples = total_samples - (attack_samples + decay_samples + release_samples);
    attack_envelope = linspace(0, 1, attack_samples);
    decay_envelope = linspace(1, S, decay_samples);
    sustain_envelope = S * ones(1, sustain_samples);
    release_envelope = linspace(S, 0, release_samples);
    envelope = [attack_envelope, decay_envelope, sustain_envelope, release_envelope];
    
    if length(envelope) > total_samples
        envelope = envelope(1:total_samples);
    elseif length(envelope) < total_samples
        envelope = [envelope, zeros(1, total_samples - length(envelope))];
    end

    x = x .* envelope;
    x = x(:);
    envelope = envelope(:);
end
