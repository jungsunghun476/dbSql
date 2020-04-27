SELECT empno,ename,hiredate,
        DECODE ( MOD(TO_CHAR(SYSDATE,'YYYY'),2), MOD(TO_CHAR(hiredate,'YYYY'),2), '�ǰ����������','�ǰ�����������')
FROM emp;

NULLó���ϴ� ��� (4���� �߿� ���� ���Ѱɷ� �ϳ� �̻��� ���)
NVL, NVL2...

condition : CASE, DECODE

�����ȹ : �����ȹ�� ����
          ���� ����;
          
emp ���̺� ��ϵ� �����鿡�� ���ʽ��� �߰������� ������ ����
�ش� ������ job�� SALESMAN�� ��� SAL���� 5% �λ�� �ݾ��� ���ʽ��� ���� (ex: sal 100 -> 105)

�ش� ������ job�� MANAGER�̸鼭 deptno�� 10�̸� SAL���� 30% �λ�� �ݾ��� ���ʽ��� ����
                            �� ���� �μ��� ���ϴ� ����� 10% �λ�� �ݾ��� ���ʽ��� ����
                            
�ش� ������ job�� PRESIDENT�� ��� SAL���� 20% �λ�� �ݾ��� ���ʽ��� ����

�׿� �������� sal��ŭ�� ����

SELECT empno, ename, job, sal, 
    DECODE(job,'SALESMAN' ,sal* 1.05,
               'MANAGER',DECODE(deptno,10,sal* 1.3,sal* 1.1),
               'PRESIDENT',sal* 1.2,sal) a                                          
FROM emp;

���� A = (10, 15, 18, 23, 24, 25, 29, 30, 35, 37)
Prime Number �Ҽ� : (23, 29, 37) : COUNT-3, MAX-37, MIN-23, AVG-29.66, SUM-99
��Ҽ� : (10, 15, 18, 24, 25, 30, 37);

GROUP FUNCTION
�������� �����͸� �̿��Ͽ� ���� �׷쳢�� ���� �����ϴ� �Լ�
�������� �Է¹޾� �ϳ��� ������ ����� ���δ�
EX : �μ��� �޿� ���
     emp ���̹����� 14���� ������ �ְ�, 14���� ������ 3���� �μ�(10, 20, 30)�� ���� �ִ�
     �μ��� �޿� ����� 3���� ������ ����� ��ȯ�ȴ�

GROUP BY ����� ���� ���� : SELECT ����� �� �ִ� �÷��� ���ѵ�

SELECT �׷��� ���� �÷�, �׷��Լ�
FROM ���̺�
GROUP BY �׷��� ���� �÷�
[ORDER BY ];

�μ����� ���� ���� �޿� ��
emp ���̺��� �׷� ������ �μ���ȣ�� �ƴ� ��ü �������� ���� �ϴ� ���
SELECT  MAX(sal), --��ü ������ ���� ���� �޿� ��
        MIN(sal), --��ü ������ ���� ���� �޿� ��
        ROUND(AVG(sal),2), --��ü ������ �޿� ���
        SUM(sal), --��ü ������ �޿� ��
        COUNT(sal), --��ü ������ �޿� �Ǽ� (sal �÷��� ���� null�� �ƴ� row�� ��)
        COUNT(*),  --��ü ���� ��
        COUNT(mgr) --mgr �÷��� null�� �ƴ� �Ǽ� null���� count �ȵ�
FROM emp;


* �׷� �Լ��� ���� �μ���ȣ �� ���� ���� �޿��� ���� ���� ������
  ���� ���� �޿��� �޴� ����� �̸��� �� ���� ����
    ==> ���� WINDOW/�м� FUNCTION�� ���� �ذ� ����
    

SELECT deptno, sal
FROM emp
ORDER BY deptno;

----------------------------------------------------
��ǥ ����Ȯ��!
GROUP BY ���� ����� �÷���
    SELECT ���� ������ ������ ???? - ��������
GROUP BY ���� ������� ���� �÷���
    SELECT ���� ������ ???? - �ȵ� ����
    
