### Installation and Setup Instructions

#### 1. Download and Place ZIPs

Download the following ZIP files and place them in the specified directories:

- `goldengate_oracle/213000_fbo_ggs_Linux_x64_Oracle_services_shiphome.zip`
- `goldengate_big_data/214000_ggs_Linux_x64_BigData_services_shiphome.zip`

#### 2. Build and Start Docker Containers

Run the following command to build and start the Docker containers in detached mode:

```bash
docker-compose up -d --build
```

#### 3. Misc

##### Connect to the source database container using SQL*Plus:
```
docker exec -it source-db sqlplus oggadmin/Admin11@XEPDB1

INSERT INTO customers VALUES (21, 'John', 'Doe', 'john11.doe@example.com');
commit;

INSERT INTO customers VALUES (22, 'Jane', 'Smith', 'jane1.smith@example.com');
commit;

INSERT INTO customers VALUES (23, 'Alice', 'Johnson', 'alice1.johnson@example.com');
commit;

DELETE FROM CUSTOMERS WHERE 1=1;
commit;
```

##### Trail data can be found at:
```
/u02/Deployment/var/lib/data/
```
