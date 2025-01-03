(load "../aoc/load.ss")
(define leaves
  (map list->vector
       (n-tuples 3 (with-input-from-file "output/leaves.txt" input))))
(define tree
  (map list->vector
       (n-tuples 3 (with-input-from-file "output/tree.txt" input))))
(define kdt
  (kd:alist->tree (map cons tree (iota (length tree)))))

(defmemo (adjacent v : equal-hash equal?)
  (remove (curry equal? v) 
	  (map (compose car kd:leaf->pair)
	       (kd:closed-nhood kdt v 1 kd:l1))))

(define (murkiness tap)
  (define D (bfs-result-distances (bfs tap adjacent)))
  (fold-left + 0
	     (map (lambda (leaf)
		    (hashtable-ref D leaf +inf.0))
		  leaves)))

(format #t "part iii: ~a~%"
	(apply min
	       (map murkiness
		    (filter (lambda (v)
			      (andmap zero? (list-head (vector->list v) 2)))
			    tree))))
