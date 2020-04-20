table���� ��ȸ/���� ������ ����
==> ORDER BY �÷��� ���Ĺ��,.....

ORDER BY �÷����� ��ȣ �� ���� ����
==> SELECT �÷��� ������ �ٲ�ų�, �÷� �߰��� �Ǹ� ���� �ǵ���� �������� ���� ���ɼ��� ����

SELECT�� 3��° �÷��� �������� ����
SELECT *
FROM emp
ORDER BY 3;

��Ī���� ����
�÷����ٰ� ������ ���� ���ο� �÷��� ����� ���
SAL*DEPTNO SAL_DEPT

SELECT empno, ename, sal, deptno, sal*deptno sal_dept
FROM emp
ORDER BY sal_dept;

����. dept ���̺��� ��� ������ �μ��̸����� �������� ���ķ� ��ȸ�ǵ��� ������ �ۼ��ϼ���
SELECT *
FROM dept
ORDER BY dname;

����. dept ���̺��� ��� ������ �μ���ġ�� �������� ���ķ� ��ȸ�ǵ��� ������ �ۼ��ϼ���
SELECT *
FROM dept
ORDER BY loc desc;

����. emp ���̺��� ��(comm) ������ �ִ� ����鸸 ��ȸ�ϰ�, �󿩸� ���� �޴� ����� ���� ��ȸ�ϵ��� �ϰ� �󿩰� ���� ��� ������� ������������
(�󿩰� 0�λ���� �󿱰� ���°����� ����)
SELECT *
FROM emp
WHERE comm != 0
ORDER BY comm DESC,empno;

����. emp ���̺��� �����ڰ� �ִ� ����鸸 ��ȸ�ϰ� ���������� �������� �����ϰ� ������ ���� ��� ����� ū ����� ���� ��ȸ���Ƿ� ������ �ۼ��ϼ���
SELECT *
FROM emp
WHERE mgr IS NOT NULL
ORDER BY job , empno DESC;

���� emp ���̺��� 10�� �μ�(deptno) Ȥ�� 30�� �μ��� ���ϴ� ����� �޿�(sal)�� 1500�� �Ѵ� ����鸸 ��ȸ�ϰ� �̸����� �������� ���ĵǵ��� �����ۼ�
SELECT *
FROM emp
WHERE deptno IN (10,30) AND sal > 1500
ORDER BY ename DESC;

����¡ ó���� �ϴ� ����
1. ������ �ʹ� �����ϱ�
    . �� ȭ�鿡 ������ ��뼺�� ��������
    . ���ɸ鿡�� ��������
    
����Ŭ���� ����¡ ó�� ��� ==> ROWNUM

ROWNUM : SELECT ������� 1������ ���ʴ�� ��ȣ�� �ο����ִ� Ư�� KEYWORD

SELECT ROWNUM, empno, ename
FROM emp;

SELECT���� *ǥ���ϰ� �޸��� ���� �ٸ� ǥ�� (EX ROWNUM)�� ����Ұ��
*�տ� � ���̺� ���Ѱ��� ���̺� ��Ī/��Ī�� ����ؾ� �Ѵ�
SELECT ROWNUM, e.*
FROM emp e;

����¡ ó���� ���� �ʿ��� ����  
1. ������ ������(10)
2. ������ ���� ����

1-page : 1~10
2-page : 11~20 (11~14)

1.������ ����¡ ����
SELECT ROWNUM, empno, ename
FROM emp
WHERE ROWNUM BETWEEN 1 AND 10;

2.������ ����¡ ����

SELECT ROWNUM, empno, ename
FROM emp
WHERE ROWNUM BETWEEN 11 AND 20;

ROWNUM�� Ư¡
1. ORACLE���� ����
    . �ٸ� DBMS�� ��� ����¡ ó���� ���� ������ Ű���尡 ���� (LIMIT)
2. 1������ ���������� �д°�츸 ����
    ROWNUM BETWEEN 1 AND 10 ==> 1-10
    ROWNUM BETWEEN 11 AND 20 ==> 1~10�� SKIP�ϰ� 11~20 �������� �õ�
    
    WHERE ������ ROWNUM�� ����� ��� ���� ����
    ROWNUM = 1;
    ROWNUM BETWEEN : AND N;
    ROWNUM <, <= N (1~N)
 
