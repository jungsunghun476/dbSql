SELECT * --��� �÷������� ��ȸ

FROM prod; --�����͸� ��ȸ�� ���̺� ���

--Ư�� �÷��� ���ؼ��� ��ȸ : SELCT �÷�1, �÷�2....
--PROD_id, prod_name�÷��� prod ���̺��� ��ȸ;

SELECT prod_id, prod_name
FROM prod;

�ǽ�1;
--lprod ���̺��� ��� �����͸� ��ȸ�ϴ� ������ �ۼ��ϼ���
SELECT *
FROM lprod;

--buyer ���̺��� buyer_id, buyer_name �÷��� ��ȸ�ϴ� ������ �ۼ��ϼ���
SELECT buyer_id, buyer_name
FROM buyer;

--cart ���̺��� ��� �����͸� ��ȸ�ϴ� ������ �ۼ��ϼ���
SELECT *
FROM cart;

--member ���̺��� mem_id, mem_pass, mem_name �÷��� ��ȸ�ϴ� ������ �ۼ��ϼ���
SELECT mem_id, mem_pass, mem_name
FROM member;

--SQL ���� : JAVA�� �ٸ��� ���� X, �Ϲ��� ��Ģ����
--SQL ������ Ÿ�� : ����, ����, ��¥(date)

--USERS���̺��� (4/14����� ����) ����
--USERS ���̺��� ��� �����͸� ��ȸ
SELECT *
FROM USERS;
--��¥ Ÿ�Կ� ���� ���� : ��¥�� +, - ���� ����
--date type + ���� : date���� ������ ¥��ŭ �̷� ��¥�� �̵�
--date type - ���� : date���� ������ ¥��ŭ ���� ��¥�� �̵�

SELECT userid, reg_dt + 5 after_5days, reg_dt - 5
FROM users;

--�÷� ��Ī : ���� �÷����� ���� �ϰ� ���� ��
--syntax : ���� �÷��� [as] ��Ī��Ī
--��Ī ��Ī�� ������ ǥ���Ǿ�� �� ��� ���� �����̼�(" ")�� ���´�
--���� ����Ŭ������ ��ü���� �빮�� ó�� �ϱ� ������ �ҹ��ڷ� ��Ī�� �����ϱ� ���ؼ���
--���� �����̼��� ����Ѵ�

SELECT userid as id, userid id2, userid ���̵�
FROM users;

�ǽ�2;
--prod ���̺��� prod_id, prod_name �� �÷��� ��ȸ�ϴ� ������ �ۼ��Ͻÿ�
--(�� prod_id �� id, prod_name�� name�� ��Ī����)
SELECT prod_id id, prod_name name
FROM prod;

--lprod ���̺��� lprod_gu, lprod_nm �� �÷��� ��ȸ�ϴ� ������ �ۼ��Ͻÿ�
--(�� lprod_gu �� gu, lprod_nm �� nm���� ��Ī����)
SELECT lprod_gu gu, lprod_nm nm
FROM lprod;

--buyer ���̺��� buyer_id, buyer_name �� �÷��� ��ȸ�ϴ� ������ �ۼ��Ͻÿ�
--(�� buyer_id �� ���̾���̵�, buyer_name�� �̸����� ��Ī����)
SELECT buyer_id ���̾���̵�, buyer_name �̸�
FROM buyer;

--���ڿ� ����(���տ���) : || (���ڿ� ������ + �����ڰ� �ƴϴ�)

SELECT /*userid + 'test'*/ userid || 'test', reg_dt + 5, 'test', 15
FROM users;

-- �� �̸� ��
SELECT '�� ' || userid || ' ��'
FROM users;

--�÷� ����
SELECT userid, usernm, userid || usernm
FROM users;

SELECT userid || usernm id_name,
        CONCAT(userid, usernm) AS concat_id_name
FROM users;

--user_tables : oracle �����ϴ� ���̺� ������ ��� �ִ� ���̺�(view) ==> data dictionary
SELECT table_name
FROM user_tables;

SELECT table_name, 'SELECT * FROM ' || table_name || ';' as QUERY
FROM user_tables;

���̺��� ���� �÷��� Ȯ��
1. tool(sql deeloper)�� ���� Ȯ��
    ���̺� - Ȯ���ϰ��� �ϴ� ���̺�
2. SELECT *
   FROM ���̺�
   �ϴ� ��ü ��ȸ --> ��� �÷��� ǥ��
3. DESC ���̺��
4. data dictionary : user_tab_columns

DESC emp;

SELECT *
FROM user_tab_columns;

���ݱ��� ��� SELECT ����
��ȸ�ϰ��� �ϴ� �÷� ��� : SELECT
��ȸ�� ���̺� ��� : FROM
��ȸ�� ���� �����ϴ� ������ ��� : WHERE
WHERE ���� ����� ������ ��(TRUE)�� �� ����� ��ȸ

sql�� �� ���� : =

SELECT *
FROM users
WHERE 1 = 1;

emp���̺��� �÷��� ������ Ÿ���� Ȯ��;
DESC emp;

SELECT *
FROM emp;

emp ���̺��� ������ ���� �μ���ȣ�� 30������ ū �μ��� ���� ������ ��ȸ;
SELECT *
FROM emp
WHERE deptno >= 30;

!= �ٸ���
users ���̺��� ����� ���̵� (userid)�� brown�� �ƴ� ����ڸ� ��ȸ
SELECT *
FROM users
WHERE userid != 'brown';

SQL ���ͷ�
���� : 1,2,3,4,5,6~
���� : �̱� �����̼� : 'hello world'
��¥ : TO_DATE('��¥���ڿ�', '��¥ ���ڿ��� ����');

1982�� 1�� 1�� ���Ŀ� �Ի��� ������ ��ȸ
SELECT *
FROM emp
WHERE hiredate >= TO_DATE('19820101','YYYYMMDD');

