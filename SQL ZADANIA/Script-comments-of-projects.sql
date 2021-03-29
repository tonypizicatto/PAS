SELECT projects.name,
       projects.id,
       COUNT(comments.commentable_id) as num_of_comments
FROM projects
         LEFT JOIN comments
                   ON comments.commentable_id = projects.id
                       AND comments.commentable_type = 'Project'
GROUP BY projects.id