function mono = stereo_to_mono(stereo)
  mono = stereo;

  % Normalize
  mono = mono / max(abs(mono));
endfunction

