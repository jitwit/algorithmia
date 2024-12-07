(load "../aoc/load.ss")

(define (string-split S sep)
  (string-tokenize S (char-set-complement (apply char-set (string->list sep)))))

(define tree)
(define input (with-input-from-file "input/06a.in" lines-raw))
(define fruit "@")
;; populate hashtables for parent/child relationships
(define (populate)
  (set! tree (make-hashtable string-hash string=?))
  (for-each (lambda (line)
              (let* ((edges (string-split line ":"))
                     (parent (car edges))
                     (children (string-split (cadr edges) ",")))
		(for-each (lambda (child)
                            (cond ((equal? child fruit)
                                   (hashtable-set! tree
						   fruit
						   (cons parent
							 (hashtable-ref tree fruit '()))))
                                  (else (hashtable-set! tree child parent))))
                          children)))
            input))

(define (path-to-root node)
  (call/cc
   (lambda (bug/ant)
     (let lp ((node node))
       (match (hashtable-ref tree node #f)
	 ("ANT" (bug/ant 'bug/ant))
	 ("BUG" (bug/ant 'bug/ant))
	 (#f (list node))
	 (parent (cons node (path-to-root parent))))))))

(define (fruit-paths)
  (define nodes (hashtable-ref tree fruit '()))
  (define paths (remv 'bug/ant (map path-to-root nodes)))
  (define powerful-length
    (cdr (assq 1 (map swap (eq-histogram (map length paths))))))
  (define powerful-fruit
    (car (filter (lambda (path)
		   (= powerful-length (length path)))
		 paths)))  
  (reverse (cons fruit powerful-fruit)))

(define (part-a)
  (apply string-append (fruit-paths)))

(populate)
(format #t "part i:   ~s~%" (part-a))

(define tree (make-hashtable string-hash string=?))
(define input (with-input-from-file "input/06b.in" lines-raw))

(define (part-b)
  (list->string
   (map (lambda (node)
	  (string-ref node 0))
	(fruit-paths))))

(populate)
(format #t "part ii:  ~s~%" (part-b))

(define tree (make-hashtable string-hash string=?))
(define input (with-input-from-file "input/06c.in" lines-raw))

(define (part-c)
  (list->string
   (map (lambda (node)
	  (string-ref node 0))
	(fruit-paths))))

(time (populate))
(format #t "part iii: ~s~%" (part-c))
