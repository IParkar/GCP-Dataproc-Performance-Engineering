# GCP-Dataproc-Performance-Engineering
Optimizing Hive &amp; PySpark workflows on Google Cloud

### Overview
This project documents the design and execution of a distributed data processing architecture on Google Cloud Platform. It focuses on programmatically provisioning infrastructure and optimizing large-scale data queries using Apache Hive and PySpark.

## Repository Architecture
* **/infrastructure:** Contains shell scripts for automated cluster deployment, ensuring reproducible environment configuration.
* **/scripts:** Contains operational logic for HDFS querying, Hive performance optimization (partitioning and bucketing), and PySpark integration.
* **/data:** Contains sample datasets and documentation for large-scale data simulation.
* **/assets:** Contains visual evidence and performance benchmarks for project validation.

## Technical Implementation
### Infrastructure Engineering (IaC)
To ensure cost-effective development, I bypassed default cloud configurations by programmatically provisioning `e2-standard-2` compute instances using the `gcloud` CLI. This ensures consistent cluster performance and resource management.
* **Ref:** [`infrastructure/setup_cluster.sh`](./infrastructure/setup_cluster.sh)

### Hive Optimization Strategies
This project handles 1-billion+ record datasets by implementing advanced storage strategies:
* **Partitioning:** Data is organized by `country` to minimize I/O contention and prevent full-table scans.
* **Bucketing:** High-cardinality columns (e.g., `customer_id`) are bucketed to enhance join performance and optimize data distribution.
* **Ref:** [`scripts/hive_partitioning`](./scripts/hive_partitioning), [`scripts/hive_bucketing`](./scripts/hive_bucketing)

### Analytical Processing (PySpark)
The project includes a PySpark bridge designed to extract processed data from the Hive Metastore into distributed Spark DataFrames, enabling high-speed analytical transformations.
* **Ref:** [`scripts/cli_spark`](./scripts/cli_spark)

## Benchmarks & Validation
| **Ingestion** | [HDFS Data Sync Progress](./assets/ingestion_progress.png) |
| **Hive Performance** | [Partitioned Query Output](./assets/hive%20country%20avg%20output.png) |
| **PySpark Bridge** | [DataFrame Extraction](./assets/pyspark_integration_result.png) |
| **Cluster Monitoring** | [MapReduce Job Execution](./assets/mapreduce_job_monitor.png) |
