function similarity = cosine_similarity(A, B)
  similarity = dot(A, B) / (norm(A) * norm(B));
end
