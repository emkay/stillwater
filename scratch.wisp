;; Check for any book
(let ((book (object-player-below "book")))
  (if book
      (set! current-text (hash-get book "text"))))

;; Check for sign, NPC, etc - same pattern
(let ((sign (object-player-below "sign")))
  (if sign
      (set! current-text (hash-get sign "message"))))

;; Generic: is player at offset (dx, dy) from object?
(define (player-near-obj? obj dx dy)
  (let ((ox (/ (hash-get obj "x") tile-size))
        (oy (/ (hash-get obj "y") tile-size)))
    (and (= player-x (+ ox dx))
         (= player-y (+ oy dy)))))

;; Find object where player is at relative position
(define (object-near-player type dx dy)
  (find-first
    (lambda (obj) (player-near-obj? obj dx dy))
    (filter-by-type (map-objects room) type)))

;; Player below = offset (0, 1)
(object-near-player "book" 0 1)

;; Player to the right = offset (-1, 0)
(object-near-player "door" -1 0)