�׷�ȭ�� ���� ���� ���ڿ�, ��� ���� SELECT ���� ǥ�� �� �� �ִ� (���� �ƴ�);
SELECT  deptno, 'TEST', 1,
        MAX(sal), --��ü ������ ���� ���� �޿� ��
        MIN(sal), --��ü ������ ���� ���� �޿� ��
        ROUND(AVG(sal),2), --��ü ������ �޿� ���
        SUM(sal), --��ü ������ �޿� ��
        COUNT(sal), --��ü ������ �޿� �Ǽ� (sal �÷��� ���� null�� �ƴ� row�� ��)
        COUNT(*),  --��ü ���� ��
        COUNT(mgr) --mgr �÷��� null�� �ƴ� �Ǽ� null���� count �ȵ�
FROM emp
GROUP BY deptno;

GROUP �Լ� ����� NULL ���� ���ܰ� �ȴ�
30�� �μ����� NULL���� ���� ���������� SUM(COMM)�� ���� ���������� ���� �� Ȯ�� �� �� �ִ�
SELECT deptno, SUM(comm)
FROM emp
GROUP BY deptno;

10, 20�� �μ��� SUM(COMM) �÷��� NULL�� �ƴ϶� 0�� �������� NULLó��
* Ư���� ������ �ƴϸ� �׷��Լ� ������� NULL ó���� �ϴ� ���� ���ɻ� ����

NVL(SUM(comm),0) : COMM�÷��� SUM �׷��Լ��� �����ϰ� ���� ����� NVL�� ����(1ȸ ȣ��)
SUM(NVL(comm),0) : ��� COMM�÷��� NVL �Լ��� ������(�ش� �׷��� ROW�� ��ŭ ȣ��) SUM �׷��Լ� ����

SELECT deptno ,NVL(SUM(comm),0), SUM(NVL(COMM,0))
FROM emp
GROUP BY deptno;

signle row �Լ��� where���� ����� �� ������
multi row �Լ�(group �Լ�)�� where���� ����� �� ����
GROUP BY �� ���� HAVING ���� ������ ��� ����

SELECT *
FROM emp
WHERE LOWER(ename) = 'smith';

�μ��� �޿� ���� 5000�� �Ѵ� �μ��� ��ȸ
SELECT deptno, SUM(sal)
FROM emp
WHERE SUM(sal) > 9000
GROUP BY deptno;

SELECT deptno, SUM(sal)
FROM emp
GROUP BY deptno
HAVING SUM(sal) > 9000;

SELECT MAX(sal), MIN(sal), ROUND(AVG(sal),2), SUM(sal), COUNT(sal), COUNT(mgr), COUNT(*)
FROM emp;

SELECT deptno, MAX(sal) MAX_SAL, MIN(sal) MIN_SAL, ROUND(AVG(sal),2) AVG_SAL, SUM(sal) SUM_SAL, COUNT(sal) COUNT_SAL, COUNT(mgr)COUNT_MGR, COUNT(*) COUNT_ALL
FROM emp
GROUP BY deptno;

SELECT DECODE (deptno, 10, 'ACCOUNTING', 20, 'RESEARCH', 30, 'SALES') DNAME,
       MAX(sal) MAX_SAL, MIN(sal) MIN_SAL, ROUND(AVG(sal),2) AVG_SAL, SUM(sal) SUM_SAL, COUNT(sal) COUNT_SAL, COUNT(mgr)COUNT_MGR, COUNT(*) COUNT_ALL
FROM emp
GROUP BY DECODE (deptno, 10, 'ACCOUNTING', 20, 'RESEARCH', 30, 'SALES');

SELECT *
FROM emp;

SELECT TO_CHAR(hiredate,'YYYYMM') hire_yyyymm, count(*) CNT
FROM emp
GROUP BY TO_CHAR(hiredate,'YYYYMM')
ORDER BY TO_CHAR(hiredate,'YYYYMM');

SELECT TO_CHAR(hiredate,'YYYY') hire_yyyymm, count(*) CNT
FROM emp
GROUP BY TO_CHAR(hiredate,'YYYY');

SELECT COUNT(*) CNT
FROM dept;

SELECT * 
FROM emp;

SELECT COUNT(COUNT(*))
FROM emp
GROUP BY deptno;