ROWNUM�� ORDER BY   
SELECT ROWNUM, empno, ename
FROM emp
ORDER BY empno;

SELECT ROWNUM, empno, ename
FROM emp
ORDER BY ename;

ROWNUM�� ORDER BY ������ ����
SELECT -> ROWNUM -> ORDER BY

ROWNUM�� ��������� ���� ������ �� ���·� ROWNUM�� �ο��Ϸ��� IN-LINE VIEW�� ����ؾ� �Ѵ�
** IN_LINE : ���� ����� �ߴ�;

SELECT a.*
FROM
    (SELECT ROWNUM rn, a.*
    FROM 
        (SELECT empno, ename
         FROM emp
         ORDER BY ename) a ) a
WHERE rn BETWEEN 1 + (:page -1) * :pageSize AND : page * :pageSize;

WHERE rn BETWEEN 1 AND 10; 1 PAGE
WHERE rn BETWEEN 11 AND 20; 2 PAGE
WHERE rn BETWEEN 21 AND 30; 3 PAGE
.
.
.
WHERE rn BETWEEN 1+(n-1)*10 AND pageSize * n ; n PAGE;

����
SELECT *
FROM
(SELECT empno, ename
FROM emp
ORDER BY ename);

INLINE-VIEW�� �񱳸� ���� VIEW�� ���� ����(�����н�, ���߿� ���´�)
VIEW - ����

DML - Data Manipulation Language : SELECT, INSERT, UPDATE, DELETE
DDL - Data Definition Language : CREATE, DROP, MODIFY, RENAME

CREATE OR REPLACE VIEW emp_ord_by_ename AS
    SELECT empno, ename
    FROM emp
    ORDER BY ename;
    
 IN-LINE VIEW�� �ۼ��� ����   
SELECT *
FROM (SELECT empno, ename
      FROM emp
      ORDER BY ename);
      
view�� �ۼ��� ����
SELECT *
FROM emp_ord_by_ename;

emp ���̺� �����͸� �߰��ϸ�
in-line view, view�� ����� ������ ����� ��� ������ ������???


���� �ۼ��� ������ ã�ư���
SQL : ����� ���� ����

����¡ ó�� ==> ����, ROWNUM
���� , ROWNUM�� �ϳ��� �������� ������ ��� ROWNUM���� ������ �Ͽ�
���ڰ� ���̴� ���� �߻� ==> INLINE-VIEW
    ���Ŀ� ���� INLINE-VIEW
    ROWNUM�� ���� INLINE-VIEW

SELECT *
FROM
(SELECT ROWNUM rn, a.* --*�� ���� ���ؼ��� INLINE-VIEW�� �̸��� �ʿ�  /// rn�� INLIVE-VIEW�� ��Ī
FROM
    (SELECT empno, ename
     FROM emp
     ORDER BY ename) a) --a�� INLINE-VIEW �� �̸�
--WHERE ROWNUM BETWEEN 11 AND 20 ==> ���� ���� ���������� �����ϱ⶧���� 11�ȵ�
WHERE rn BETWEEN 11 AND 20;

emp ���̺��� ��� ������ �̸��÷����� �������� ���� ���� ���� 11~14��° ���� ������ ���� ��ȸ�ϴ� ������ �ۼ��غ�����
SELECT *
FROM
(SELECT ROWNUM rn, a.*
FROM
(SELECT empno, ename
FROM emp
ORDER BY ename)a)
WHERE rn BETWEEN 11 AND 20;

SELECT ROWNUM rn, a.*
FROM
(SELECT empno, ename
FROM emp)a
WHERE ROWNUM BETWEEN 1 AND 10;

PROD ���̺��� PROD_LGU (��������), PROD_COST(���� ����)���� �����Ͽ�
����¡ ó�� ������ �ۼ� �ϼ���
�� ������ ������� 5
���ε� ���� ����� ��
SELECT a.*
FROM
    (SELECT ROWNUM rn , a.*
    FROM
        (SELECT *
         FROM prod
         ORDER BY prod_lgu DESC , prod_cost)a)a
WHERE rn BETWEEN 1 + (:page -1) * :pageSize AND :page * :pageSize;

