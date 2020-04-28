SELECT empno, ename, emp.deptno, dname
FROM emp, dept
WHERE emp.deptno = dept.deptno AND (emp.sal >2500);

SELECT empno, ename, emp.deptno, dname
FROM emp, dept
WHERE emp.deptno = dept.deptno AND sal>2500 AND empno > 7600 AND dname ='RESEARCH';

SELECT lprod_gu, lprod_nm, prod_id, prod_name
FROM prod, lprod
WHERE prod.prod_lgu = lprod.lprod_gu;

SELECT buyer_id, buyer_name, prod_id, prod_name
FROM buyer, prod
WHERE buyer.buyer_id = prod.prod_buyer;

SELECT COUNT(*)
FROM buyer, prod
WHERE buyer.buyer_id = prod.prod_buyer;

BUYER_NAME 별 건수 조회 쿼리 작성
SELECT buyer_name, COUNT(buyer_name)
FROM buyer, prod
WHERE buyer.buyer_id = prod.prod_buyer
GROUP BY buyer_name;

SELECT mem_id, mem_name, prod_id, prod_name, cart_qty
FROM member, cart, prod
WHERE member.mem_id = cart.cart_member AND cart.cart_prod = prod.prod_id;

테이블 JOIN 테이블 ON/USING

SELECT mem_id, mem_name, prod_id, prod_name, cart_qty
FROM member JOIN cart ON (member.mem_id = cart.cart_member) 
JOIN prod ON (cart.cart_prod = prod.prod_id);

참고사항
SELECT deptno, COUNT(*)
FROM emp
GROUP BY deptno;

SELECT *
FROM customer;

SELECT *
FROM product;

cycle : 애음주기
cid : 고객 id
pid : 제품 id
day : 애음요일 (일요일-1 월요일-2 ...)
cnt : 수량

SELECT *
FROM cycle;

SELECT *
FROM customer, cycle
WHERE customer.cid = cycle.cid AND cnm in ('brown','sally');

ANSI -- 에서는 customer. cycle.을 쓰면 안됨
SELECT cid, cnm, pid, day, cnt
FROM customer NATURAL JOIN cycle
WHERE customer.cnm IN ('brown','sally');

SELECT customer.cid, cnm, cycle.pid, pnm, day, cnt
FROM customer, cycle, product
WHERE customer.cid = cycle.cid AND product.pid = cycle.pid AND cnm in ('brown','sally');

SELECT customer.cid, cnm, cycle.pid, pnm, SUM(CNT) cnt 
FROM customer, cycle, product 
WHERE customer.cid = cycle.cid AND product.pid = cycle.pid
GROUP BY customer.cid, cnm, cycle.pid, pnm;

SELECT cycle.pid, pnm, SUM(cnt)
FROM cycle, product 
WHERE cycle.pid = product.pid
GROUP BY cycle.pid, pnm  ;

SELECT a.pid, b.pnm, a.cnt
FROM
(SELECT pid, SUM(cnt) cnt
FROM cycle
GROUP BY cycle.pid) a,product b
WHERE a.pid = b.pid;













