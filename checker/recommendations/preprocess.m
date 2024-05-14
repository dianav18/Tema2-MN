function reduced_mat = preprocess(mat, min_reviews)
    review_counts = sum(mat ~= 0, 2); % '2' for summing across rows
    valid_rows = review_counts >= min_reviews;
    reduced_mat = mat(valid_rows, :);
end
