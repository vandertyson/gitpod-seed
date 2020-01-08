NOW=$(date '+%Y%m%d_%H%M%S')
OUTPUT_FILE="bench_result_"$NOW".json"
java -Dbroker=tcp://localhost:1883 -jar target/benchmarks.jar \
     $1 \
    -bm Throughput \
    -f 2 \
    -i 10 \
    -rf JSON \
    -rff $OUTPUT_FILE \
    -t 2 \
    -v EXTRA \
    -wi 2
