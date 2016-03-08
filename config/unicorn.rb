# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/home/deploy/www/unicorn"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "/home/deploy/www/unicorn/shared/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "/home/deploy/www/unicorn/shared/log/unicorn.log"
stdout_path "/home/deploy/www/unicorn/shared/log/unicorn.log"

# Unicorn socket
listen "/home/deploy/www/unicorn/shared/sockets/unicorn.sock"
listen "/home/deploy/www/unicorn/shared/sockets/unicorn.sock"

# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30
