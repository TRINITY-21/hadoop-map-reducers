#!/bin/bash
echo "Creating large input file..."

# Create base text content
cat > base_text.txt << EOF
Apache Hadoop is an open-source software framework used for distributed storage and processing of big data using the MapReduce programming model. It consists of computer clusters built from commodity hardware. All the modules in Hadoop are designed with a fundamental assumption that hardware failures are common occurrences and should be automatically handled by the framework.

The Hadoop framework transparently provides both reliability and data motion to applications. Hadoop implements a computational paradigm named MapReduce, where the application is divided into many small fragments of work, each of which may be executed or re-executed on any node in the cluster.

In addition, it provides a distributed file system (HDFS) that stores data on the compute nodes, providing very high aggregate bandwidth across the cluster. Both MapReduce and HDFS are designed so that node failures are automatically handled by the framework.

Hadoop enables applications to work with thousands of computational independent computers and petabytes of data. Its distributed file system facilitates rapid data transfer rates among nodes and allows the system to continue operating in case of node failure. This approach lowers the risk of catastrophic system failure, even if a significant number of nodes become inoperative.

The MapReduce framework consists of a single master JobTracker and one slave TaskTracker per cluster-node. The master is responsible for scheduling the jobs component tasks on the slaves, monitoring them and re-executing the failed tasks. The slaves execute the tasks as directed by the master.

Apache Hadoop consists of two main components: Hadoop Distributed File System (HDFS) for storage, and MapReduce for processing the data. HDFS is highly fault-tolerant and is designed to be deployed on low-cost hardware. HDFS provides high throughput access to application data and is suitable for applications with large data sets.

MapReduce is a programming model and an associated implementation for processing and generating large data sets with a parallel, distributed algorithm on a cluster. A MapReduce job usually splits the input data-set into independent chunks which are processed by the map tasks in a completely parallel manner.
EOF

OUTPUT_FILE="large_input.txt"
TARGET_SIZE_MB=256
CURRENT_SIZE=0

# Remove existing file if present
rm -f $OUTPUT_FILE

echo "Building file of at least ${TARGET_SIZE_MB}MB..."

while [ $CURRENT_SIZE -lt $((TARGET_SIZE_MB * 1024 * 1024)) ]; do
    cat base_text.txt >> $OUTPUT_FILE
    CURRENT_SIZE=$(wc -c < $OUTPUT_FILE)
    echo "Current size: $((CURRENT_SIZE / 1024 / 1024))MB"
done

echo "Created $OUTPUT_FILE with size: $((CURRENT_SIZE / 1024 / 1024))MB"

# Clean up
rm base_text.txt

echo "Large input file created successfully!"