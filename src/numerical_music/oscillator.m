function x = oscillator(freq, fs, dur, A, D, S, R)
  x = 0;
  t = (0:1/fs:dur-1/fs)';
  x = sin(2*pi*freq*t);
  attack_samples = floor(A*fs);
  decay_samples = floor(D*fs);
  sustain_samples = floor(S*fs);
  release_samples = floor(R*fs);
  attack_envelope = linspace(0, 1, attack_samples)';
  decay_envelope = linspace(1, S, decay_samples)';
  sustain_envelope = S*ones(sustain_samples, 1);
  release_envelope = linspace(S, 0, release_samples)';
  envelope = [attack_envelope; decay_envelope; sustain_envelope; release_envelope];
  x = x.*envelope;

endfunction

