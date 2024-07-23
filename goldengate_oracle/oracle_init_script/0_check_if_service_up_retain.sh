function is_admin_server_port_open() {
  MAX_RETRIES=10
  RETRY_INTERVAL=5
  PORT=9012

  for i in $(seq 1 $MAX_RETRIES); do
    result=$(ss -tuln | grep ":$PORT ")
    if [ -n "$result" ]; then
      echo "Port $PORT is in use."
      return 0
    fi
    echo "Port $PORT is not in use. Retrying in $RETRY_INTERVAL seconds..."
    sleep $RETRY_INTERVAL
  done

  echo "Port $PORT is not in use after $MAX_RETRIES retries."
  return 1
}

echo "Checking if admin service has started before creating credentials"
is_admin_server_port_open