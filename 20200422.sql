
����. �Ķ���ͷ� YYYYMM������ ���ڿ��� ��� �Ͽ� �ش� ����� �ش��ϴ� ���� ���� ���غ�����('201912' ==> 31)
SELECT TO_CHAR(TO_DATE ('201912','YYMM'),'YYYYMM') param ,TO_CHAR(LAST_DAY(TO_DATE ('201912','YYMM')),'DD') DT
FROM dual;

SELECT TO_CHAR(TO_DATE ('201911','YYMM'),'YYYYMM') param ,TO_CHAR(LAST_DAY(TO_DATE ('201911','YYMM')),'DD') DT
FROM dual;

SELECT TO_CHAR(TO_DATE ('201602','YYMM'),'YYYYMM') param ,TO_CHAR(LAST_DAY(TO_DATE ('201602','YYMM')),'DD') DT
FROM dual;

���ε庯�� (:YYYYMM�� ����Ͽ� ���� ����) 
SELECT TO_CHAR(TO_DATE (:YYYYMM,'YYMM'),'YYYYMM') param ,TO_CHAR(LAST_DAY(TO_DATE (:YYYYMM,'YYMM')),'DD') DT
FROM dual;

EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE empno='7369';

SELECT *
FROM TABLE(DBMS_XPLAN.DISPLAY);

Plan hash value: 3956160932

�����ȹ�� ���� ����(id)
* �鿩���� �Ǿ������� �ڽ� ���۷��̼�
1. ������ �Ʒ���
    *�� �ڽ� ���۷��̼��� ������ �ڽ� ���� �д´�
    
    1 ==> 0
 
--------------------------------------------------------------------------
| Id  | Operation         | Name | Rows  | Bytes | Cost (%CPU)| Time     |
--------------------------------------------------------------------------
|   0 | SELECT STATEMENT  |      |     1 |    38 |     3   (0)| 00:00:01 |
|*  1 |  TABLE ACCESS FULL| EMP  |     1 |    38 |     3   (0)| 00:00:01 | -- emp���̺��� ����
--------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   1 - filter("EMPNO"=7369) -- EMPNO - 7369�� ���͸�


EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE TO_CHAR (empno) = '7369'; -- �����ȹ�� ��û

SELECT *
FROM TABLE(DBMS_XPLAN.DISPLAY);

EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE empno = 7300+'69';

SELECT *
FROM TABLE(DBMS_XPLAN.DISPLAY);

SELECT *
FROM dept;

SELECT ename, sal, TO_CHAR(sal, 'L009,999.00')
FROM emp;

NULL�� ���õ� �Լ�
NVL
NVL2
NULLIF
COALESCE;

�� null ó���� �ؾ��ұ�?
NULL�� ���� �������� NULL�̴�

������ emp ���̺� �����ϴ� sal, comm �ΰ��� �÷� ���� ���� ���� �˰� �;
������ ���� SQL�� �ۼ�.

SELECT empno, ename, sal, comm, sal + comm AS sal_plus_comm
FROM emp;

NVL(expr1, expr2)
expr1�� null�̸� exper2���� �����ϰ�
expr1�� null�� �ƴϸ� expr1�� ����

SELECT empno, ename, sal, comm, sal + NVL(comm, 0) sal_plus_comm
FROM emp;

REG_DT �÷��� NULL�� ��� ���� ��¥�� ���� ���� ������ ���ڷ� ǥ��
SELECT userid, usernm, reg_dt, NVL(reg_dt, LAST_DAY(SYSDATE))
FROM users;
