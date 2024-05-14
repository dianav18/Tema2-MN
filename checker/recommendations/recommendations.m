function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
    mat = read_mat(path);
    processed_mat = preprocess(mat, min_reviews);
    [~, ~, V] = svds(processed_mat, num_features);
    similarities = zeros(1,size(V, 2));
    V = V';
    for i = 1:size(V, 2)
        similarities(i) = cosine_similarity(V(:, liked_theme), V(:, i));
    endfor
    [~, sorted_indices] = sort(similarities, 'descend');
    sorted_indices(sorted_indices == liked_theme) = [];
    recoms = sorted_indices(1:num_recoms);
end