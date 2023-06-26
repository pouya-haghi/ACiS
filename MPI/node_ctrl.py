import subprocess
import sys
import time
import json
import concurrent.futures
import node_exec as exec

if __name__ == "__main__":
    # Get args
    node_script = sys.argv[1]
    alveo_ip = sys.argv[2]
    print(alveo_ip)
    alveo_port = int(sys.argv[3])
    print(alveo_port)
    size = int(sys.argv[4])
    port_json = sys.argv[5]
    port_list = json.loads(port_json)

    print("Executing Ping")
    # Ping FPGA
    # Execute ping command
    max_attempts = 5
    attempts = 0

    while attempts < max_attempts:
        try:
            # Execute ping command
            ping_output = subprocess.run(["ping", "-c", "5", alveo_ip], capture_output=True, text=True)

            if ping_output.returncode == 0:
                print(ping_output.stdout)
                break
            else:
                attempts += 1
                print(f"Attempt {attempts}: Ping command failed with return code {ping_output.returncode}")
                print(ping_output.stderr)

        except subprocess.CalledProcessError as err:
            attempts += 1
            print(f"Attempt {attempts}: Error executing ping command: {str(err)}")

        # Sleep for a few seconds before the next attempt
        time.sleep(1)

    if attempts == max_attempts:
        print(f"Failed to reach the target IP after {max_attempts} attempts. Exiting.")
        sys.exit(1)

    with concurrent.futures.ThreadPoolExecutor() as executor:
        futures = {}
        for port in port_list:
            future = executor.submit(exec.execute, alveo_ip, alveo_port, port, size)
            futures[future] = port

        # Wait for all futures to complete
        concurrent.futures.wait(futures)

        # Save output to separate files
        for future, port in futures.items():
            output_file = f"{port}_output.txt"
            with open(output_file, "w") as file:
                file.write(future.result())
