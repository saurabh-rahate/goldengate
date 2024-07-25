Download and put zips at following locations:
goldengate_oracle/213000_fbo_ggs_Linux_x64_Oracle_services_shiphome.zip
goldengate_big_data/214000_ggs_Linux_x64_BigData_services_shiphome.zip

docker-compose up -d --build

docker exec -it source-db sqlplus oggadmin/Admin11@XEPDB1
INSERT INTO customers VALUES (21, 'John', 'Doe', 'john11.doe@example.com');
commit;
INSERT INTO customers VALUES (22, 'Jane', 'Smith', 'jane1.smith@example.com');
commit;
INSERT INTO customers VALUES (23, 'Alice', 'Johnson', 'alice1.johnson@example.com');
commit;

DELETE FROM CUSTOMERS WHERE 1=1;
commit;

Find extract data at: /u02/Deployment/var/lib/data/
